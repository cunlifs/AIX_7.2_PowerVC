# Define variables

variable "openstack_image_name" {
  description = "The name of the image to be used for deploy operations."
  default = "AIX 7.2 TL2 SP1"
}

variable "openstack_flavor_name" {
  description = "The name of the flavor to be used for deploy operations."
  default = "tiny"
}

variable "openstack_network_name" {
  description = "The name of the network to be used for deploy operations."
  default = "VLAN 156"
}

variable "openstack_IP_address" {
  description = "Optional specific IPV4 Address to be used for deploy."
}

variable "image_id_username" {
  description = "The username to SSH into image ID"
  default = "root"
}

variable "image_id_password" {
  description = "The password of the username to SSH into image ID"
  default = "abc1234"
}

variable "number_of_instances" {
  description = "Number of instances"
  default = "1"
}

