#
# Cookbook:: lamp
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

passwords = data_bag_item('passwords', 'mysql')

mysql_client 'default' do
	action :create
end

mysql_service 'default' do
    initial_root_password passwords['root_password']
    action [:create, :start]
end

mysql2_chef_gem 'default' do
    action :install
end

mysql_connection_info = {
	host: '127.0.0.1',
	username: 'root',
	password: passwords['root_password']
}

mysql_database node['lamp']['database']['dbname'] do
    connection mysql_connection_info
    action :create
end

mysql_database_user node['lamp']['database']['admin_username'] do
    connection mysql_connection_info
    password passwords['admin_password']
    database_name node['lamp']['database']['dbname']
    host '127.0.0.1'
    action [:create, :grant]
end








