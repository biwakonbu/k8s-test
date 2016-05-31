# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  config.vm.define 'k8s-master' do |k8s|
    k8s.vm.network 'private_network', ip: '192.168.55.100'
    k8s.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2300
  end

  config.vm.define 'db-master' do |db|
    db.vm.network "private_network", ip: "192.168.55.102"
    db.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2302
  end

  config.vm.define 'db-slave' do |db|
    db.vm.network "private_network", ip: "192.168.55.103"
    db.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2303
  end

  config.vm.define 'redis-master' do |redis|
    redis.vm.network "private_network", ip: "192.168.55.105"
    redis.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2305
  end

  config.vm.define 'redis-slave' do |redis|
    redis.vm.network "private_network", ip: "192.168.55.106"
    redis.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2306
  end

  config.vm.define 'k8s-cluster1' do |k8s|
    k8s.vm.network "private_network", ip: "192.168.55.111"
    k8s.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2311
  end

  config.vm.define 'k8s-cluster2' do |k8s|
    k8s.vm.network "private_network", ip: "192.168.55.112"
    k8s.vm.network :forwarded_port, id: 'ssh', guest: 22, host: 2312
  end

  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "512"
  end
end
