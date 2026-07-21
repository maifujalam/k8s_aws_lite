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
host_key_checking=false
log_path=/var/log/ansible.log

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

all:
  vars:
    ansible_user: ubuntu
    ansible_ssh_private_key_file: /home/ubuntu/.ssh/id_rsa
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no UserKnownHostsFile=/dev/null'
    ADMIN_PASSWORD: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      30366534363338336539356461353462306130393063353633616564363564333261356562386632
      3564323039346666613665613262626265363662663261650a653662633635643664333731376234
      30623562373065313136653630633665653666643562643931333933316431303665363066313330
      6465633136653466310a333832623433306563323366613466353538643765616332353730666630
      37386162303730373634346532386231336261333862303365636439663264643835
EOF

2. List all the inventory: ansible-inventory --list
3. Ping all hosts: ansible k8s-master -m ping
4. Check machine uptime:  ansible k8s-master -b -m command -a 'uptime' [b: become]
5. Add vault password in bashrc: echo "export ANSIBLE_VAULT_PASSWORD_FILE=/etc/ansible/vault_pass.txt" >> ~/.bashrc

Extract kubernetes dashboard token:-
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d > dashboard_token.txt

Add default app:
ansible-playbook apps/app.yaml 