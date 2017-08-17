#gamerentals.com 

This application exists to demonstrate how Continuous Integration and Continuous Deployment (CI/CD) can include the database tier. 

## To Build

To build the first time run [build-with-dependencies.sh](build-with-dependencies.sh) to install the provided libraries to your Maven repository.

	build-with-dependencies.sh

For subsequent builds, just run:

	mvn clean package


## To Run

This application has been proven to run on a multitude of platforms, including Oracle Java Cloud Service, Oracle Application Container Cloud Service, Oracle Container Cloud Service, Oracle Ravello, Oracle WebLogic, Apache Tomcat, Amazon Elastic Beanstalk and anywhere Docker runs.

-Ddb.ip=${DatabaeIP} -Ddb.name=${DatabaseName} -Ddb.user=$(DatabaseUser} -Ddb.pass=${Database Password} -Ddb.edition=${DatabaseEdition} 


clean install -Ddb.ip=140.86.33.194 -Ddb.name=PDB1.dbdevcs14.oraclecloud.internal -Ddb.user=webapp -Ddb.pass=webapp -Ddb.edition=ora$base
