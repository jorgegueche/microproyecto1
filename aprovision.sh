#!/bin/bash

# Instalar Consul
wget https://releases.hashicorp.com/consul/1.11.0/consul_1.11.0_linux_amd64.zip
unzip consul_1.11.0_linux_amd64.zip
sudo chmod +x consul
sudo mv consul /usr/local/bin/

# Configurar Consul
cat <<EOF | sudo tee /etc/consul.d/consul.hcl
datacenter = "dc1"
data_dir = "/opt/consul"
log_level = "INFO"
server = true
bootstrap_expect = 2
ui = true

EOF

# Iniciar Consul
#!/bin/bash

# Actualizar el sistema
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo apt install nodejs
sudo apt install npm

# Instalar dependencias necesarias para Consul
sudo apt-get install -y unzip curl gnupg2 apt-transport-https lsb-release

# Instalar HAProxy
sudo apt-get install -y haproxy

# Instalar LXD/LXC
sudo snap install lxd
sudo lxd init --auto

# Añadir el usuario "vagrant" al grupo "lxd"
sudo usermod -aG lxd vagrant

# Iniciar el servicio de LXD/LXC
sudo systemctl start snap.lxd.daemon.service
#!/bin/bash

# Install HAProxy
apt-get update
apt-get install -y haproxy

# Configure HAProxy
cat << EOF > /etc/haproxy/haproxy.cfg
global
  log /dev/log    local0
  log /dev/log    local1 notice
  chroot /var/lib/haproxy
  stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
  stats timeout 30s
  user haproxy
  group haproxy
  daemon

defaults
  log     global
  mode    http
  option  httplog
  option  dontlognull
  timeout connect 5000
  timeout client  50000
  timeout server  50000

frontend http-in
  bind *:80
  default_backend servers

backend servers
  balance roundrobin
  server backend1 192.168.100.2:80 check
  server backend2 192.168.100.3:80 check
EOF

# Restart HAProxy
systemctl restart haproxy
