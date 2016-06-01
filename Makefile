setup:
	vagrant up
	vagrant ssh-config > ssh_config
	make install-kubernates

install-kubernetes:
	ansible-playbook -i ansible/inventory/develop ansible/main.yml
