#!/usr/bin/env bash

function jdk14() {
  URL="https://download.java.net/java/early_access/jdk14/33/GPL/openjdk-14-ea+33_windows-x64_bin.zip"
  curl -L -o openjdk14.zip $URL
  if [ $? -ne 0 ]; then
    echo JDK downloading failed from $URL
    exit 1
  fi

  unzip openjdk14.zip
  if [ $? -ne 0 ]; then
    echo JDK extracting failed.
    exit 1
  fi
  rm openjdk14.zip
  mv jdk-14 $HOME/jdk-14
}

jdk14
