# Development environment setup

[Ansible](https://www.ansible.com/) playbook used to setup my development environment on Ubuntu 18.04.

## Installation

In order to install Ansible and grant execute permission for the bash script `run`, run the command:

```bash
chmod +x install && ./install
```

## Usage

To run the playbook, run the command:

```bash
./run
```

## Virtual development environment

To create a virtual machine and provision it using the Ansible playbook, you can use the included [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/) (this requires [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) to be installed). This is handy when testing changes made to the playbook.

To start the virtual machine, and run the provisioning playbook, run the command:

```bash
vagrant up
```

To rerun the playbook against a running virtual machine, run the command:

```bash
vagrant provision
```
