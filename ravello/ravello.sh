#!/bin/bash

#
# login to ravello and store auth information
#
#echo Logging into Ravello...
#curl -X POST -H "Authorization: Basic ZWQuc2huZWtlbmRvcmZAb3JhY2xlLmNvbTpHcmlkMjAyMA==" -H "Content-Type: application/json" --cookie-jar /tmp/ravello_cookie_jar.txt https://cloud.ravellosystems.com/api/v1/login
#curl -X POST -H "Authorization: Basic d2lsbGlhbS5sZW9uYXJkQG9yYWNsZS5jb206QVBBRzlkUEg=" -H "Content-Type: application/json" --cookie-jar /tmp/ravello_cookie_jar.txt https://cloud.ravellosystems.com/api/v1/login
#echo; echo;

#
# get the blueprint list
#
# maybe we parse the blueprint list to get a blueprint ID based on a blueprint name which is a Jenkins parameter?
#
#echo Getting the list of Blueprints...
#curl -X GET --cookie /tmp/ravello_cookie_jar.txt -H "Accept: application/json" https://cloud.ravellosystems.com/api/v1/blueprints/
#echo; echo;

#
# create application
#
# we can probably capture some Jenkins outputs like the build ID to inject into the application name/description.  Also, need to figure out a way to send the keys in
#
echo Creating and publishing the application...
#curl -X POST --cookie /tmp/ravello_cookie_jar.txt -H "Content-Type: application/json" -H "Accept: application/json" -d "{\"name\": \"GameRental-Automatic-Build-123\", \"description\" : \"Jenkins-triggered GameRental Build\", \"baseBlueprintId\": \"87099480\"}" https://cloud.ravellosystems.com/api/v1/applications/
python app-create -b "Ravello CI/CD Demo Blueprint v3" -n "Ravello CI/CD Demo App" -p -s -t 60
echo; echo;

#
# poll application to wait until it starts and sleep until then
#
echo Waiting for application to start...
python app-get-state "Ravello CI/CD Demo App" 

#
# Getting the IP Address of the Tomcat servers...
#
echo Getting the IP Addresses of the Tomcat servers...

python app-get-vm-ip "Ravello CI/CD Demo App" "AppServer 1"
python app-get-vm-ip "Ravello CI/CD Demo App" "AppServer 2"

#python app-get-data "Ravello CI/CD Demo App"


#
# Either SCP WAR file (/home/oracle/jenkins/apps/jenkins/jenkins_home/workspace/GameRentals/target/CIDemo.war) to App1 & App2 or use Maven’s Tomcat deploy plugins
#

#
# logout when done
#
curl -X POST --cookie /tmp/ravello_cookie_jar.txt https://cloud.ravellosystems.com/api/v1/logout
rm /tmp/ravello_cookie_jar.txt