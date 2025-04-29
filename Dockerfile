FROM ubuntu:22.04

ENV TZ=UTC
RUN apt-get update && apt-get install -y tzdata

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    sudo \
    wget \
    git \
    usbutils \
    openjdk-11-jdk

# Node.js 18 kurulumu
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN node -v && npm -v

# Appium kurulumu
RUN npm install -g appium
RUN npm install -g appium-doctor

# Android SDK kurulumu
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

RUN mkdir -p $ANDROID_HOME && \
    cd $ANDROID_HOME && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdline-tools.zip && \
    unzip cmdline-tools.zip && \
    mv cmdline-tools cmdline-tools-temp && \
    mkdir -p cmdline-tools/latest && \
    mv cmdline-tools-temp/* cmdline-tools/latest/ && \
    rm -rf cmdline-tools.zip cmdline-tools-temp

RUN yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses || true

EXPOSE 4723

ENTRYPOINT ["appium", "--log", "/appium/logs/appium-server.log", "--log-timestamp"]
