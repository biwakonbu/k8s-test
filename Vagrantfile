# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.define 'k8s' do |k8s|
    k8s.vm.network 'private_network', ip: '192.168.55.100'
    k8s.vm.provision :ansible do |ansible|
      ansible.limit = 'k8s'
      ansible.playbook = 'ansible/kubernetes.yml'
    end
  end

  config.vm.define 'db' do |db|
    db.vm.network "private_network", ip: "192.168.55.101"
  end

  config.vm.define 'redis' do |redis|
    redis.vm.network "private_network", ip: "192.168.55.102"
  end

  config.vm.define 'cluster' do |k8s|
    k8s.vm.network "private_network", ip: "192.168.55.103"
  end

  config.vm.synced_folder '.', '/vagrant/src', create: true

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
