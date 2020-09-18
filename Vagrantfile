# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.1.5"

unless Vagrant.has_plugin?("vagrant-hostmanager")
  $stderr.puts "\nERROR: vagrant-hostmanager not found; please run `vagrant plugin install vagrant-hostmanager`"
  exit(1)
end


Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-18.04"
    config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    config.vm.network "forwarded_port", guest: 8000, host: 8081, host_ip: "127.0.0.1"
    config.vm.network "private_network", type: "dhcp"
    config.vm.synced_folder "src/", "/vagrant/src", type: "nfs"
    config.vm.synced_folder "scripts/", "/vagrant/scripts", type: "nfs"

    config.vm.provider "virtualbox" do |vb|
     # Don't display the VirtualBox GUI when booting the machine
     vb.gui = false

     # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end

   config.vm.provision :shell, path: "vagrant/install.sh"
end