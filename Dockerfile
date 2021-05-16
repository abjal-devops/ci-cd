FROM tomcat:8.0
COPY target/*.war /usr/local/tomcat/webapps/
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT.old
RUN unzip /usr/local/tomcat/webapps/*.war -d /usr/local/tomcat/webapps/login
CMD ["catalina.sh","run"]
