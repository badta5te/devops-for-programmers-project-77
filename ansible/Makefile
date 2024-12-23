ping:
	ansible webservers -i inventory.ini -u root -m ping --ask-vault-pass

install_roles:
	ansible-galaxy install -r requirements.yml

run_playbook:
	ansible-playbook playbook.yml -i inventory.ini --ask-vault-pass -u root

edit_vault:
	ansible-vault edit group_vars/webservers/vault.yml

view_vault:
	ansible-vault view group_vars/webservers/vault.yml
