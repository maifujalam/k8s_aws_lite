#!/bin/python3
from time import sleep

import kubernetes

if __name__ == '__main__':
    kubernetes.config.load_incluster_config()
    v1=kubernetes.client.CoreV1Api()
    while True:
        print("Sleeping 5 sec...")
        sleep(5)
        pods=v1.list_pod_for_all_namespaces(watch=False)
        count=0
        for pod in pods.items:
            print("Checking Pod:"+pod.metadata.name + " Namespace: " + pod.metadata.namespace + " Status: " + pod.status.phase)
            if pod.status.phase != 'Running':
                print("Evicted Pod"+pod.metadata.name+ " | "+pod.metadata.namespace+" | "+pod.status.phase)
            try:
                if pod.status.reason:
                    if pod.status.reason == "Evicted":
                        print("Deleting Evicted Pod "+pod.metadata.name)
                        v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.namespace)
                        print("Deleted Evicted Pod "+pod.metadata.name)

            except:
                print("Failed to get pod status")