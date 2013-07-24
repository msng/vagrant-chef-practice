#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum::remi"

package "mysql-server" do
    action [:install, :upgrade]
end

template "/etc/my.cnf" do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode 00644
end

execute "mysql_install_db" do
  user "root"
  command <<-EOH
    mysql_install_db
    touch /var/chef/.mysql_install_db_done
  EOH
  not_if { File.exists?('/var/chef/.mysql_install_db_done') }
end

service 'mysqld' do
  action [:enable, :start, :reload]
end

execute 'mysql_secure_installation' do
  user "root"
  command <<-EOH
    mysql -uroot <<EOF && touch /var/chef/.mysql_secure_installation_done

-- Remove anonymous users
DELETE FROM mysql.user WHERE User='';

-- Disallow root login remotely
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

-- Remove test database and access to it
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';

-- Reload privilege tables
FLUSH PRIVILEGES;

EOF

  EOH
  not_if { File.exists?('/var/chef/.mysql_secure_installation_done') }
end

# --Change the root password
# UPDATE mysql.user SET Password=PASSWORD('hoge') WHERE User='root'
# FLUSH PRIVILEGES
