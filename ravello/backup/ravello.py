import app_get_state 
#!/bin/bash

#
# login to ravello and store auth information
#
# set-cred was called to do this.

#
# get the blueprint list
#
# maybe we parse the blueprint list to get a blueprint ID based on a blueprint name which is a Jenkins parameter?
#


#
# create and publish application
#
# we can probably capture some Jenkins outputs like the build ID to inject into the application name/description.  Also, need to figure out a way to send the keys in
#
#app-create -b "Ravello CI/CD Demo Blueprint v3" -n "Ravello CI/CD Demo App" -p -r "us-east-5"

#
# poll application to wait until it starts and sleep until then
#
appState = app_get_state.main("Ravello CI/CD Demo App")
print appState
while appState != "STARTED":
    print('Waiting for application to start ' + appState)
    time.sleep(5)

#print app_get_state("Ravello CI/CD Demo App")

#
# Either SCP WAR file (/home/oracle/jenkins/apps/jenkins/jenkins_home/workspace/GameRentals/target/CIDemo.war) to App1 & App2 or use Maven's Tomcat deploy plugins
#

#
# logout when done
#
#curl -X POST --cookie /tmp/ravello_cookie_jar.txt https://cloud.ravellosystems.com/api/v1/logout
#rm /tmp/ravello_cookie_jar.txt
