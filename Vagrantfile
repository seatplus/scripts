# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.hostname = "seatplus.docker"
  config.vm.box = "bento/ubuntu-18.10"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.network "private_network", ip: "192.168.33.100"

  config.vm.provider "virtualbox" do |vb|
      vb.name = "seatplusdocker"
      vb.memory = 4096
      vb.cpus = 2
  end 

  config.vm.provision :shell, path: "./provisions/docker.sh"
  config.vm.provision :shell, path: "./provisions/docker-compose.sh"
  config.vm.provision :shell, path: "./provisions/cdir_ssh.sh"
end