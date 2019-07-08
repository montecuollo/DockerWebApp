FROM tomcat:latest
ADD DockerWebApp.war /usr/local/tomcat/webapps/
ADD mariadb-java-client-2.3.0.jar /usr/local/tomcat/lib
EXPOSE 8080
CMD chmod +x /usr/local/tomcat/bin/catalina.sh
CMD ["catalina.sh", "run"]