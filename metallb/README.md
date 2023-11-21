### Apply
kubectl apply -f ./metallb/configmap.yaml
### Restart
kubectl delete pods --all -n metallb-system
