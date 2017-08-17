mvn install:install-file -DgroupId=com.oracle.jdbc -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar -Dfile=ojdbc7.jar
mvn install:install-file -DgroupId=javax.servlet -DartifactId=javax.servlet.servlet-api -Dversion=2.5 -Dpackaging=jar -Dfile=javax.servlet.javax.servlet-api.jar
mvn install:install-file -DgroupId=javax.servlet.jsp -DartifactId=javax.servlet.jsp-api -Dversion=2.1 -Dpackaging=jar -Dfile=javax.servlet.jsp.javax.servlet.jsp-api.jar
mvn clean package

