
$ErrorActionPreference = "Stop"

# Root directory containing all Terraform folders
$root = Join-Path $PSScriptRoot "envirement"

# Destroy in reverse dependency order
$folders = @(
    "auto_scalling_group",
    "application_lb",
    "target_group",
    "launch_template",
    "nats",
    "rt",
    "igw",
    "security_group",
    "subnets",
    "vpc"
)

Write-Host "`nWARNING: This will destroy AWS resources!" -ForegroundColor Red
Write-Host "Terraform root: $root" -ForegroundColor Cyan

# Verify the root directory
if (-not (Test-Path $root -PathType Container)) {
    Write-Host "ERROR: Environment directory not found: $root" -ForegroundColor Red
    exit 1
}

# Show folders before destroying anything
Write-Host "`nFolders to process:" -ForegroundColor Yellow
foreach ($folder in $folders) {
    $path = Join-Path $root $folder

    if (Test-Path $path -PathType Container) {
        Write-Host "FOUND: $folder" -ForegroundColor Green
    }
    else {
        Write-Host "MISSING: $folder" -ForegroundColor Yellow
    }
}

$confirmation = Read-Host "`nType DESTROY to delete resources"

if ($confirmation -cne "DESTROY") {
    Write-Host "Cancelled. No resources were destroyed." -ForegroundColor Yellow
    exit 0
}

foreach ($folder in $folders) {
    $path = Join-Path $root $folder

    if (-not (Test-Path $path -PathType Container)) {
        Write-Host "`nSkipping missing folder: $folder" -ForegroundColor Yellow
        continue
    }

    # Only process folders containing Terraform configuration
    $tfFiles = Get-ChildItem -Path $path -Filter "*.tf" -File

    if (-not $tfFiles) {
        Write-Host "`nSkipping folder without .tf files: $folder" -ForegroundColor Yellow
        continue
    }

    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "Processing: $folder" -ForegroundColor Cyan
    Write-Host "Path: $path"
    Write-Host "========================================" -ForegroundColor Cyan

    Push-Location $path

    try {
        terraform init -input=false

        if ($LASTEXITCODE -ne 0) {
            throw "Terraform init failed in $folder"
        }

        # Show the destroy plan for review
        terraform plan -destroy -input=false

        if ($LASTEXITCODE -ne 0) {
            throw "Terraform destroy plan failed in $folder"
        }

        $confirmFolder = Read-Host "Type YES to destroy resources in $folder"

        if ($confirmFolder -cne "YES") {
            Write-Host "Skipping destruction of $folder" -ForegroundColor Yellow
            continue
        }

        terraform destroy -auto-approve -input=false

        if ($LASTEXITCODE -ne 0) {
            throw "Terraform destroy failed in $folder"
        }

        Write-Host "Successfully processed: $folder" -ForegroundColor Green
    }
    catch {
        Write-Host "`nERROR: $_" -ForegroundColor Red
        Write-Host "Stopping to avoid further dependency errors." -ForegroundColor Yellow
        exit 1
    }
    finally {
        Pop-Location
    }
}

Write-Host "`nAll folders processed." -ForegroundColor Green
