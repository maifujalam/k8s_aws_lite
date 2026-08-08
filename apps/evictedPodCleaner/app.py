#!/bin/python3
from time import sleep

import kubernetes
from kubernetes import config
if __name__ == '__main__':
    try:
        # Try loading in-cluster config (works if running inside a pod)
        config.load_incluster_config()
        print("Loaded in-cluster Kubernetes config")
    except config.ConfigException:
        try:
            # Fallback to local kubeconfig (works on your laptop/localhost)
            config.load_kube_config()
            print("Loaded local kubeconfig")
        except config.ConfigException:
            print("❌ Failed to load any Kubernetes config")
            raise
    v1=kubernetes.client.CoreV1Api()
    while True:
        print("Sleeping 5 sec...")
        #sleep(5)
        pods=v1.list_pod_for_all_namespaces(watch=False)
        count=0
        for pod in pods.items:
            print("Checking Pod:"+pod.metadata.name + " Namespace: " + pod.metadata.namespace + " Status: " + pod.status.phase)
            if pod.status.phase != 'Running':
                print("Non Running Pod"+pod.metadata.name+ " | "+pod.metadata.namespace+" | "+pod.status.phase)
                try:
                    if pod.status.reason or pod.status.phase:
                        # if pod.status.reason == "Evicted":
                        #     print("Deleting Evicted Pod "+pod.metadata.name)
                        #     v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                        #     print("Deleted Evicted Pod "+pod.metadata.name)
                        # if pod.status.phase == "Succeeded":
                        #     print("Deleting Succeeded Pod "+pod.metadata.name)
                        #     v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                        #     print("Deleted Succeeded Pod "+pod.metadata.name)
                        # Check initContainerStatuses for CrashLoopBackOff
                        if pod.status.init_container_statuses:
                            for init_cs in status.init_container_statuses:
                                if init_cs.state and init_cs.state.waiting and init_cs.state.waiting.reason == "CrashLoopBackOff":
                                    print(f"Deleting pod {pod_name} (initContainer in CrashLoopBackOff)")
                                    #v1.delete_namespaced_pod(name=pod_name, namespace=namespace)
                                    break
                except:
                    print("Failed to get pod status")