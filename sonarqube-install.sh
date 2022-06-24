#!/bin/bash
# Author: Group8
# date:6/24/2022
# Description: sonarqube automated installation

# Run process as a regular user


# java1.8 needs to be removed

sudo yum remove java 1.8* -y

if
        [ $? -eq 0 ]
then
# Java - 11 installation
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
else
echo "java installation failed"
fi

# Download sonarqube latest version
cd /opt
# install wget
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

#install unzip

sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip

sudo unzip /opt/sonarqube-9.3.0.51899.zip -A

#change ownership to user vagrant
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

if

        [ $? -eq 0 ]

then

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64

else

echo "Sonarqube ownership change required"

fi

./sonar.sh start
./sonar.sh status