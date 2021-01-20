
이병민,skcc13,skcc013@gkn2019hotmail.onmicrosoft.com,Skcc@321,Skccadmin1234

http://52.141.57.171:20001/kiali/console/overview?duration=60&refresh=10000

https://github.com/asdfsdfas34/gmfd/blob/main/README.md

skcc13-rsrcgrp

skcc13-cluster

az aks create --resource-group skcc13-rsrcgrp --name skcc13-cluster --node-count 4 --enable-addons monitoring --generate-ssh-keys
az acr create --resource-group skcc13-rsrcgrp --name skcc13 --sku Basic
az aks get-credentials --resource-group skcc13-rsrcgrp --name skcc13-cluster
az acr login -n skcc13 --expose-token
az aks update -n skcc13-cluster -g skcc13-rsrcgrp --attach-acr skcc13

skcc13.azurecr.io/cm-sandbox:v1
az acr build --registry skcc13 --image skcc13.azurecr.io/cm-sandbox:v1 .

az acr build --registry skcc13 --image skcc13.azurecr.io/nginx-blue:latest .

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.8.2 TARGET_ARCH=x86_64 sh -
export PATH=$PWD/bin:$PATH
istioctl
istioctl install --set profile=demo --set hub=gcr.io/istio-release

kubectl apply -f <(istioctl kube-inject -f customer/Deployment.yml) -n istio-test-ns


1. cd ..
2. cd delivery
3. mvn package
4. nano Dockerfile
 	FROM ghcr.io/gkedu/openjdk:8u212-jdk-alpine
 	수정
5. az acr build --registry skcc13 --image skcc13.azurecr.io/delivery:v1 .
6. kubectl create deploy delivery --image=skcc##.azurecr.io/delivery:v1
7. kubectl expose deploy delivery --port=808* --type=ClusterIP

%s/openjdk/ghcr.io\/gkedu\/openjdk/g

kubectl create namespace demo
kubectl label namespace demo istio-injection=enabled
kubectl run siege -n good-morning --image=ghcr.io/gkedu/siege-nginx

az acr build --registry skcc13 --image skcc13.azurecr.io/customer:latest .
az acr build --registry skcc13 --image skcc13.azurecr.io/delivery:latest .
az acr build --registry skcc13 --image skcc13.azurecr.io/foodcatalog:latest .
az acr build --registry skcc13 --image skcc13.azurecr.io/gateway:latest .
az acr build --registry skcc13 --image skcc13.azurecr.io/order:latest .
az acr build --registry skcc13 --image skcc13.azurecr.io/payment:latest .

kubectl create deploy customer    -n good-morning --image=skcc13.azurecr.io/customer:latest
kubectl create deploy delivery    -n good-morning --image=skcc13.azurecr.io/delivery:latest
kubectl create deploy foodcatalog -n good-morning --image=skcc13.azurecr.io/foodcatalog:latest
kubectl create deploy gateway     -n good-morning --image=skcc13.azurecr.io/gateway:latest
kubectl create deploy order       -n good-morning --image=skcc13.azurecr.io/order:latest
kubectl create deploy payment     -n good-morning --image=skcc13.azurecr.io/payment:latest
kubectl create deploy customerhist     -n good-morning --image=skcc13.azurecr.io/customerhist:latest


kubectl expose deploy customer    -n good-morning --port=8080 --type=ClusterIP
kubectl expose deploy delivery    -n good-morning --port=8080 --type=ClusterIP
kubectl expose deploy foodcatalog -n good-morning --port=8080 --type=ClusterIP
kubectl expose deploy gateway     -n good-morning --port=8080 --type=LoadBalancer
kubectl expose deploy order       -n good-morning --port=8080 --type=ClusterIP
kubectl expose deploy payment     -n good-morning --port=8080 --type=ClusterIP


git clone https://github.com/acmexii/mall.git

kubectl -n kafka exec -ti my-kafka-0 -- /usr/bin/kafka-console-consumer --bootstrap-server my-kafka:9092 --topic gmfd --from-beginning

kubectl exec -it siege -c siege -n good-morning -- /bin/bash

siege -c50 -t20S -v --content-type "application/json" 'http://order:8080/orders POST {"productId": "1001", "qty":5}'

http http://order:8080/orders/ productId=1001 qty=5


kubectl create deploy customer --image=skcc13.azurecr.io/order:v1

kubectl -n kafka exec -ti my-kafka-0 -- /usr/bin/kafka-console-consumer --bootstrap-server my-kafka:9092 --topic gmfd --from-beginning

kubectl exec -it siege -- /bin/bash
kubectl exec -it siege -n good-morning -- /bin/bash

http POST http://customer:8080/customers name=rhee phone=01048756828 address=pangyo age=43

http POST http://localhost:8080/customer/customers name=rhee phone=01048756828 address=pangyo age=43

http POST http://foodcatalog:8080/foodCatalogs stock=500 name=cake price=4.0
http GET http://customerhist:8080/customerHists/1

http GET http://customer:8080/myOrders




root@siege:/# http POST http://localhost:8080/orders qty=10 foodcaltalogid=1 customerid=1

http http://gateway:8080/myorders
http POST http://localhost/order/orders qty=5 foodcaltalogid=1 customerid=1

kubectl delete deploy payment
siege -c10 -t1S -v --content-type "application/json" 'http://order:8080/orders POST {"qty": 5, "foodcaltalogid":1 , "customerid":1 }'

kubectl -n kafka exec my-kafka-0 -- /usr/bin/kafka-topics --zookeeper my-kafka-zookeeper:2181 --list

http POST http://customer:8080/customers name=kim phone=011 address=busan age=41

---- zoom --------------
869 4986 2463
cloud@#4
-----------------------


siege -c10 -t5S -v --content-type "application/json" 'http://customer:8080/customers POST {"name":"kim", "phone":"010", "address":"busan", "age":30 }'

실습환경 접속 Key : winter1th

Azure 계정

ID : skcc12@gkn2019hotmail.onmicrosoft.com
PW : Skcc!234


--- 모든서비스 정상 기동 ---


http http://localhost:8088/customers
http http://localhost:8088/foodCatalogs
http http://localhost:8088/deliveries
http http://localhost:8088/foodCatalogs
http http://localhost:8088/orders
http http://localhost:8088/myOrders
http http://localhost:8088/foodCatalogViews

1. 사용자 생성
http POST http://localhost:8088/customers name="hong gil don" phone="010 1234 1230" address="jongroku1 seoul" age=30
http POST http://localhost:8088/customers name="yi sun-sin" phone="010 1234 1231" address="jongroku2 seoul" age=20

2. 사용자 추가
http POST http://localhost:8088/customers name=shin phone=010 address=seoul age=29

3. 물품 추가
http POST http://localhost:8088/foodCatalogs stock=100 name=cake price=4.0

4. 물품 주문
http POST http://localhost:8088/orders qty=5 foodcaltalogid=1 customerid=1

5. 주문 확인
http GET http://customer:8080/myOrders

6. 물품 주문 (추가)
http POST http://order:8080/orders qty=5 foodcaltalogid=1 customerid=1

7. 배송 확인
http GET http://delivery:8080/deliveries

8. 취소 확인
http POST http://localhost:8088/cancellations

http POST http://localhost:8088/pays

http POST http://localhost:8088/foodCatalogs stock=100 name=cake price=4.0
http GET http://foodcatalog:8080/foodCatalogViews







