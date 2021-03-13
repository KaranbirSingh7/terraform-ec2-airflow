terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


module "webserver" {
  source = "./modules/ec2"

  servername = "terraform"
  size       = "t3.medium"
}


output "webserver_public_ip" {
  value = module.webserver.public_ip
}

resource "null_resource" "run_airflow_install_script" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
    ansible-playbook --extra-vars 'passed_in_hosts=tag_Name_${module.webserver.tags.Name}' ansible_templates/install-airflow.yml
    EOF
  }
}
