#!/bin/bash
NODE_EXPORTER_VERSION=1.8.2
URL=https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz

# Check if node_exporter is already installed
if [[ $(which node_exporter) ]]; then
  echo "Node Exporter already installed"
  exit 0
fi

# Download Node Exporter if not already downloaded
if [[ ! -f /tmp/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz ]]; then
  wget $URL -P /tmp
fi

# Extract and install Node Exporter
if [[ -f /tmp/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz ]]; then
  tar -xzf /tmp/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz -C /tmp
  sudo mv /tmp/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64/node_exporter /usr/local/bin/
fi

sudo useradd -M -s /bin/false node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
sudo cp node_exporter.service /etc/systemd/system/

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
sudo systemctl status node_exporter
