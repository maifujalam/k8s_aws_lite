Install Calico:-
1. helm repo add calico https://stevehipwell.github.io/helm-charts/
2. helm pull projectcalico/tigera-operator --version 3.29.2 --untar
3. helm -n tigera-operator install calico tigera-operator --create-namespace
2. helm -n tigera-operator uninstall calico
3. helm -n tigera-operator upgrade calico tigera-operator


Install Metric Server:-
1. helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
2. helm repo update
3. helm search repo metrics-server
4. helm pull metrics-server/metrics-server --version 3.12.1 --untar
5. Update values.yaml
6. helm install metrics-server metrics-server -n kube-system --values metrics-server/values.yaml
7. helm upgrade metrics-server /vagrant/manifests/metrics-server -n kube-system --values /vagrant/manifests/metrics-server/values1.yaml
8. helm -n kube-system uninstall metrics-server

kube-vip:- 
1. helm repo add kube-vip https://kube-vip.github.io/helm-charts 
2. helm repo update
3. helm search repo vip
4. helm pull kube-vip/kube-vip --version 0.4.4 --untar
5. helm pull kube-vip/kube-vip-cloud-provider --version 0.2.2 --untar
6. Update both values.yaml
7. helm install kube-vip --create-namespace --namespace kube-vip /vagrant/manifests/kube-vip/kube-vip
8. helm install kube-vip-cloud-provider --create-namespace --namespace kube-vip /vagrant/manifests/kube-vip/kube-vip-cloud-provider/values1.yaml
9. helm uninstall -n kube-vip kube-vip
10. helm uninstall -n kube-vip kube-vip-cloud-provider

Cert-manager:-
1. helm repo add jetstack https://charts.jetstack.io
2. helm repo update
3. helm search repo cert-manager
4. helm pull jetstack/cert-manager --version=1.15.3 --untar
5. kubectl create ns cert-manager
6. helm -n cert-manager install cert-manager cert-manager --create-namespace
7. helm -n cert-manager upgrade cert-manager
8. helm -n cert-manager uninstall cert-manager

trust-manager:-
1. helm repo add jetstack https://charts.jetstack.io
2. helm repo update
3. helm search repo trust-manager
4. helm pull jetstack/trust-manager --version=1.12.3 --untar

nginx-ingress-controller
1. helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
2. helm repo update
3. helm search repo nginx
4. helm pull ingress-nginx/ingress-nginx --version=4.11.2 --untar
5. kubectl create ns ingress-nginx
6. helm -n ingress-nginx install ingress-nginx ingress-nginx --create-namespace
7. helm uninstall ingress-nginx -n ingress-nginx  && kubectl delete ns ingress-nginx --force
8. helm -n ingress-nginx upgrade ingress-nginx ingress-nginx
9. External load balancer IP: 192.168.56.5

kubernetes-dashboard:
1. helm repo add kubernetes-dashboard  https://kubernetes.github.io/dashboard
2. helm repo update
3. helm search repo dashboard 
4. helm pull k8s-dashboard/kubernetes-dashboard --version=7.5.0 --untar
5. kubectl create ns kubernetes-dashboard
6. helm -n kubernetes-dashboard install kubernetes-dashboard/vagrant/manifests/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
    helm install kubernetes-dashboard  kubernetes-dashboard -n kubernetes-dashboard --create-namespace
7. helm -n kubernetes-dashboard upgrade k8s-dashboard kubernetes-dashboard
8. helm uninstall kubernetes-dashboard -n kubernetes-dashboard && kubectl delete ns kubernetes-dashboard

kube-prometheous-stack
1. helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
2. helm repo update
3. helm search repo kube-prometheus-stack
4. helm pull prometheus-community/kube-prometheus-stack --version=61.8.0 --untar
5. helm -n monitoring install kube-prometheus-stack kube-prometheus-stack --create-namespace OR
   helm -n monitoring install kube-prometheus-stack public-helm-repository/kube-prometheus-stack --create-namespace
6. helm -n monitoring uninstall kube-prometheus-stack
7. helm -n monitoring upgrade kube-prometheus-stack kube-prometheus-stack 
8. Creds: admin/prom-operator [ k -n monitoring get secret kube-prometheus-stack-grafana --template='{{ index .data "admin-password" | base64decode}}' ]

prometheus[not required if using kube prometheous stack]:
1. helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
2. helm repo update
3. helm search repo prometheus
4. helm pull prometheus-community/prometheus --version=25.10.0 --untar
5. helm -n monitoring install prometheus prometheus --create-namespace
6. helm -n monitoring uninstall prometheus
7. helm -n monitoring upgrade prometheus prometheus --create-namespace


Grafana[not required if using kube prometheous stack]:-
1. helm repo add grafana https://grafana.github.io/helm-charts
2. helm repo update
3. helm search repo grafana
4. helm pull grafana/grafana --version=7.2.5 --untar
5. helm -n grafana install grafana grafana --create-namespace
6. helm -n grafana upgrade grafana grafana --create-namespace
7. helm -n grafana uninstall grafana
8. Default pass admin/admin

