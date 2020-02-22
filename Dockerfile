FROM openjdk:8-jdk

MAINTAINER zhangchang1979@outlook.com

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/ \
    && apt-get clean \
    && apt-get update \
    && apt-get install -y wget

RUN sh -c 'echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list' \
    && wget https://packages.atlassian.com/api/gpg/key/public \
    && apt-key add public \
    && apt-get update \
    && apt-get install -y atlassian-plugin-sdk=6.3.12

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD ["atlas-version"]