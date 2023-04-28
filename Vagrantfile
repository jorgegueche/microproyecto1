# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  if Vagrant.has_plugin? "vagrant-vbguest"
    config.vbguest.no_install  = true
    config.vbguest.auto_update = false
    config.vbguest.no_remote   = true
  end

  config.vm.define :haproxy do |haproxy|
    haproxy.vm.box = "bento/ubuntu-22.04"
    haproxy.vm.network :private_network, ip: "192.168.100.4"
    haproxy.vm.hostname = "haproxy"
    haproxy.vm.provision "shell", path: "aprovision.sh" 
    haproxy.vm.synced_folder "C:/Users/jorge/Documents/miproyecto", "/proyecto"
 end

  config.vm.define :clienteUbuntu do |clienteUbuntu|
    clienteUbuntu.vm.box = "bento/ubuntu-22.04"
    clienteUbuntu.vm.network :private_network, ip: "192.168.100.2"
    clienteUbuntu.vm.hostname = "servidor2Ubuntu"
    clienteUbuntu.vm.provision "shell", path: "aprovision.sh" 
    clienteUbuntu.vm.synced_folder "C:/Users/jorge/Documents/miproyecto", "/proyecto"
  end

  config.vm.define :servidorUbuntu do |servidorUbuntu|
    servidorUbuntu.vm.box = "bento/ubuntu-22.04"
    servidorUbuntu.vm.network :private_network, ip: "192.168.100.3"
    servidorUbuntu.vm.hostname = "servidor1Ubuntu"
    servidorUbuntu.vm.provision "shell", path: "aprovision.sh"
    servidorUbuntu.vm.synced_folder "C:/Users/jorge/Documents/miproyecto", "/proyecto"
  end
end
