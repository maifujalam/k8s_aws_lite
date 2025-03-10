sudo apt -y update
sudp apt -y upgrade
sudo apt install -y iptables iptables-persistent
cat <<EOF | sudo tee /etc/sysctl.d/nat.conf
  net.ipv4.ip_forward                 = 1
EOF
# Apply sysctl params without reboot
sudo sysctl --system

sudo iptables -t nat -A POSTROUTING -o enX0 -j MASQUERADE

# make IP table persistent
sudo /sbin/iptables -F FORWARD

sudo netfilter-persistent save
sudo netfilter-persistent reload

sudo iptables -t nat -L --line-number

# Disable source destination  check for NAT instance: https://docs.aws.amazon.com/vpc/latest/userguide/work-with-nat-instances.html#EIP_Disable_SrcDestCheck