Docker Registry:-
1. helm repo add twuni https://helm.twun.io
2. helm repo update
3. helm search repo registry
4. helm pull twuni/docker-registry --version=2.2.2 --untar
5. helm -n image-registry install docker-registry docker-registry --create-namespace
6. helm -n image-registry upgrade docker-registry docker-registry --create-namespace
7. helm -n image-registry uninstall docker-registry
8. Creds: cluster-url: docker-registry:5000  curl -X GET https://docker-registry.master.com/v2/_catalog -k

Blackbox Exporter:-
1. helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
2. helm search repo blackbox
3. helm pull prometheus-community/prometheus-blackbox-exporter --version=9.0.0 --untar
4. helm -n blackbox-exporter install blackbox prometheus-blackbox-exporter --create-namespace
5. helm -n blackbox-exporter upgrade blackbox prometheus-blackbox-exporter
6. helm -n blackbox-exporter uninstall blackbox

Argocd:
1. helm repo add argo https://argoproj.github.io/argo-helm
2. helm repo update
3. helm search repo argo-cd
4. helm pull argo/argo-cd --version 7.6.7 --untar
5. helm -n argo-cd install argo-cd argo-cd --create-namespace
6. helm -n argo-cd uninstall argo-cd && kubectl delete ns argo-cd --force
7. helm -n argo-cd upgrade argo-cd argo-cd

hello-kubernetes:-
1. helm install helloworld hello-kubernetes
2. helm upgrade helloworld hello-kubernetes
3. helm uninstall helloworld

hello-kubernetes-2:-
1. helm -n hello2 install hello2 hello-kubernetes --create-namespace

Rancher Local path provisioner: -
1. helm repo add eugenmayer https://eugenmayer.github.io/helm-charts/
2. helm search repo localpath
3. helm pull eugenmayer/localpath --version 1.2.0
4. helm -n local-path-storage install local-path-storage public-helm-repository/localpath --version=1.2.0 --create-namespace --namespace local-path-storage
   helm install local-path-storage public-helm-repository/localpath --version=1.2.0
5. helm -n local-path-storage upgrade local-path-storage public-helm-repository/localpath --version=1.2.0

Jenkins with agent:-
1. helm repo add jenkins https://charts.jenkins.io
2. helm repo update
3. helm search repo jenkins
4. helm pull jenkins/jenkins --version 5.7.3 --untar
5. helm -n jenkins install jenkins jenkins --create-namespace
6. helm -n jenkins uninstall jenkins
7. Username: admin  pass_exract: kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

Hashicorp Vault:-
1. helm repo add hashicorp https://helm.releases.hashicorp.com
2. helm repo update
3. helm search repo vault
4. helm pull hashicorp/vault --version 0.28.1 --untar
5. helm -n vault install vault vault --create-namespace
6. helm -n vault uninstall vault

AWS CSI Driver:-
1. helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver/
2. helm repo update
3. helm search repo csi 
4. helm pull aws-ebs-csi-driver/aws-ebs-csi-driver  --version 2.36.0 --untar
5. helm -n aws-ebs-csi-driver install aws-ebs-csi-driver aws-ebs-csi-driver --create-namespace

Helm Package:-
1. Build number is based on Char.yaml->version
2. Helm package: h package hello-kubernetes
3. helm  

Dex OIDC:
1. helm repo add dex https://charts.dexidp.io
2. helm repo update
3. helm search repo dex
4. helm pull dex/dex --version 0.22.1 --untar
5. helm -n dex install dex dex --create-namespace
6. helm -n dex uninstall dex

OAUTH2 Proxy
1. helm repo add oauth2-proxy https://oauth2-proxy.github.io/manifests
2. helm repo update
3. helm search repo oauth2-proxy
4. helm pull oauth2-proxy/oauth2-proxy --version 7.12.6 --untar
5. helm -n oauth2-proxy install oauth2-proxy oauth2-proxy --create-namespace
6. helm -n oauth2-proxy uninstall oauth2-proxy

ELK:
Elasticsearch:
1. helm repo add elastic https://helm.elastic.co
2. helm repo update
3. helm search repo elasticsearch
4. helm pull elastic/elasticsearch --version 8.5.1 --untar
5. helm -n elasticsearch install elasticsearch elasticsearch --create-namespace 
6. helm -n elasticsearch uninstall elasticsearch

Filebeat:
1. helm repo add elastic https://helm.elastic.co
2. helm repo update
3. helm search repo filebeat
4. helm pull elastic/filebeat --version 8.5.1 --untar
5. helm -n elasticsearch install elasticsearch elasticsearch --create-namespace 
6. helm -n elasticsearch uninstall elasticsearch

Logstash:
1. helm repo add elastic https://helm.elastic.co
2. helm repo update
3. helm search repo logstash
4. helm pull elastic/logstash --version 8.5.1 --untar
5. helm -n logstash install logstash logstash --create-namespace 
6. helm -n logstash uninstall logstash

Kibana:
1. helm repo add elastic https://helm.elastic.co
2. helm repo update
3. helm search repo kibana
4. helm pull elastic/kibana --version 8.5.1 --untar
5. helm -n kibana install kibana kibana --create-namespace 
6. helm -n kibana uninstall kibana

Grafana-Operator:-
1. helm pull oci://ghcr.io/grafana/helm-charts/grafana-operator --version v5.17.1 --untar