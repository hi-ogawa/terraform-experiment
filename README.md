# Terraform Experiment

This uses https://hub.docker.com/r/hiogawa/terraform/.

After creating `.env` file with valid credentials:

```
-- help --
$ docker-compose run --rm terraform
usage: terraform [--version] [--help] <command> [<args>]

Available commands are:
    apply       Builds or changes infrastructure
    destroy     Destroy Terraform-managed infrastructure
    fmt         Rewrites config files to canonical format
    get         Download and install modules for the configuration
    graph       Create a visual graph of Terraform resources
    init        Initializes Terraform configuration from a module
    output      Read an output from a state file
    plan        Generate and show an execution plan
    push        Upload this Terraform module to Atlas to run
    refresh     Update local state file against real resources
    remote      Configure remote state storage
    show        Inspect Terraform state or plan
    taint       Manually mark a resource for recreation
    untaint     Manually unmark a resource as tainted
    validate    Validates the Terraform files
    version     Prints the Terraform version

-- plan --
$ docker-compose run --rm terraform plan -out=./test.plan
Refreshing Terraform state prior to plan...


The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: ./test.plan

+ aws_instance.test
    ami:                       "" => "ami-a21529cc"
    availability_zone:         "" => "<computed>"
    ebs_block_device.#:        "" => "<computed>"
    ephemeral_block_device.#:  "" => "<computed>"
    instance_state:            "" => "<computed>"
    instance_type:             "" => "t2.micro"
    key_name:                  "" => "test-key"
    placement_group:           "" => "<computed>"
    private_dns:               "" => "<computed>"
    private_ip:                "" => "<computed>"
    public_dns:                "" => "<computed>"
    public_ip:                 "" => "<computed>"
    root_block_device.#:       "" => "<computed>"
    security_groups.#:         "" => "1"
    security_groups.897094884: "" => "ssh_inbound"
    source_dest_check:         "" => "true"
    subnet_id:                 "" => "<computed>"
    tags.#:                    "" => "1"
    tags.Name:                 "" => "tf test"
    tenancy:                   "" => "<computed>"
    vpc_security_group_ids.#:  "" => "<computed>"

+ aws_key_pair.default
    fingerprint: "" => "<computed>"
    key_name:    "" => "test-key"
    public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com"

+ aws_security_group.ssh_inbound
    description:                          "" => "Allow ssh inbound traffic"
    egress.#:                             "" => "<computed>"
    ingress.#:                            "" => "1"
    ingress.2541437006.cidr_blocks.#:     "" => "1"
    ingress.2541437006.cidr_blocks.0:     "" => "0.0.0.0/0"
    ingress.2541437006.from_port:         "" => "22"
    ingress.2541437006.protocol:          "" => "tcp"
    ingress.2541437006.security_groups.#: "" => "0"
    ingress.2541437006.self:              "" => "false"
    ingress.2541437006.to_port:           "" => "22"
    name:                                 "" => "ssh_inbound"
    owner_id:                             "" => "<computed>"
    vpc_id:                               "" => "<computed>"

+ digitalocean_droplet.test
    image:                "" => "ubuntu-14-04-x64"
    ipv4_address:         "" => "<computed>"
    ipv4_address_private: "" => "<computed>"
    ipv6_address:         "" => "<computed>"
    ipv6_address_private: "" => "<computed>"
    locked:               "" => "<computed>"
    name:                 "" => "test-1"
    region:               "" => "sgp1"
    size:                 "" => "512mb"
    ssh_keys.#:           "" => "<computed>"
    status:               "" => "<computed>"

+ digitalocean_ssh_key.default
    fingerprint: "" => "<computed>"
    name:        "" => "test key"
    public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com"


Plan: 5 to add, 0 to change, 0 to destroy.

-- apply --
$ docker-compose run --rm terraform apply ./test.plan
digitalocean_ssh_key.default: Creating...
  fingerprint: "" => "<computed>"
  name:        "" => "test key"
  public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com"
digitalocean_ssh_key.default: Creation complete
digitalocean_droplet.test: Creating...
  image:                "" => "ubuntu-14-04-x64"
  ipv4_address:         "" => "<computed>"
  ipv4_address_private: "" => "<computed>"
  ipv6_address:         "" => "<computed>"
  ipv6_address_private: "" => "<computed>"
  locked:               "" => "<computed>"
  name:                 "" => "test-1"
  region:               "" => "sgp1"
  size:                 "" => "512mb"
  ssh_keys.#:           "" => "1"
  ssh_keys.0:           "" => "2624342"
  status:               "" => "<computed>"
aws_key_pair.default: Creating...
  fingerprint: "" => "<computed>"
  key_name:    "" => "test-key"
  public_key:  "" => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com"
aws_security_group.ssh_inbound: Creating...
  description:                          "" => "Allow ssh inbound traffic"
  egress.#:                             "" => "<computed>"
  ingress.#:                            "" => "1"
  ingress.2541437006.cidr_blocks.#:     "" => "1"
  ingress.2541437006.cidr_blocks.0:     "" => "0.0.0.0/0"
  ingress.2541437006.from_port:         "" => "22"
  ingress.2541437006.protocol:          "" => "tcp"
  ingress.2541437006.security_groups.#: "" => "0"
  ingress.2541437006.self:              "" => "false"
  ingress.2541437006.to_port:           "" => "22"
  name:                                 "" => "ssh_inbound"
  owner_id:                             "" => "<computed>"
  vpc_id:                               "" => "<computed>"
aws_key_pair.default: Creation complete
aws_security_group.ssh_inbound: Creation complete
aws_instance.test: Creating...
  ami:                       "" => "ami-a21529cc"
  availability_zone:         "" => "<computed>"
  ebs_block_device.#:        "" => "<computed>"
  ephemeral_block_device.#:  "" => "<computed>"
  instance_state:            "" => "<computed>"
  instance_type:             "" => "t2.micro"
  key_name:                  "" => "test-key"
  placement_group:           "" => "<computed>"
  private_dns:               "" => "<computed>"
  private_ip:                "" => "<computed>"
  public_dns:                "" => "<computed>"
  public_ip:                 "" => "<computed>"
  root_block_device.#:       "" => "<computed>"
  security_groups.#:         "" => "1"
  security_groups.897094884: "" => "ssh_inbound"
  source_dest_check:         "" => "true"
  subnet_id:                 "" => "<computed>"
  tags.#:                    "" => "1"
  tags.Name:                 "" => "tf test"
  tenancy:                   "" => "<computed>"
  vpc_security_group_ids.#:  "" => "<computed>"
digitalocean_droplet.test: Still creating... (10s elapsed)
aws_instance.test: Still creating... (10s elapsed)
digitalocean_droplet.test: Still creating... (20s elapsed)
aws_instance.test: Creation complete
digitalocean_droplet.test: Still creating... (30s elapsed)
digitalocean_droplet.test: Still creating... (40s elapsed)
digitalocean_droplet.test: Creation complete

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

-- show --
$ docker-compose run --rm terraform show
aws_instance.test:
  id = i-343a64ab
  ami = ami-a21529cc
  availability_zone = ap-northeast-1a
  disable_api_termination = false
  ebs_block_device.# = 0
  ebs_optimized = false
  ephemeral_block_device.# = 0
  iam_instance_profile =
  instance_state = running
  instance_type = t2.micro
  key_name = test-key
  monitoring = false
  private_dns = ip-172-31-31-9.ap-northeast-1.compute.internal
  private_ip = 172.31.31.9
  public_dns = ec2-52-197-125-237.ap-northeast-1.compute.amazonaws.com
  public_ip = 52.197.125.237
  root_block_device.# = 1
  root_block_device.0.delete_on_termination = true
  root_block_device.0.iops = 100
  root_block_device.0.volume_size = 8
  root_block_device.0.volume_type = gp2
  security_groups.# = 1
  security_groups.897094884 = ssh_inbound
  source_dest_check = true
  subnet_id = subnet-8b77fbfc
  tags.# = 1
  tags.Name = tf test
  tenancy = default
  vpc_security_group_ids.# = 0
aws_key_pair.default:
  id = test-key
  key_name = test-key
  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com
aws_security_group.ssh_inbound:
  id = sg-71a78015
  description = Allow ssh inbound traffic
  egress.# = 0
  ingress.# = 1
  ingress.2541437006.cidr_blocks.# = 1
  ingress.2541437006.cidr_blocks.0 = 0.0.0.0/0
  ingress.2541437006.from_port = 22
  ingress.2541437006.protocol = TCP
  ingress.2541437006.security_groups.# = 0
  ingress.2541437006.self = false
  ingress.2541437006.to_port = 22
  name = ssh_inbound
  owner_id = 335764714763
  tags.# = 0
  vpc_id = vpc-923a8cf7
digitalocean_droplet.test:
  id = 21155858
  image = ubuntu-14-04-x64
  ipv4_address = 139.59.247.53
  locked = false
  name = test-1
  region = sgp1
  size = 512mb
  ssh_keys.# = 1
  ssh_keys.0 = 2624342
  status = active
digitalocean_ssh_key.default:
  id = 2624342
  fingerprint = 60:1f:ee:90:36:15:75:62:b4:5f:5f:4d:bd:bb:8a:61
  name = test key
  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com

-- 2nd time: plan after changing test.tf --
$ docker-compose run --rm terraform plan -out=./test.plan
Refreshing Terraform state prior to plan...

digitalocean_ssh_key.default: Refreshing state... (ID: 2624342)
digitalocean_droplet.test: Refreshing state... (ID: 21155858)
aws_key_pair.default: Refreshing state... (ID: test-key)
aws_security_group.ssh_inbound: Refreshing state... (ID: sg-71a78015)
aws_instance.test: Refreshing state... (ID: i-343a64ab)

The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed.

Your plan was also saved to the path below. Call the "apply" subcommand
with this plan file and Terraform will exactly execute this execution
plan.

Path: ./test.plan

-/+ aws_instance.test
    ami:                        "ami-a21529cc" => "ami-a21529cc"
    availability_zone:          "ap-northeast-1a" => "<computed>"
    ebs_block_device.#:         "0" => "<computed>"
    ephemeral_block_device.#:   "0" => "<computed>"
    instance_state:             "running" => "<computed>"
    instance_type:              "t2.micro" => "t2.micro"
    key_name:                   "test-key" => "test-key"
    placement_group:            "" => "<computed>"
    private_dns:                "ip-172-31-31-9.ap-northeast-1.compute.internal" => "<computed>"
    private_ip:                 "172.31.31.9" => "<computed>"
    public_dns:                 "ec2-52-197-125-237.ap-northeast-1.compute.amazonaws.com" => "<computed>"
    public_ip:                  "52.197.125.237" => "<computed>"
    root_block_device.#:        "1" => "<computed>"
    security_groups.#:          "1" => "2" (forces new resource)
    security_groups.3616216834: "" => "http_inbound" (forces new resource)
    security_groups.897094884:  "ssh_inbound" => "ssh_inbound" (forces new resource)
    source_dest_check:          "true" => "true"
    subnet_id:                  "subnet-8b77fbfc" => "<computed>"
    tags.#:                     "1" => "1"
    tags.Name:                  "tf test" => "tf test"
    tenancy:                    "default" => "<computed>"
    vpc_security_group_ids.#:   "0" => "<computed>"

+ aws_security_group.http_inbound
    description:                          "" => "Allow http inbound traffic"
    egress.#:                             "" => "<computed>"
    ingress.#:                            "" => "1"
    ingress.2214680975.cidr_blocks.#:     "" => "1"
    ingress.2214680975.cidr_blocks.0:     "" => "0.0.0.0/0"
    ingress.2214680975.from_port:         "" => "80"
    ingress.2214680975.protocol:          "" => "tcp"
    ingress.2214680975.security_groups.#: "" => "0"
    ingress.2214680975.self:              "" => "false"
    ingress.2214680975.to_port:           "" => "80"
    name:                                 "" => "http_inbound"
    owner_id:                             "" => "<computed>"
    vpc_id:                               "" => "<computed>"


Plan: 2 to add, 0 to change, 1 to destroy.

-- 2nd time: apply --
$ docker-compose run --rm terraform apply ./test.plan
aws_instance.test: Destroying...
aws_security_group.http_inbound: Creating...
  description:                          "" => "Allow http inbound traffic"
  egress.#:                             "" => "<computed>"
  ingress.#:                            "" => "1"
  ingress.2214680975.cidr_blocks.#:     "" => "1"
  ingress.2214680975.cidr_blocks.0:     "" => "0.0.0.0/0"
  ingress.2214680975.from_port:         "" => "80"
  ingress.2214680975.protocol:          "" => "tcp"
  ingress.2214680975.security_groups.#: "" => "0"
  ingress.2214680975.self:              "" => "false"
  ingress.2214680975.to_port:           "" => "80"
  name:                                 "" => "http_inbound"
  owner_id:                             "" => "<computed>"
  vpc_id:                               "" => "<computed>"
aws_security_group.http_inbound: Creation complete
aws_instance.test: Still destroying... (10s elapsed)
aws_instance.test: Still destroying... (20s elapsed)
aws_instance.test: Still destroying... (30s elapsed)
aws_instance.test: Still destroying... (40s elapsed)
aws_instance.test: Destruction complete
aws_instance.test: Creating...
  ami:                        "" => "ami-a21529cc"
  availability_zone:          "" => "<computed>"
  ebs_block_device.#:         "" => "<computed>"
  ephemeral_block_device.#:   "" => "<computed>"
  instance_state:             "" => "<computed>"
  instance_type:              "" => "t2.micro"
  key_name:                   "" => "test-key"
  placement_group:            "" => "<computed>"
  private_dns:                "" => "<computed>"
  private_ip:                 "" => "<computed>"
  public_dns:                 "" => "<computed>"
  public_ip:                  "" => "<computed>"
  root_block_device.#:        "" => "<computed>"
  security_groups.#:          "" => "2"
  security_groups.3616216834: "" => "http_inbound"
  security_groups.897094884:  "" => "ssh_inbound"
  source_dest_check:          "" => "true"
  subnet_id:                  "" => "<computed>"
  tags.#:                     "" => "1"
  tags.Name:                  "" => "tf test"
  tenancy:                    "" => "<computed>"
  vpc_security_group_ids.#:   "" => "<computed>"
aws_instance.test: Still creating... (2s elapsed)
aws_instance.test: Still creating... (10s elapsed)
aws_instance.test: Still creating... (12s elapsed)
aws_instance.test: Creation complete

Apply complete! Resources: 2 added, 0 changed, 1 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

-- show --
$ docker-compose run --rm terraform show
aws_instance.test:
  id = i-f53b656a
  ami = ami-a21529cc
  availability_zone = ap-northeast-1a
  disable_api_termination = false
  ebs_block_device.# = 0
  ebs_optimized = false
  ephemeral_block_device.# = 0
  iam_instance_profile =
  instance_state = running
  instance_type = t2.micro
  key_name = test-key
  monitoring = false
  private_dns = ip-172-31-20-68.ap-northeast-1.compute.internal
  private_ip = 172.31.20.68
  public_dns = ec2-52-197-225-55.ap-northeast-1.compute.amazonaws.com
  public_ip = 52.197.225.55
  root_block_device.# = 1
  root_block_device.0.delete_on_termination = true
  root_block_device.0.iops = 100
  root_block_device.0.volume_size = 8
  root_block_device.0.volume_type = gp2
  security_groups.# = 2
  security_groups.3616216834 = http_inbound
  security_groups.897094884 = ssh_inbound
  source_dest_check = true
  subnet_id = subnet-8b77fbfc
  tags.# = 1
  tags.Name = tf test
  tenancy = default
  vpc_security_group_ids.# = 0
aws_key_pair.default:
  id = test-key
  fingerprint = cd:bd:bd:79:c0:61:97:2f:41:19:46:3b:d7:e5:8d:5f
  key_name = test-key
  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com
aws_security_group.http_inbound:
  id = sg-93a780f7
  description = Allow http inbound traffic
  egress.# = 0
  ingress.# = 1
  ingress.2214680975.cidr_blocks.# = 1
  ingress.2214680975.cidr_blocks.0 = 0.0.0.0/0
  ingress.2214680975.from_port = 80
  ingress.2214680975.protocol = TCP
  ingress.2214680975.security_groups.# = 0
  ingress.2214680975.self = false
  ingress.2214680975.to_port = 80
  name = http_inbound
  owner_id = 335764714763
  tags.# = 0
  vpc_id = vpc-923a8cf7
aws_security_group.ssh_inbound:
  id = sg-71a78015
  description = Allow ssh inbound traffic
  egress.# = 0
  ingress.# = 1
  ingress.2541437006.cidr_blocks.# = 1
  ingress.2541437006.cidr_blocks.0 = 0.0.0.0/0
  ingress.2541437006.from_port = 22
  ingress.2541437006.protocol = TCP
  ingress.2541437006.security_groups.# = 0
  ingress.2541437006.self = false
  ingress.2541437006.to_port = 22
  name = ssh_inbound
  owner_id = 335764714763
  tags.# = 0
  vpc_id = vpc-923a8cf7
digitalocean_droplet.test:
  id = 21155858
  image = ubuntu-14-04-x64
  ipv4_address = 139.59.247.53
  locked = false
  name = test-1
  region = sgp1
  size = 512mb
  ssh_keys.# = 1
  ssh_keys.0 = 2624342
  status = active
digitalocean_ssh_key.default:
  id = 2624342
  fingerprint = 60:1f:ee:90:36:15:75:62:b4:5f:5f:4d:bd:bb:8a:61
  name = test key
  public_key = ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDVj+3Q6Y9MUmFiazMNf0+a/9ea1kr7fyK+Aj+OGR/1LN/ZqMLXhERmSb8wbbwrsJh9/p6lNzAG1Rlr/h8kkzAVxeVYBtE6vktlRvOGPgYXwVsxRVrFg7SsFqbCcS1F5iX0YDoK7DkMHUpMOeNjqWAvvmTbvaAV9y3QPdI0F5v17oWMP1fimU6MxOp3T4Jczx4k7jIP4ODE0unGgbW4ZUE3Htmit0eFM7xlxUnZxLMIoA7IGDJbZ+L8XwIyCMOxoACRhADCnf6cGcJDswV+/EH41MX4/EBv0y4lF+pG92z/ce9edrQBjWfbXrOaxdPaC2PeGq8fJO3FPdFDVsd1FUvTpmZ+0vVlj3ojxfm2TLc8adV+l49GcYwBlgl8m6PozQ+4sqNwKdMDDkd+ys+PueMHXM4PIpRqc9r/GaO+x6AwHPgAYJalZ+lNSKLqDjlEH5e/InSPdu3vUqwSO2qZp3sO6TBc6FAoDO9eoz0p3KLshHE7Plkth5eHHOEGgpgXFh4QLWEqgHcdrrW1C/gerv7Yjt9vDUaewOTmPwhbJT8TsxElb3CgrF0d04ms6gCLWSD9G87wTkXcA6+OHoO1vGL7HbXT8nfgdCG3QAYldY2eHgil1A6Y2QHV2xpIIrHJWaAWNJOxy1oRsEx4pVSxXfqzPu7WuYAMLbE2/WzGFuHLpw== hi.ogawa.zz@gmail.com

-- destroy --
$ docker-compose run --rm terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
yes

digitalocean_ssh_key.default: Refreshing state... (ID: 2624342)
digitalocean_droplet.test: Refreshing state... (ID: 21155858)
aws_key_pair.default: Refreshing state... (ID: test-key)
aws_security_group.ssh_inbound: Refreshing state... (ID: sg-71a78015)
aws_security_group.http_inbound: Refreshing state... (ID: sg-93a780f7)
aws_instance.test: Refreshing state... (ID: i-f53b656a)
digitalocean_droplet.test: Destroying...
aws_instance.test: Destroying...
digitalocean_droplet.test: Still destroying... (10s elapsed)
aws_instance.test: Still destroying... (10s elapsed)
digitalocean_droplet.test: Destruction complete
digitalocean_ssh_key.default: Destroying...
digitalocean_ssh_key.default: Destruction complete
aws_instance.test: Still destroying... (20s elapsed)
aws_instance.test: Destruction complete
aws_key_pair.default: Destroying...
aws_security_group.http_inbound: Destroying...
aws_security_group.ssh_inbound: Destroying...
aws_key_pair.default: Destruction complete
aws_security_group.http_inbound: Destruction complete
aws_security_group.ssh_inbound: Destruction complete

Apply complete! Resources: 0 added, 0 changed, 6 destroyed.

-- show --
$ docker-compose run --rm terraform show

$
```
