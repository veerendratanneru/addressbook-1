#! /usr/bin/env bash
pip3 install ansible==2.10.7
ansible --version
pip3 install boto3
ansible-inventory -i inventory_aws_ec2.yml --list
ansible-playbook docker-deploy.yml
rm /home/ec2_user/.ssh/id_rsa -y