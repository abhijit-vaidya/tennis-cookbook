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
template "/etc/nginx/sites-available/#{node["tennis"]["ace"]["app_name"] }" do
  source "django_nginx.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["tennis"]["ace"]["app_name"],
    :server_name    => node["tennis"]["ace"]["server_name"],
    :socket_file    => node["tennis"]["ace"]["uwsgi"]["socket"]
  )
  action :create
end


# Symlink the conf file
link "/etc/nginx/sites-enabled/#{node["tennis"]["ace"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["tennis"]["ace"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end




template "/etc/nginx/sites-available/#{node["tennis"]["ace_admin"]["app_name"]}" do
  source "django_nginx.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["tennis"]["ace_admin"]["app_name"],
    :server_name    => node["tennis"]["ace_admin"]["server_name"],
    :socket_file    => node["tennis"]["ace"]["uwsgi"]["socket"]
 )
  action :create
end


# Symlink the conf file
link "/etc/nginx/sites-enabled/#{node["tennis"]["ace_admin"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["tennis"]["ace_admin"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end

# Template for the Ace static website

template "/etc/nginx/sites-available/#{node["tennis"]["ace"]["static"]["app_name"]}" do
  source "ace_static.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["tennis"]["ace"]["static"]["app_name"],
    :server_name    => node["tennis"]["ace"]["static"]["server_name"]
  )
  action :create
end

link "/etc/nginx/sites-enabled/#{node["tennis"]["ace"]["static"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["tennis"]["ace"]["static"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end

# Download the uploads file


src_filename = "uploads.tgz"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "/opt/tennis-ace/shared/uploads"

remote_file "#{Chef::Config[:file_cache_path]}/#{src_filename}" do
  source "#{node["tennis"]["ace"]["upload"]["url"]}/#{src_filename}"
  owner 'root'
  group 'root'
  mode 00644
  action :create_if_missing
end

bash 'extract_upload' do
  cwd cwd Chef::Config[:file_cache_path]
  code <<-EOH
    tar xzf #{src_filename} -C #{extract_path}/
    EOH
  not_if "test -d #{extract_path}/img"
end



template "/etc/nginx/sites-available/#{node["tennis"]["ace"]["upload"]["app_name"]}" do
  source "ace_upload.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["tennis"]["ace"]["upload"]["app_name"],
    :server_name    => node["tennis"]["ace"]["upload"]["server_name"]
  )
  action :create
end

link "/etc/nginx/sites-enabled/#{node["tennis"]["ace"]["upload"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["tennis"]["ace"]["upload"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end

template "/etc/nginx/sites-available/#{node["tennis"]["enetpulse"]["app_name"]}" do
  source "enetpulse.erb"
  owner "root"
  group "root"
  mode 00644
  variables(
    :app_name       => node["tennis"]["enetpulse"]["app_name"],
    :server_name    => node["tennis"]["enetpulse"]["server_name"]
  )
  action :create
end

link "/etc/nginx/sites-enabled/#{node["tennis"]["enetpulse"]["app_name"]}" do
  to "/etc/nginx/sites-available/#{node["tennis"]["enetpulse"]["app_name"]}"
  owner "root"
  group "root"
  action :create
end




# Restart App
supervisor_service node["tennis"]["ace"]["app_name"] do
  action :restart
end

# Restart Nginx
service "nginx" do
  action :restart
end
