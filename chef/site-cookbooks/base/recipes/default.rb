#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# execute "yum update" do
#   command "yum -y update"
# end

#
# Install packages
#
%w{git vim-enhanced zsh httpd-devel php-pecl-apc php-devel php-gd php-mbstring php-mcrypt php-mysql php-pdo mysql-server}.each do |pkg|
  package pkg do
    options "--enablerepo=remi"
    options "--enablerepo=epel"
    action [:install, :upgrade]
  end
end

#
# Load firewall rules
#
template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  owner "root"
  group "root"
  mode 00600
  # notifies :restart, resources(:service => "iptables")
end

execute "service iptables restart" do
  user "root"
  command "service iptables restart"
end


#
# Start httpd and mysqld
#
%w{httpd mysqld}.each do |service_name|
    service service_name do
      supports :status => true, :restart => true, :reload => true
      action [:enable, :start]
    end
end

