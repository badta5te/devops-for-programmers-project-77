ansible_ping:
	make -C ansible ping

ansible_install_roles:
	make -C ansible install_roles

ansible_run_playbook:
	make -C ansible run_playbook

edit_vault:
	make -C ansible edit_vault

view_vault:
	make -C ansible view_vault

terraform_init:
	make -C terraform init

terraform_apply:
	make -C terraform apply

terraform_validate:
	make -C terraform validate