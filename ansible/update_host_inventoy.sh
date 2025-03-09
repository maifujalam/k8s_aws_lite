#!/bin/bash
INVENTORY_FILE='/etc/ansible/inventory.ini'
IP=3.111.169.59
K8S_GROUP=k8s_master # For master use group name k8s_master for worker use group name k8s_worker

# Check if the file exists
if [ ! -f "$INVENTORY_FILE" ]; then
    echo "Error: Inventory file does not exist!"
    exit 1
fi

# Find the line number of [k8s_master] and update the next line
sed -i "/\[$K8S_GROUP\]/{n;s/.*/$IP/}" "$INVENTORY_FILE"

# Show success message
echo "Updated the value after [$K8S_GROUP] to $IP"

ansible --ssh-extra-args='-o StrictHostKeyChecking=no' $K8S_GROUP -m ping
