ECHO OFF

REM get the directory of the window-setup.bat file
SET DIR=%~dp0

REM change directory to the obtained dir
cd %DIR%

REM running build command to build docker image from Dockerfile with name "salisuwy"
REM check "Dockerfile" for more details of the image
docker build -t salisuwy .

REM create container from official mongodb image with name salisuwy-db and publish port 27017 
docker container run --name salisuwy-db -p 27017:27017 -d mongo

REM create a container from salisuwy image with name salisuwy-web and publish port 3000 and 
REM link to salisuwy-db container
docker container run --name salisuwy-web --link salisuwy-db -p 3000:3000 -d salisuwy

REM display output to user
ECHO ********************************************
ECHO ********   CONTAINERS CREATED   ************
ECHO **** "http://<container-ip>:3000/user"  ****
ECHO ********************************************
