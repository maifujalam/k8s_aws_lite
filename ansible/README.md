Install ansible and configure on host machine:
1. sudo apt install ansible-core
2. sudo mkdir -m 777 -v /etc/ansible
3. sudo chown $USER:$GROUP -Rv /etc/ansible
4. Create ansible config file in controller node.Here we are doing it in bastion host as:-

tee /etc/ansible/ansible.cfg <<EOF
[defaults]
inventory=/etc/ansible/inventory.ini
remote_user=ubuntu
ask_pass=false

[privilege_escalation]
become=true
become_method=sudo
become_user=root
become_ask_pass=false
EOF

1. Update host name and its entry in hosts for master and worker.
172.31.64.40 master
172.31.64.41 worker-1
172.31.64.42 worker-2
172.31.64.70 worker-3

2. Create ansible inventory: 
tee /etc/ansible/inventory.ini <<EOF
[k8s-master]
master
[k8s-worker-1]
worker-1
[k8s-worker-2]
worker-2
[k8s-worker-3]
worker-3
EOF

2. List all the inventory: ansible-inventory --list
3. Ping all hosts: ansible k8s-master -m ping
4. Check machine uptime:  ansible k8s-master -b -m command -a 'uptime' [b: become]

Extract kubernetes dashboard token:-
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d > dashboard_token.txt
