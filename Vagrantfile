# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu/trusty64"


	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 6
	end

  # Forward the Rails and MySQL ports
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3306, host: 3307 

  # TODO: Add Postgres forwarding here 

  config.vm.provision :shell, path: "bootstrap.sh"

  # TODO: Wrap these up into bootstrap.sh 
  config.vm.provision :shell, :path => "install-rvm.sh",  :args => "stable"
  config.vm.provision :shell, :path => "install-ruby.sh", :args => "2.2.0"
  config.vm.provision :shell, :path => "install-ruby.sh", :args => "2.0.0 rails haml" # This may be redundant... 

  # TODO: Wrap this up into bootstrap.sh 
  config.vm.provision :shell, :path => "finalize.sh" 
end

