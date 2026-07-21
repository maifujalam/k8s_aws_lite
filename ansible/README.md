Install ansible and configure on host machine:
1. sudo apt install ansible-core
2. sudo mkdir -m 777 -v /etc/ansible
3. sudo chown $USER:$GROUP -Rv /etc/ansible
4. Create ansible config file in controller node.Here we are doing it in bastion host as:-

tee /etc/ansible/ansible.cfg <<EOF
[defaults]
inventory=/etc/ansible/inventory.yaml
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
tee /etc/ansible/inventory.yaml > /dev/null <<'EOF'
all:
  vars:
    ansible_user: ubuntu
    ansible_ssh_private_key_file: /home/ubuntu/.ssh/id_rsa
    ansible_ssh_common_args: "-o StrictHostKeyChecking=no"
    ADMIN_PASSWORD: !vault |
      $ANSIBLE_VAULT;1.1;AES256
      38383463633131643737353930646637373437386632316561326533336636316461326265663563
      6565396466303037363064353132643738313430373334360a613963303933656662303565303830
      31643764303665376463323834313030353030393532333330326662353033633139636538316663
      6538363434343336370a666337306264643633623939396161626338326336303936356132383264
      39656539383535663432646464663063316339633461356334363336393362663137

  children:
    k8s-master:
      hosts:
        master:

    k8s-worker-1:
      hosts:
        worker-1:

    k8s-worker-2:
      hosts:
        worker-2:

    k8s-worker-3:
      hosts:
        worker-3:
EOF


2. List all the inventory: ansible-inventory --list
3. Ping all hosts: ansible k8s-master -m ping
4. Check machine uptime:  ansible k8s-master -b -m command -a 'uptime' [b: become]
5. Add vault password in bashrc: echo "export ANSIBLE_VAULT_PASSWORD_FILE=/etc/ansible/vault_pass.txt" >> ~/.bashrc

Extract kubernetes dashboard token:-
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d > dashboard_token.txt

Add default app:
ansible-playbook apps/app.yaml 