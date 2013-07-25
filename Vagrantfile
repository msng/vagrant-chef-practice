# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos64"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"

  config.vm.network :private_network, ip: "192.168.33.14"

  config.vm.synced_folder "./src", "/src", :create => true, :owner=> 'vagrant', :group=>'vagrant', :extra => 'dmode=777,fmode=666'

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    # vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./chef/site-cookbooks"
    chef.add_recipe "yum::remi"
    chef.add_recipe "openssl"
    chef.add_recipe "base"
    chef.add_recipe "php"
    chef.add_recipe "apache"
    chef.add_recipe "mysql"
  end

end
