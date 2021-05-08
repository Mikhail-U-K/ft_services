minikube stop
minikube delete

minikube start --driver=virtualbox --cpus=4 --memory=4G

minikube addons enable dashboard
minikube addons enable metallb

eval $(minikube -p minikube docker-env)

minikube ssh 'sudo mkdir /mnt/influxdb; sudo chmod 777 /mnt/influxdb '
minikube ssh 'sudo mkdir /mnt/mysql; sudo chmod 777 /mnt/mysql '

kubectl apply -f srcs/configmap.yaml

docker build -t nginx_image ./srcs/nginx/
docker build -t phpmyadmin_image ./srcs/phpmyadmin/
docker build -t wordpress_image ./srcs/wordpress/
docker build -t mysql_image ./srcs/mysql/
docker build -t influxdb_image ./srcs/influxdb/
docker build -t grafana_image ./srcs/grafana/
docker build -t ftps_image ./srcs/ftps/

kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml

minikube dashboard