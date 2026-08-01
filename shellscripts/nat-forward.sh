#!/bin/bash
set -e  # Exit on error

PUBLIC_INTERFACE="${1:-ens5}"

echo "Setting up NAT forwarding on interface: $PUBLIC_INTERFACE"
echo ""

# Update system packages
echo "[1/6] Updating packages..."
sudo apt -y update
sudo apt -y upgrade
sudo apt install -y iptables iptables-persistent

# Enable IPv4 forwarding
echo "[2/6] Enabling IPv4 forwarding..."
cat <<EOF | sudo tee /etc/sysctl.d/nat.conf
net.ipv4.ip_forward = 1
EOF
sudo sysctl --system

# Configure NAT with MASQUERADE
echo "[3/6] Configuring MASQUERADE on $PUBLIC_INTERFACE..."
sudo iptables -t nat -A POSTROUTING -o "$PUBLIC_INTERFACE" -j MASQUERADE

# Configure forwarding rules
echo "[4/6] Setting up FORWARD chain rules..."
sudo iptables -F FORWARD
sudo iptables -P FORWARD ACCEPT

# Persist rules
echo "[5/6] Persisting iptables rules..."
sudo netfilter-persistent save

# Verify configuration
echo "[6/6] Verifying configuration..."
echo ""
echo "NAT Rules:"
sudo iptables -t nat -L --line-number
echo ""
echo "Public IP:"
sudo curl -s ifconfig.me
echo ""
echo ""
echo "✓ NAT configuration complete!"
echo ""
echo "IMPORTANT: Disable source/destination check on this instance:"
echo "  https://docs.aws.amazon.com/vpc/latest/userguide/work-with-nat-instances.html#EIP_Disable_SrcDestCheck"
