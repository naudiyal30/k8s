FROM openjdk:11 

WORKDIR /opt/admin

ARG JAR_FILE=build/libs/admin-*jar
ADD ${JAR_FILE} app.jar

COPY entrypoint.sh .
COPY healthcheck.sh .

RUN chmod +x *.sh

WORKDIR /bin
RUN wget "http://stedolan.github.io/jq/download/linux64/jq" && chmod 755 jq

EXPOSE 8080

ENTRYPOINT ["java","-jar","/opt/admin/app.jar"]
CMD [ "CONFIG_URL", "${CONFIG_URL}" ]
CMD [ "CONFIG_USER", "${CONFIG_USER}" ]
CMD [ "CONFIG_PASS", "${CONFIG_PASS}" ]
CMD [ "ENVIRONMENT", "${ENVIRONMENT}" ]
