#!/bin/bash
 curl -L https://github.com/projectcalico/calico/releases/download/v3.28.2/calicoctl-linux-amd64 -o calicoctl
 chmod +x ./calicoctl
 sudo mv calicoctl /usr/local/bin/ -v
