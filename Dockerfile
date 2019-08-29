FROM javastreets/mule:latest
COPY ./target/fusiontester-1.0.0-mule-application.jar /opt/mule/apps/
CMD [ "/opt/mule/bin/mule"]