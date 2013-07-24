#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# package "mysql-server" do
#   options "--enablerepo=remi"
#   options "--enablerepo=epel"
#   action [:install, :upgrade]
# end

include_recipe "yum::remi"

package "mysql-server"

service "mysqld" do
  supports :restart => true
  action [:enable, :start]
end
