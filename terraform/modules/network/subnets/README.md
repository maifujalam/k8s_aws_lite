**Auto Create Subnet With Fixed /27 cidr**

1. Create multiple subnets across available zones.
2. It does not attach to route table.Do it separately.
3. These subnets can be used to make private or public subnets.
4. It creats default /27 range subnet resulting into 32 possible ips.But aws consume 5 ip.So 32-5=27 available ip.
5. Note:- We are using /27 as we need least 27 ip because later when we creat load-balancer(ELB) in this subnet ,then it requires minimum 8 available ips.