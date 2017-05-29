#!/bin/bash

wget wget -O aprof.jar https://bintray.com/devexperts/Maven/download_file?file_path=com%2Fdevexperts%2Faprof%2Fagent%2F31%2Fagent-31.jar

# Prepare Wildfly
wget http://ntp-ext.krista.ru:8002/nexus/service/local/repositories/open-source/content/ru/krista/wildfly-bas/8.2.1.krista20/wildfly-bas-8.2.1.krista20-WF82-SwitchYard.zip
unzip -u wildfly-bas-8.2.1.krista20-WF82-SwitchYard.zip
rm wildfly-bas-8.2.1.krista20-WF82-SwitchYard.zip

# Prepare Apache Ant
wget http://apache-mirror.rbc.ru/pub/apache//ant/binaries/apache-ant-1.10.1-bin.zip
unzip -u apache-ant-1.10.1-bin.zip
rm apache-ant-1.10.1-bin.zip

wget -O apache-ant-1.10.1/lib/ant-contrib.jar http://search.maven.org/remotecontent?filepath=ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3.jar

mkdir -p dir1
mkdir -p dir2

cp -f ./deployments/* ./jboss-bas-8.2.1.krista20/standalone/deployments/
