#!/bin/bash


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
KUBEPATH=$SCRIPT_DIR/k8s/localhost


BACKEND_CODE_PATH=$(cd $SCRIPT_DIR/../backend && pwd)
cp $KUBEPATH/api.yaml $KUBEPATH/api.modified.yaml 
sed -i -e 's|<BACKEND_CODE_PATH>|'$BACKEND_CODE_PATH'|' $KUBEPATH/api.modified.yaml
[ -f "$KUBEPATH/api.modified.yaml-e" ] && rm -fv "$KUBEPATH/api.modified.yaml-e"
echo "Generated k8s/localhost/api.modified.yaml"

kubectl apply -f $KUBEPATH/postgres.yaml
kubectl apply -f $KUBEPATH/api.modified.yaml