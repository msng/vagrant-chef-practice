#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#
# Install PHP
#
%w{php-devel php-gd php-mbstring php-mcrypt php-mysql php-pecl-apc php-pdo}.each do |pkg|
  package pkg do
    # options "--enablerepo=epel"
    action [:install, :upgrade]
  end
end

