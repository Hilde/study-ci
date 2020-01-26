#!/usr/bin/env bash

OS=$TRAVIS_OS_NAME
VERSION="13.0.2"
#SHA256_WIN="d7faba0bb3599ec5b14f8f9838ee35551bc81d2126f6f07ba06ae1ed66c5bbca"
#SHA256_MAC="8c1bc1fbc983b2b08a19f3c306b10b0de3033a978fd08e86917ccbe080c88d0e"

if [ "$OS" == "" ]; then
  echo Specify the os: windows, mac, linux
  exit 1
fi

URL="https://gluonhq.com/download/javafx-${VERSION}-jmods-${OS}/"
curl -L -o openjfx-jmods.zip $URL
if [ $? -ne 0 ]; then
  echo OpenJFX downloading failed from $URL
  exit 1
fi

if [ "$OS" == "windows" ]; then
  7z e openjfx-jmods.zip
else
  unzip openjfx-jmods.zip
fi
if [ $? -ne 0 ]; then
  echo OpenJFX extracting failed.
  exit 1
fi

mv javafx-jmods-${VERSION}/* $JAVA_HOME/jmods/
