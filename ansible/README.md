Install ansible and configure on hot machine:
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
172.31.0.37 master
172.31.0.38 worker
172.31.0.39 worker1

2. Create ansible inventory: 
tee /etc/ansible/inventory.ini <<EOF
[k8s-master]
master
[k8s-worker]
worker
[k8s-worker1]
worker1
EOF

2. List all the inventory: ansible-inventory --list
3. Ping all hosts: ansible k8s_master -m ping
4. Check machine uptime:  ansible k8s_master -b -m command -a 'uptime' [b: become]

Extract kubernetes dashboard token:-
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d > dashboard_token.txt
