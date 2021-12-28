#! /bin/bash
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install git -y
sudo yum install maven -y
if [-s "addressbook-1"]
then
  echo "repo is cloned"
else
 git clone https://github.com/preethid/addressbook-1.git
fi
cd /home/ec2-user/addressbook-1
mvn package