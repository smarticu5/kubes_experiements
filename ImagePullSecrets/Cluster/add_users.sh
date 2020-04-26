docker exec kind-control-plane openssl genrsa -out /certs/iain.key 2048
docker exec kind-control-plane openssl req -new -key /certs/iain.key -out /certs/iain.csr -subj "/CN=iain/O=iain"
docker exec kind-control-plane openssl x509 -req -in /certs/iain.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out /certs/iain.crt

docker exec kind-control-plane openssl genrsa -out /certs/not-iain.key 2048
docker exec kind-control-plane openssl req -new -key /certs/not-iain.key -out /certs/not-iain.csr -subj "/CN=not-iain/O=not-iain"
docker exec kind-control-plane openssl x509 -req -in /certs/not-iain.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out /certs/not-iain.crt

docker exec kind-control-plane chmod -R 777 /certs/

kubectl config set-credentials iain --client-certificate=/home/iain/Containers/ImagePullSecrets/Cluster/certs/iain.crt  --client-key=/home/iain/Containers/ImagePullSecrets/Cluster/certs/iain.key
kubectl config set-context iain-kind --cluster=kind-kind --namespace=iain --user=iain

kubectl config set-credentials not-iain --client-certificate=/home/iain/Containers/ImagePullSecrets/Cluster/certs/not-iain.crt  --client-key=/home/iain/Containers/ImagePullSecrets/Cluster/certs/not-iain.key
kubectl config set-context not-iain-kind --cluster=kind-kind --namespace=not-iain --user=not-iain