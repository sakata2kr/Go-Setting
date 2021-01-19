#!/bin/sh
# 0. 초기화
kubectl delete ns demo
kubectl delete ns kafka
rm -rf $HOME/demo
git clone https://www.github.com/sakata2kr/Team5 ./demo
#git clone https://github.com/asdfsdfas34/gmfd ./demo
kubectl create ns kafka
helm install my-kafka --namespace kafka incubator/kafka

# 1. 소스 빌드 및 이미지 생성
cd $HOME/demo/customer; mvn package; az acr build --registry skcc13 --image skcc13.azurecr.io/customer:latest .
cd $HOME/demo/delivery; mvn package; az acr build --registry skcc13 --image skcc13.azurecr.io/delivery:latest .
cd $HOME/demo/foodcatalog; mvn package; az acr build --registry skcc13 --image skcc13.azurecr.io/foodcatalog:latest .
cd $HOME/demo/gateway; mvn package; az acr build --registry skcc13 --image skcc13.azurecr.io/gateway:latest .
cd $HOME/demo/order; mvn package; az acr build --registry skcc13 --image skcc13.azurecr.io/order:latest .
cd $HOME/demo/payment; mvn package; az acr build --registry skcc13 --image skcc13.azurecr.io/payment:latest .

cd $HOME ;

# 2. demo 네임스페이스 생성 및 siege 적용
kubectl create ns demo
kubectl label namespace demo istio-injection=enabled
kubectl run siege -n demo --image=ghcr.io/gkedu/siege-nginx

# 3. 이미지를 통한 deployment 및 pod 생성
kubectl create deploy customer    -n demo --image=skcc13.azurecr.io/customer:latest
kubectl create deploy delivery    -n demo --image=skcc13.azurecr.io/delivery:latest
kubectl create deploy foodcatalog -n demo --image=skcc13.azurecr.io/foodcatalog:latest
kubectl create deploy gateway     -n demo --image=skcc13.azurecr.io/gateway:latest
kubectl create deploy order       -n demo --image=skcc13.azurecr.io/order:latest
kubectl create deploy payment     -n demo --image=skcc13.azurecr.io/payment:latest

# 4. deployment expose를 통한 service 생성
kubectl expose deploy customer    -n demo --port=8080 --type=ClusterIP
kubectl expose deploy delivery    -n demo --port=8080 --type=ClusterIP
kubectl expose deploy foodcatalog -n demo --port=8080 --type=ClusterIP
kubectl expose deploy gateway     -n demo --port=8080 --type=LoadBalancer
kubectl expose deploy order       -n demo --port=8080 --type=ClusterIP
kubectl expose deploy payment     -n demo --port=8080 --type=ClusterIP
