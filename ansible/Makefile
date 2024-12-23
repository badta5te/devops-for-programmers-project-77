ping:
	ansible webservers -i ansible/inventory.ini -u root -m ping --ask-vault-pass

install_roles:
	ansible-galaxy install -r ansible/requirements.yml

run_playbook:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --ask-vault-pass -u root

edit_vault:
	ansible-vault edit ansible/group_vars/webservers/vault.yml

view_vault:
	ansible-vault view ansible/group_vars/webservers/vault.yml
