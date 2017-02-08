FROM noamt/pre-cached-sbt

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENV SBT_OPTS -XX:+CMSClassUnloadingEnabled -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=1g -Xmx2G

EXPOSE 5005

COPY . /usr/src/app

RUN sbt -mem 2048 clean compile

CMD ["sbt", "run"]