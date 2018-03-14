# Ansible provisioner for managers and workers Docker Swarm

## Install:

Ansible:
`sudo easy_install ansible`

Required for ec2.py
`sudo easy_install boto`

Dependencies:
```
curl -s -LJO https://raw.github.com/ansible/ansible/devel/contrib/inventory/ec2.py && chmod +x ec2.py
ansible-galaxy install defunctzombie.coreos-bootstrap -p ./roles
```

## Usage:
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"

ANSIBLE_HOST_KEY_CHECKING=False \
ansible-playbook -i ./ec2.py \
    coreos_python.yml \
    docker_swarm_managers.yml \
    docker_swarm_workers.yml
```
