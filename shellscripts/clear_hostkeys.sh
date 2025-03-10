$!/bin/bash
ssh-keygen -f '/home/ubuntu/.ssh/known_hosts' -R 'master'
ssh-keygen -f '/home/ubuntu/.ssh/known_hosts' -R 'worker'
ssh-keygen -f '/home/ubuntu/.ssh/known_hosts' -R '172.31.0.37'
ssh-keygen -f '/home/ubuntu/.ssh/known_hosts' -R '172.31.0.38'
