#gamerentals.com 

This application exists to demonstrate how Continuous Integration and Continuous Deployment (CI/CD) can include the database tier. 

## To Build

To build the first time run [build-with-dependencies.sh](build-with-dependencies.sh) to install the provided libraries to your Maven repository.

	build-with-dependencies.sh

For subsequent builds, just run:

	mvn clean package


## To Run

This application has been proven to run on a multitude of platforms, including [Oracle Java Cloud Service](https://cloud.oracle.com/en_US/java), [Oracle Application Container Cloud Service](https://cloud.oracle.com/en_US/application-container-cloud), [Oracle Container Cloud Service](https://cloud.oracle.com/en_US/container), [Oracle Ravello](https://cloud.oracle.com/en_US/ravello), [Oracle WebLogic](http://www.oracle.com/technetwork/middleware/weblogic/overview/index.html), [Apache Tomcat](https://tomcat.apache.org/), [Amazon Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) and anywhere Docker runs.

### From Your Host
The build process generates an uber jar with Tomcat embedded. You do need to supply to database connection information:

	java -jar target/CIDemo.jar -Ddb.ip=${DatabaeIP} -Ddb.name=${DatabaseName} -Ddb.user=$(DatabaseUser} -Ddb.pass=${Database Password} -Ddb.edition=${DatabaseEdition}

For example:

	java -jar target/CIDemo.jar -Ddb.ip=140.86.33.194 -Ddb.name=PDB1.dbdevcs14.oraclecloud.internal -Ddb.user=webapp -Ddb.pass=webapp -Ddb.edition=ora$base  
 

### Oracle Java Cloud Service, WebLogic and Tomcat
The build process generates a CIDemo.war, which can be easily deployed to Java Cloud Service, WebLogic or Tomcat (or any other container that can run a war file).

### Oracle Application Container Cloud
The build process generates a CDDemo-ACCS.zip, which includes the embedded Tomcat uber jar and the necessary [manifest.json](manifest.json) that ACCS requires. 

### Oracle Container Cloud Service and Docker
The application includes a [Dockerfile](Dockerfile.). Run

	docker build <container name> . 

Of course, you could just pull the container directly from [DockerHub](https://hub.docker.com/r/wbleonard/gamerentals/) :-).

### Amazon Elastic Beanstalk
The application includes a [Profile](Procfile), which is Amazon's equivalent to the Application Container Cloud's [manifest.json](manifest.json).
 


