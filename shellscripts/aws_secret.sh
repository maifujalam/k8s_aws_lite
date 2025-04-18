#!/bin/bash

kubectl -n jenkins create secret generic aws-secret --from-literal=AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
--from-literal=AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
