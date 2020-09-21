# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.1.5"

unless Vagrant.has_plugin?("vagrant-hostmanager")
  $stderr.puts "\nERROR: vagrant-hostmanager not found; please run `vagrant plugin install vagrant-hostmanager`"
  exit(1)
end

require_relative "vagrant/ansible_galaxy_helper"

AnsibleGalaxyHelper.install_dependent_roles("deployment/")


Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-18.04"

  # Database (postgres/postgis)
  config.vm.define "database" do |database|
    database.vm.network :private_network, ip: "33.33.33.200"
    database.vm.hostname = 'database'
    config.disksize.size = '100GB'
    database.hostmanager.aliases = %w(database.service.cicero.internal user-activity-database.service.cicero.internal)

    database.vm.provider :virtualbox do |vb|
      vb.memory = 4096
      vb.cpus = 4
    end

    database.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "deployment/database.yml"
      ansible.groups = {
        launch_type => ["database"]
      }
    end
  end


   # Django, nginx
  config.vm.define "web" do |web|

    web.vm.network "forwarded_port", guest: 80, host: 81, host_ip: "127.0.0.1"
    web.vm.network "forwarded_port", guest: 8000, host: 8082, host_ip: "127.0.0.1"
    web.vm.network "private_network", type: "dhcp"

    web.vm.hostname = 'web'
    web.vm.network :private_network, ip: ENV.fetch("CICERO_WEB_IP",  "33.33.33.100")

    web.vm.synced_folder "src/", "/vagrant/src", type: "nfs"
    web.vm.synced_folder "scripts/", "/vagrant/scripts", type: "nfs"

    config.vm.provider "virtualbox" do |vb|
     # Don't display the VirtualBox GUI when booting the machine
     vb.gui = false

     # Customize the amount of memory on the VM:
     vb.memory = "1024"
    end

    web.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "deployment/web.yml"
      ansible.extra_vars = {
        cicero_hostname: "#{Socket.gethostbyname(Socket.gethostname).first}:#{CICERO_WEB_PORT_80}",
        vm_user: ENV.fetch("USER", "vagrant")
      }
      ansible.groups = {
        launch_type => ["web"]
      }

    end
  end


end