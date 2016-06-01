setup:
	vagrant up
	vagrant ssh-config > ssh_config
	make install-kubernetes

install-kubernetes:
	ansible-playbook -i ansible/inventory/develop ansible/kubernetes.yml
