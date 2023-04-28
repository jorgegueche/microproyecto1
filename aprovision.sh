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