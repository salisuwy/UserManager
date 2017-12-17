# Python setup file. Should work on windows, linux and mac
# import system to have access to command line util
import os

# running build command to build docker image from Dockerfile with name "salisuwy"
# check "Dockerfile" for more details of the image
os.system('docker build -t salisuwy .')

# create container from official mongodb image with name salisuwy-db and publish port 27017 
os.system('docker container run --name salisuwy-db -p 27017:27017 -d mongo')

# create a container from salisuwy image with name salisuwy-web and publish port 3000 and 
#  link to salisuwy-db container
os.system('docker container run --name salisuwy-web --link salisuwy-db -p 3000:3000 -d salisuwy')

# displaying output on command line
os.system('echo ********************************************')
os.system('echo ********   CONTAINERS CREATED   ************')
os.system('echo **** "http://<container-ip>:3000/user"  ****')
os.system('echo ********************************************')
