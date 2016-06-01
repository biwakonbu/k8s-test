# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  config.vm.define 'k8s' do |k8s|
    k8s.vm.network 'private_network', ip: '192.168.55.100'
    k8s.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 23000
  end

  config.vm.define 'db' do |db|
    db.vm.network "private_network", ip: "192.168.55.101"
    db.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 23001
  end

  config.vm.define 'redis' do |redis|
    redis.vm.network "private_network", ip: "192.168.55.102"
    redis.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 23002
  end

  config.vm.define 'cluster' do |k8s|
    k8s.vm.network "private_network", ip: "192.168.55.103"
    k8s.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 23003
  end

  config.vm.synced_folder '.', '/vagrant/src', create: true

  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "512"
  end
end
