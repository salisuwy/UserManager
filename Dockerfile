#####################################################################################
# This is a docker file to build my docker image 
#    It is using the official node image 
#    To create a container from this image, run: "docker container run --name <prefered-container-name> -p 3000:3000 -d salisuwy"
####################################################################################

# using official node image from docker hub
FROM node

# create a folder "UserManager" to store our source code
RUN mkdir UserManager

# Change the container directory (pwd) to the created folder
WORKDIR UserManager

# Copy all the content(Source code) of the current dir on the host 
# to the current dir in the container i.e UserManager
COPY . .

# exposing port 3000 of the container to the host
EXPOSE 3000

# run npm install to install all our app dependencies i.e. express, mongoose, body-parser etc 
RUN npm install

# The command "npm start" to run when we create a container from this image. 
# That means our app will be started automatically 
CMD [ "npm", "start" ]