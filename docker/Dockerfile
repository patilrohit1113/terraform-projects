FROM ngnix
COPY ./ /usr/share/nginx/html/
EXPOSE 80

# copy this files to ec2
# you can copy it to the /home/ec2-user
# then bulid the image with using this docker file 
# docker built -t ng-demo:latest
# docker run -d --name demo-cont -p 8080:80 ng-:latest
# in browser we will be see website using http://ec2-ip:8080