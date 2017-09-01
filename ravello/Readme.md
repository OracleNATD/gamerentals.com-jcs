# CI/CD with Ravello
Ed Shnekendorf and Brian Leonard, Cloud Platform Architects

----------


There are multiple approaches to CI/CD Nirvana. The right approach will depend on:

1. What you're trying to automate (monolith, mircoservices)
1. Your existing skill set with configuration management and provisioning tools such as [Chef](https://www.chef.io/chef/), [Puppet](https://puppet.com/), [Ansible](https://www.ansible.com/) and [Terraform](https://www.terraform.io/)
1. Your desire and time to learn

With regards to the configuration management and provisioning tools, the results of which are often referred to as [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_Code)(IaC), you may find that [Ravello](https://www.ravellosystems.com/) provides a "shortcut" to achieving the same results.

Ravello provides a graphical, declarative way to to define your configuration, which can then be blueprinted for easy provisioning. This article and associated resources provide an example of how Ravello can fit into your CI/CD narrative when using it as IaC.

## The Application (Game Shop)
For this example we've settled on a 3-tier web application called the Game Shop, which is a store front for video games. The application, which is fronted by an NGINX load-balancer, runs on Tomcat and uses the Oracle 12c database. Represented in Ravello it appears as follows:

![](images/blueprint.JPG)

### Some Notes



- The private IP of thedatabase is 10.0.0.8
- An SSH public key has been added to the VMs



## The Build Tool (Jenkins)
For the purpose of this exercise, Jenkins has been installed from [Bitnami](https://bitnami.com/stack/jenkins) as a separate Ravello application, however any installation of Jenkins should suffice. The following specific actions were taken to configure our instance of Jenkins to work with Ravello:

1. Python and its pip package manager were installed:

    	# curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"; sudo python get-pip.py

1. The [Python SDK](https://github.com/ravello/python-sdk) was installed:

		$ sudo pip install ravello_sdk

1. A `/home/oracle/Ravello` directory was created and populated with the contents of this [ravello](.) directory.

1. A private key file for the public key that you associated with your Ravello VMs was put in the `/home/oracle` directory

2. Jenkins was configured with the following build steps:

		mvn install:install-file -DgroupId=com.oracle.jdbc -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar -Dfile=ojdbc7.jar

		mvn clean package -Ddb.ip=10.0.0.8 -Ddb.name=<db name> -Ddb.user=<db user> -Ddb.pass=<db password> 

		ravelloPublishDeploy.sh

6. [set-creds](set-creds) was run to store our Ravello credentials in an encrypted file to be used by the Ravello SDK. 


## The Magic (Ravello Python SDK)
Ravello has a powerful powerful [Python SDK](https://github.com/ravello/python-sdk) (backed by an equally powerful [REST API](https://www.ravellosystems.com/ravello-api-doc/)) and our intent is to use it do to the following:

1. Authenticate to Ravello
2. Publish an Application from a Blueprint
3. Start the Application
4. Wait for the application start-up to complete
5. Get the IP address of the Tomcat servers
6. Copy the freshly built application to the Tomcat servers

While the above could be achieved entirely in Python, we elected to use a Bash script, [ravelloPublishDeploy.sh](ravelloPublishDeploy.sh), to make calls out to Python. We found the Bash script to be simple to read and edit to meet our needs, while the more static Python scripts would do the heavy lifting behind the scenes. Many of the Python scripts used were lifted directly from the [examples](https://github.com/ravello/python-sdk/tree/master/examples) provided by the SDK.


