Istio 
Istio Implemnentation Modes:-
a. Sidecar Mode: 
b. Ambient: Istio implements its features using a per-node Layer 4 (L4) proxy, and optionally a per-namespace Layer 7 (L7) proxy.
     a. Ztunnel (L4 Tunnel): The ztunnel (Zero Trust tunnel) component is a purpose-built, per-node proxy that powers Istio’s ambient data plane mode.
     b. waypoint (L7 proxy): It is a lightweight proxy that runs as a sidecar to the application container. 
      It intercepts all incoming and outgoing traffic to and from the application container, allowing Istio to manage
       and control the traffic flow. The waypoint proxy is responsible for enforcing policies, collecting telemetry data, and providing security features such as mutual TLS authentication.

https://istio.io/latest/docs/ambient/overview/


Gateway API?
- It provides dynamic network infrastructure provisioning and advanced traffic routing.
- It classifies the notworking based on roles:-
   a. Infrastructure provider: Creates multiple k8s infras in multiple cloud providers.Like:- ALb,NLB.
   b. Cluster operator: It manages multiple clusters and provides a unified control plane for the clusters.Like:- Istio, Linkerd, Consul, Gateway API.
   c. Application operator: It manages the application deployment and traffic routing within a cluster. 
      It can use the Gateway API to define how traffic should be routed to different services within the cluster, and to configure policies for traffic management, security, and observability.
      Manges Virtual Service, Gateway, HTTPRoute, TCPRoute, TLSRoute, UDPRoute, ReferencePolicy, BackendPolicy, TrafficSplit.

Whats Gateway Class?
Defines a set of gateways with common configuration and managed by a controller that implements the class.
It helps to choose the right gateway for your application based on the requirements and capabilities of the gateway class.
Each gateway class points to a gateway controller:- istio, linkerd, nginx, envoy, traefik, contour, etc.
Gateways controllers are :- istio, linkerd, nginx, envoy, traefik, contour, etc.


Whats a gateway?
A gateway is a Kubernetes resource that defines how traffic should be routed into and out of a cluster
Its a instance of traffic handling infrstructure.

Whats virtualservice?
It selects a gateway and defines how traffic should be routed to different services within the cluster. 
It allows you to specify routing rules based on various criteria, such as the request path, HTTP headers, or the source of the request. 
VirtualServices can also be used to configure policies for traffic management, security, and observability, such as retries, timeouts, and circuit breaking.

