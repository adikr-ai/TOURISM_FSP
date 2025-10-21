FROM tomcat:10.0-jdk17
COPY target/ROOT.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
