#!/bin/bash

eval $(ssh-agent -s)
ssh-add ~/.vagrant.d/insecure_private_key

~/.local/bin/ansible-playbook -i ./inventory playbook/k8s.yml



