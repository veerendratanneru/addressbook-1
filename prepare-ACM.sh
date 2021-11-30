#! /usr/bin/env bash
pip3 install ansible -y
ansible --version
pip3 install boto3 -y
ansible-inventory inventory_aws_ec2.yml --list
ansible-playbook docker-deploy.yml