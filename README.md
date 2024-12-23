### Hexlet tests and linter status:
[![Actions Status](https://github.com/badta5te/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/badta5te/devops-for-programmers-project-77/actions)

### Requirements:
- Ansible
- Terraform
- DigitalOcean Account

### Instalation:
```bash
make terraform_init
make terraform_apply
```

After the infrastructure is created, we need to deploy the application via Ansible:

```bash
make ansible_ping
make ansible_install_roles
make ansible_run_playbook
```

The application will be accessible by [https://badta5te.me](https://badta5te.me)
