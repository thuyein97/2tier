ls
ls -ltr
ip a
ls
chmod +x kuberenets.sh 
source kuberenets.sh 
xit
sudo apt install containerd -y
sudo apt install apt-transport-https curl -y
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml > /dev/null
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
sudo systemctl restart containerd
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo vi /etc/fstab 
sudo modprobe overlay
sudo modprobe br_netfilter
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo kubeadm init --pod-network-cidr=10.244.0.0/16
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
kubectl config image pull
kubectl config pull image
kubeadm config image pull
kubeadm config pull image
kubeadm config -h
kubeadm config images pull
sudo kubeadm config images pull
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
kubectl apply -f kube-flannel.yml 
kubectl get config
kubectl get all
kubectl get node
kubectl create cm db-config --from-literal=MYSQL_DATABASE=sqldb --dry-run=client -o yaml > db-config.yaml
kubectl create secret  generic db-secret --from-literal=MYSQL_ROOT_PASSWORD=rootpassword --dry-run=client -o yaml > db-secret.yaml
kubectl run mysql-pod --image=mysql --dry-run=client -o yaml > mysql-pod.yaml
kubectl expose pod mysql-pod --name=mysql-svc --port=3306 --target-port=3306 --dry-run=client -o yaml > mysql-svc.yaml
ls
cat mysql-svc.yaml 
vi mysql-pod.yaml 
kubectl expose pod mysql-pod --name=mysql-svc --port=3306 --target-port=3306 --dry-run=client -o yaml > mysql-svc.yaml
kubectl apply -f db-config.yaml db-secret.yaml mysql-pod.yaml 
kubectl apply -f db-secret.yaml
kubectl apply -f db-config.yaml
kubectl apply -f mysql-pod.yaml 
kubectl expose pod mysql-pod --name=mysql-svc --port=3306 --target-port=3306 --dry-run=client -o yaml > mysql-svc.yaml
kubectl apply mysql-svc.yaml 
kubectl apply -f mysql-svc.yaml 
kubectl get all
alias k=kubectl
k get all
k describe pod/mysql-pod
kubectl taint nodes tyt node-role.kubernetes.io/control-plane-
k describe pod/mysql-pod
k get all
kubectl create cm phpadmin-config --from-literal=PMA_HOST=10.106.93.187  --from-literal=PMA_PORT=3306 --dry-run=client > phpadmin-config.yaml
kubectl create secret generic phpadmin-secret --from-literal=PMA_USER=root --from-literal=PMA_PASSWORD=rootpassword --dry-run=client > phpadmin-secret.yaml
kubectl run phpadmin-pod --image=phpmyadmin --dry-run=client -o yaml > phpadmin-pod.yaml
k apply -f phpadmin-config.yaml 
kubectl create cm phpadmin-config --from-literal=PMA_HOST=10.106.93.187 --from-literal=PMA_PORT=3306 --dry-run=client > phpadmin-config.yaml
k apply -f phpadmin-config.yaml 
vi phpadmin-config.yaml 
kubectl create cm phpadmin-config --from-literal=PMA_HOST=10.106.93.187 --from-literal=PMA_PORT=3306 --dry-run=client -o yaml> phpadmin-config.yaml
k apply -f phpadmin-config.yaml 
kubectl create secret generic phpadmin-secret --from-literal=PMA_USER=root --from-literal=PMA_PASSWORD=rootpassword --dry-run=client -o yaml > phpadmin-secret.yaml
k apply -f phpadmin-secret.yaml 
kubectl run phpadmin-pod --image=phpmyadmin --dry-run=client -o yaml > phpadmin-pod.yaml
vi phpadmin-pod.yaml 
k apply -f phpadmin-pod.yaml 
kubectl expose pod phpadmin-pod --name=phpadmin-svc --port=8099 --target-port=80 --type=NodePort --dry-run=client -o yaml > phpadmin-svc.yaml
vi phpadmin-svc.yaml 
kubectl apply -f phpadmin-svc.yaml 
git clone https://github.com/vikash-kumar01/3tier_todo_app.git
k get all
cd 3tier_todo_app/
ls
vi index.php 
sudo apt install docker
docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
k get all
k describe pod/mysql-pod
df -h
cd ..
ls
vi mysql-pod.yaml 
kubectl delete -f mysql-pod.yaml 
kubectl apply -f mysql-pod.yaml 
k get all
k describe pod/phpadmin-pod
vi phpadmin-pod.yaml 
k delete -f phpadmin-pod.yaml 
k apply -f phpadmin-pod.yaml 
k get all
k describe pod/phpadmin-pod
cd 3tier_todo_app/
docker build -t thuyein97/phpapp .
sudo docker build -t thuyein97/phpapp .
k get all
k describe pod/phpadmin-pod
docker pull phpmyadmin
sudo docker pull phpmyadmin
k get all
exit
