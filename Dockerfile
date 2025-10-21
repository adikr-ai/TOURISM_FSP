FROM tomcat:10.0-jdk17
COPY target/Tourism.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
