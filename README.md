ELK
Source - https://www.youtube.com/watch?v=VpAH2IoMzKw

Minikube ELK - https://blog.knoldus.com/how-to-deploy-elk-stack-on-kubernetes/

<img width="559" height="685" alt="image" src="https://github.com/user-attachments/assets/6f1bba77-75e8-49a7-b021-e13d9d245a6b" />


```
kubectl get pvc -n observability | grep elasticsearch
elasticsearch-data-elasticsearch-es-default-0   Bound    pvc-9186611e-98b8-4fbd-8d5a   5Gi        RWO            default        <unset>                 8d
elasticsearch-data-elasticsearch-es-default-1   Bound    pvc-3ff6f926-a2f4-4d6d-bc5d   5Gi        RWO            default        <unset>                 8d
elasticsearch-data-elasticsearch-es-default-2   Bound    pvc-642cf0b6-583f-4bff-a933   5Gi        RWO            default        <unset>                 8d
```
## check volumes
<img width="386" height="572" alt="image" src="https://github.com/user-attachments/assets/135d6106-3529-4a39-8122-5569416c7f5e" />

```
# See all persistent volume claims
wsl -u testuser kubectl get pvc -n observability

# Check storage usage
wsl -u testuser kubectl exec -it elasticsearch-es-default-0 -n observability -- df -h

# Check Elasticsearch data directory
wsl -u testuser kubectl exec -it elasticsearch-es-default-0 -n observability -- ls -la /usr/share/elasticsearch/data
```
