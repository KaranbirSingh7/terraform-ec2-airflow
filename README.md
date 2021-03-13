# terraform-ec2-airflow

Requires terraform and ansible to run

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

## Deploy Environment

```bash
./start.sh
```

## Teardown Environment + Infra

```bash
./destroy.sh
```
