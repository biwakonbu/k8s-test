setup:
	vagrant up
	vagrant ssh-config > ssh_config

install-kubernetes:
	ansible-playbook -i inventory/develop main.yml
