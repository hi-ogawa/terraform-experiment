## Variable ##

variable "ssh_public_key" {}

## AWS ##

provider "aws" {}

resource "aws_security_group" "ssh_inbound" {
  name = "ssh_inbound"
  description = "Allow ssh inbound traffic"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http_inbound" {
  name = "http_inbound"
  description = "Allow http inbound traffic"

  ingress {
      from_port = 80
      to_port = 80
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "default" {
  key_name = "test-key"
  public_key = "${var.ssh_public_key}"
}

resource "aws_instance" "test" {
  ami           = "ami-a21529cc"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.default.key_name}"
  security_groups = ["${aws_security_group.ssh_inbound.name}", "${aws_security_group.http_inbound.name}"]
  tags {
    Name = "tf test"
  }
}

## Digital Ocean ##

provider "digitalocean" {}

resource "digitalocean_ssh_key" "default" {
    name = "test key"
    public_key = "${var.ssh_public_key}"
}

resource "digitalocean_droplet" "test" {
    image = "ubuntu-14-04-x64"
    name = "test-1"
    region = "sgp1"
    size = "512mb"
    ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}
