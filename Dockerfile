FROM wancharle/docker-android-sdk:testing

ENV CORDOVA_VERSION 7.1.0
ENV NODEJS_VERSION=9.1.0
ENV PATH=$PATH:/opt/node/bin


# instalando nodejs e npm
WORKDIR "/opt/node"
RUN apt-get update && apt-get install -y curl gzip tar ca-certificates --no-install-recommends && \
     curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
     rm -rf /var/lib/apt/lists/* && \
     apt-get clean

# instalando cordova
WORKDIR "/tmp"
RUN npm i -g --unsafe-perm cordova@${CORDOVA_VERSION}

RUN apt-get update && apt-get install -y gradle --no-install-recommends && \
     rm -rf /var/lib/apt/lists/* && \
     apt-get clean

WORKDIR "/root"
RUN cordova telemetry off && cordova create teste com.teste.wan teste && cd teste && cordova platform add android && \
    cordova plugin add cordova-plugin-battery-status && \
    cordova plugin add cordova-plugin-console && \ 
    cordova plugin add cordova-plugin-camera && \ 
    cordova plugin add cordova-plugin-device && \ 
    cordova plugin add cordova-plugin-contacts && \ 
    cordova plugin add cordova-plugin-device-motion && \ 
    cordova plugin add cordova-plugin-device-orientation && \ 
    cordova plugin add cordova-plugin-dialogs && \ 
    cordova plugin add cordova-plugin-file && \ 
    cordova plugin add cordova-plugin-file-transfer && \ 
    cordova plugin add cordova-plugin-geolocation && \ 
    cordova plugin add cordova-plugin-globalization && \ 
    cordova plugin add cordova-plugin-inappbrowser && \ 
    cordova plugin add cordova-plugin-media && \ 
    cordova plugin add cordova-plugin-media-capture && \ 
    cordova plugin add cordova-plugin-network-information && \ 
    cordova plugin add cordova-plugin-splashscreen && \ 
    cordova plugin add cordova-plugin-vibration && \ 
    cordova plugin add cordova-plugin-statusbar && \ 
    cordova prepare && cordova build 





