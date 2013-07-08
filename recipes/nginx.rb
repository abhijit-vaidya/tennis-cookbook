#
# Cookbook Name:: cookbook-iw-app
# Recipe:: nginx
#
# Copyright (C) 2013 ZehnerGroup
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'nginx'

# Build Nginx conf file
template "/etc/nginx/sites-available/#{node["ace"]["app_name"]}" do
  source "ace.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["ace"]["app_name"],
    :server_name    => node["ace"]["server_name"]
  )
  action :create
end


# Symlink the conf file
link "/etc/nginx/sites-enabled/#{node["ace"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["ace"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end

template "/etc/nginx/sites-available/#{node["ace_admin"]["app_name"]}" do
  source "ace_admin.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["ace_admin"]["app_name"],
    :server_name    => node["ace_admin"]["server_name"]
  )
  action :create
end


# Symlink the conf file
link "/etc/nginx/sites-enabled/#{node["ace_admin"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["ace_admin"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end

# Template for the Ace static website

template "/etc/nginx/sites-available/#{node["ace_static"]["app_name"]}" do
  source "ace_static.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["ace_static"]["app_name"],
    :server_name    => node["ace_static"]["server_name"]
  )
  action :create
end

link "/etc/nginx/sites-enabled/#{node["ace_static"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["ace_static"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end

# Download the uploads file

src_filename = "uploads_local_sep.tgz"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "/opt/tennis-ace/shared/uploads"

remote_file "#{Chef::Config[:file_cache_path]}/#{src_filename}" do
  source "#{node['ace_upload']['url']}/#{src_filename}"
  owner 'root'
  group 'root'
  mode 00644
  action :create_if_missing
end

bash 'extract_upload' do
  cwd cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar xzf #{src_filename} -C #{extract_path}/
    mv #{extract_path}/*/* #{extract_path}/
    EOH
  not_if "test -d #{extract_path}/img"
end


# Template for the Ace Upload website

template "/etc/nginx/sites-available/#{node["ace_upload"]["app_name"]}" do
  source "ace_upload.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["ace_upload"]["app_name"],
    :server_name    => node["ace_upload"]["server_name"]
  )
  action :create
end

link "/etc/nginx/sites-enabled/#{node["ace_upload"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["ace_upload"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end
