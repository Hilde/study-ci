#!/usr/bin/env bash

function jdk14() {
  URL="https://download.java.net/java/early_access/jdk14/33/GPL/openjdk-14-ea+33_windows-x64_bin.zip"
  curl -L -o openjdk14.zip $URL
  if [ $? -ne 0 ]; then
    echo JDK downloading failed from $URL
    exit 1
  fi

  7z e openjdk14.zip
  if [ $? -ne 0 ]; then
    echo JDK extracting failed.
    exit 1
  fi
  rm openjdk14.zip
  mv jdk-14 openjdk14
}

function jdk11() {
  URL="https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip"
  curl -L -o openjdk11.zip $URL
  if [ $? -ne 0 ]; then
    echo JDK downloading failed from $URL
    exit 1
  fi

  7z e openjdk11.zip
  if [ $? -ne 0 ]; then
    echo JDK extracting failed.
    exit 1
  fi
  rm openjdk11.zip
  mv jdk-11.0.2 openjdk11
}
