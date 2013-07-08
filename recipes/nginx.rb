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
