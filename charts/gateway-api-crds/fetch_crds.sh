#!/usr/bin/env bash

VERSION=v1.1.0
declare -r -A CRDS=(
  ["standard"]="gatewayclasses gateways httproutes referencegrants grpcroutes"
  ["experimental"]="tlsroutes"
)

for TYPE in standard experimental; do
  for CRD in ${CRDS[${TYPE}]}; do
    BASE_URL="https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/${VERSION}/config/crd/${TYPE}/gateway.networking.k8s.io_${CRD}.yaml"
    echo "${BASE_URL}"
    curl -s "${BASE_URL}" -o "templates/${CRD}.yaml"
  done
done
