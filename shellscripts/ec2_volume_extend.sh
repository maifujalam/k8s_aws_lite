#!/bin/bash
lsblk
growpart /dev/nvme0n1 1
resize2fs /dev/nvme0n1p1
du -hT