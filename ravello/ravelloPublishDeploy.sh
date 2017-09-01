#!/bin/bash

#
# Script meant to be triggered from Jenkins that takes two command line arguments:
#
# 1) Blueprint Name that serves as the base of the application
# 2) Desired Application name
#
# Before this script can be triggered, there are two pre-reqs:
#
# 1) The NAS-Platform-Specialist-GSEv2 private key file must be placed in the parent (../) directory from where this file resides
# 2) The Ravello credentials must be set by running 'python set-creds'
#
# This script will create a Ravello app based on the the desired blueprint, start it in the US-EAST-5 datacenter for 1 hour, and deploy a WAR file to two app servers
#
# This script makes assumptions about the source directory that contains the WAR file, the target directory on the Tomcat7 servers, and the name of the WAR file.  Those can be changed below.
#


#
# Capture command line params
#
BLUEPRINT_NAME=$1
APP_NAME=$2

#
# Create and publish app
#
echo "Creating application with name [$APP_NAME] based on blueprint [$BLUEPRINT_NAME] and publishing"
python app-create -b "$BLUEPRINT_NAME" -n "$APP_NAME" -p -s -t 60 -r us-east-5

#
# Sleep until all VMs are started
#
APP_STATE="INITIAL_STATE"
until [ $APP_STATE = "STARTED" ]
do
	sleep 30
	APP_STATE=`python app-get-state "$APP_NAME"`
    echo "Waiting for all VMs to start.  Current state is [$APP_STATE]"
done
sleep 60 

#
# Extract IP addresses of Tomcat instances
#
echo "Getting Public IPs from App Servers"
PUBLIC_IP_APP_1=`python app-get-vm-ip "$APP_NAME" "AppServer 1"`
PUBLIC_IP_APP_2=`python app-get-vm-ip "$APP_NAME" "AppServer 2"`

#
# SCP WAR file to app servers
#
WAR_NAME=CIDemo.war
SRC_PATH=/home/oracle/jenkins-2.60.3-0/apps/jenkins/jenkins_home/workspace/GameRentals/target/$WAR_NAME
TARGET_DIR=/var/lib/tomcat7/webapps

scp -o StrictHostKeyChecking=no -i ../NAS-Platform-Specialist-GSEv2 $SRC_PATH ravello@$PUBLIC_IP_APP_1:/tmp/
ssh -o StrictHostKeyChecking=no -i ../NAS-Platform-Specialist-GSEv2 ravello@$PUBLIC_IP_APP_1 "sudo mv /tmp/$WAR_NAME $TARGET_DIR"

scp -o StrictHostKeyChecking=no -i ../NAS-Platform-Specialist-GSEv2 $SRC_PATH ravello@$PUBLIC_IP_APP_2:/tmp/
ssh -o StrictHostKeyChecking=no -i ../NAS-Platform-Specialist-GSEv2 ravello@$PUBLIC_IP_APP_2 "sudo mv /tmp/$WAR_NAME $TARGET_DIR"

#
# Wait for DB to start up
#
echo "Pausing for database to start up"
sleep 60
echo "Build and deploy complete"

