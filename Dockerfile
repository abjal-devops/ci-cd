FROM tomcat:8.0
COPY target/*.war /usr/local/tomcat/webapps
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT.old
RUN sleep 60
RUN mv /usr/local/tomcat/webapps/java-web-project ROOT
CMD ["catalina.sh", "run"]
