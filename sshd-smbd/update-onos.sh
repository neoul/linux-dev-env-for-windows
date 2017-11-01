#!/bin/bash
cd Downloads
KARAF_VERSION=${KARAF_VERSION:-3.0.8}
wget https://downloads.onosproject.org/third-party/apache-karaf-$KARAF_VERSION.tar.gz
wget http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar -zxvf apache-karaf-$KARAF_VERSION.tar.gz -C ../Applications/
tar -zxvf apache-maven-3.3.9-bin.tar.gz -C ../Applications
