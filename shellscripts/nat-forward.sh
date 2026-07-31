sudo apt -y update
sudp apt -y upgrade
sudo apt install -y iptables iptables-persistent netfilter-persistent

# Forward trrafic of ipv4 between interface.
cat <<EOF | sudo tee /etc/sysctl.d/nat.conf
  net.ipv4.ip_forward                 = 1
EOF
# Apply sysctl params without reboot
sudo sysctl --system

# Any packet leaving via interface ens5 (your public NIC) will have its source IP rewritten to the public IP of that interface.
sudo iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE   # WARNING: replace enX0 with your public interface name, e.g. eth0, ens5, etc.

# Flush any forwarding rule present.
sudo /sbin/iptables -F FORWARD

# Reload to make the changes effect.
sudo netfilter-persistent reload

# Lists NAT table rules with line numbers.Confirms that your POSTROUTING MASQUERADE rule is active
sudo iptables -t nat -L --line-number

# Disable source destination  check for NAT instance: https://docs.aws.amazon.com/vpc/latest/userguide/work-with-nat-instances.html#EIP_Disable_SrcDestCheck
