FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER wangiegie@gmail.com

ENV TZ=Asia/Shanghai
ENV JAVA_OPTS="-Xms128m -Xmx256m -Djava.security.egd=file:/dev/./urandom"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /yshop-app

WORKDIR /yshop-app

EXPOSE 8008

ADD ./target/yshop-app-3.1.jar ./

CMD java $JAVA_OPTS -jar yshop-app-3.1.jar --spring.profiles.active=dev
