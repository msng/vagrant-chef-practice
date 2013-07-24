#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{php-devel php-gd php-mbstring php-mcrypt php-mysql php-pecl-apc php-pdo}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

template "/etc/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode 00644
end
