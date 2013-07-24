#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#
# Install httpd
#
package "httpd-devel"

#
# Start httpd
#
service "httpd" do
  supports :restart => true, :reload => true
  action [:enable, :start]
end

