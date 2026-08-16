Istio 
Istio Implemnentation Modes:-
a. Enovy Mode: 
b. Ambient: Istio implements its features using a per-node Layer 4 (L4) proxy, and optionally a per-namespace Layer 7 (L7) proxy.
     a. Ztunnel (L4 Tunnel): The ztunnel (Zero Trust tunnel) component is a purpose-built, per-node proxy that powers Istio’s ambient data plane mode.
     b. waypoint (L7 proxy): It is a lightweight proxy that runs as a sidecar to the application container. 
      It intercepts all incoming and outgoing traffic to and from the application container, allowing Istio to manage
       and control the traffic flow. The waypoint proxy is responsible for enforcing policies, collecting telemetry data, and providing security features such as mutual TLS authentication.

https://istio.io/latest/docs/ambient/overview/


