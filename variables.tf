# Define variables

variable "openstack_image_name" {
  description = "The name of the image to be used for deploy operations."
}

variable "openstack_flavor_name" {
  description = "The name of the flavor to be used for deploy operations."
}

variable "openstack_network_name" {
  description = "The name of the network to be used for deploy operations."
}

variable "openstack_IP_address" {
  description = "Optional specific IPV4 Address to be used for deploy."
}

variable "image_id_username" {
  description = "The username to SSH into image ID"
}

variable "image_id_password" {
  description = "The password of the username to SSH into image ID"
}

variable "number_of_instances" {
  description = "Number of instances"
}

