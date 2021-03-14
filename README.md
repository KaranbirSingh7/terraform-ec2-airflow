# terraform-ec2-airflow

### Description

A simple terraform + ansible setup to provision infra and run airflow in seconds.

Resources provisioned in AWS:

- 1 security group
- 1 EC2 VM (size can be changed, default to t2.micro)
- 1 key pair

Once Infrstructure is provisioned, ansible uses AWS dynamic inventory and run playbook to have airflow installed on OS (Debian/Ubuntu).

### Check which EC2 instances the ansible-playbook would run on

```bash
cd this_repo

ansible-playbook --list --yaml
```

### DRY run of ansible-playbook

```bash
cd this_repo

ansible-playbook -C ./ansible_templates/install-airflow.yml
```

## Deploy Infra + Run ansible-playbook

```bash
./start.sh
```

## Teardown Environment + Infra

```bash
./destroy.sh
```
