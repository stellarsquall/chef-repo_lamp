#
# Cookbook:: lamp_app
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'lamp::default'

passwords = data_bag_item('passwords', 'mysql')

create_tables = ::File.join(Chef::Config[:file_cache_path], 'create-table.sql')

cookbook_file create_tables do
	source 'create-table.sql'
end

execute "initialize #{node['lamp']['database']['dbname']} database" do
    command "mysql -h 127.0.0.1 -u #{node['lamp']['database']['admin_username']} -p#{passwords['admin_password']} -D #{node['lamp']['database']['dbname']} < #{create_tables}"
    not_if "mysql -h 127.0.0.1 -u #{node['lamp']['database']['admin_username']} -p#{passwords['admin_password']} -D #{node['lamp']['database']['dbname']} -e 'describe clients;'"
end

template "#{node['lamp']['web']['document_root']}/index.php" do
    source 'index.php.erb'
    variables({
    	servername: '127.0.0.1',
    	admin_password: passwords['admin_password']
    	})
end




