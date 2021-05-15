FROM tomcat:8.0
COPY target/*.war /usr/local/tomcat/webapps/
RUN mv /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT.old
COPY startup.sh .
CMD ["sh","startup.sh"]
#CMD ["catalina.sh","run"]
