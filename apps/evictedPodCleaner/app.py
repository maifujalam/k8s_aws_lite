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
        pods=v1.list_pod_for_all_namespaces(watch=False)
        for pod in pods.items:
            print("Checking Pod:"+pod.metadata.name + " Namespace: " + pod.metadata.namespace + " Status: " + pod.status.phase)
            if pod.status.init_container_statuses:
                print("Got Init container.")
                for init_containers in pod.status.init_container_statuses:
                    print("Checking InitContainer: "+init_containers.name+", of Pod: "+pod.metadata.name)
                    if init_containers.state.terminated is not None:
                        if init_containers.state.terminated.exit_code !=0:
                            print("InitContainer: " +init_containers.name+" Exit code non Zero: "+str(init_containers.state.terminated.exit_code))
                            print("Deleting whole pod to restart it.")
                            v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                            print("Deleted Succeeded Pod " + pod.metadata.name)
                            sleep(300)
                    if init_containers.state.terminated is None:
                        print("InitContainer: " + init_containers.name + " is Not Terminated Gracefully ")
                        print("Deleting whole pod to restart it.")
                        v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                        print("Deleted Succeeded Pod " + pod.metadata.name)
                        sleep(300)

            if pod.status.phase != 'Running':
                print("Non Running Pod"+pod.metadata.name+ " | "+pod.metadata.namespace+" | "+pod.status.phase)
                try:
                    if pod.status.reason or pod.status.phase:
                        if pod.status.reason == "Evicted":
                            print("Deleting Evicted Pod "+pod.metadata.name)
                            v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                            print("Deleted Evicted Pod "+pod.metadata.name)
                        if pod.status.phase == "Succeeded":
                            print("Deleting Succeeded Pod "+pod.metadata.name)
                            v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                            print("Deleted Succeeded Pod "+pod.metadata.name)
                except:
                    print("Failed to get pod status")
        print("Sleeping 1 hr...")
        sleep(3600)