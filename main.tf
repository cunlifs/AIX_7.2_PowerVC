################################################################
# S Cunliffe
# v1.0.0 Initial configuration 
# v1.0.1 Automated VM name & output VM name
################################################################
# Module to deploy Single VM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# Copyright IBM Corp. 2017.
#
################################################################
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


provider "openstack" {
  insecure = true
}

variable "number_of_instances" {}

resource "random_id" "rand" {
    byte_length = 2
}

resource "openstack_compute_instance_v2" "single-vm" {
  count     = "${var.number_of_instances}"
  name      = "${format("aix-vm-${random_id.rand.hex}-%02d", count.index+1)}"
  image_name  = "${var.openstack_image_name}"
  flavor_name = "${var.openstack_flavor_name}"

  network {
    name = "${var.openstack_network_name}"
    fixed_ip_v4 = "${var.openstack_IP_address}"
  }

  # Specify the ssh connection
  connection {
    user     = "${var.image_id_username}"
    password = "${var.image_id_password}"
    timeout  = "10m"
  }
}

output "single-vm-ip" {
  value = "${openstack_compute_instance_v2.single-vm.*.network.0.fixed_ip_v4}"
}

output "single-vm-name" {
  value = "${openstack_compute_instance_v2.single-vm.name}"
}
