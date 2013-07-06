#
# Cookbook Name:: tennis-static
# Recipe:: deploy
#
# Copyright (C) 2013 Miller Publishing
#
# All rights reserved - Do Not Redistribute
#

# Create required app folders
node["tennis"]["static"]["create_dirs"].each do |dir|
  directory dir do
    owner node["tennis"]["static"]["user"]
    group node["tennis"]["static"]["group"]
    mode 00755
    recursive true
    action :create
  end
end

# Deploy application
application node["tennis"]["static"]["app_name"] do
  path        node["tennis"]["static"]["deploy_to"]
  owner       node["tennis"]["static"]["user"]
  group       node["tennis"]["static"]["group"]
  repository  node["tennis"]["static"]["repo"]["url"]
  revision    node["tennis"]["static"]["repo"]["branch"]
  deploy_key  node["tennis"]["static"]["repo"]["deploy_key"]

#  migrate true

  #django do
  #  settings_template 'settings_local.py.erb'
  #  local_settings_file 'apps/settings_local.py'
  #  settings ({
  #    :db => node["tennis"]["static"]["db"],
  #    :log_dir => node["tennis"]["static"]["log_dir"]
  #  })
  #  migration_command <<-CMD
  #  #{node["tennis"]["static"]["virtualenv_path"]}/bin/python apps/manage.py syncdb --noinput && \
  #  #{node["tennis"]["static"]["virtualenv_path"]}/bin/python apps/manage.py migrate --noinput
  #  CMD
  #end

  symlinks "uploads" => "uploads"

  action :deploy
end

# # Restart App
# supervisor_service node[:tennis][:app_name] do
#   action :restart
# end
#
# # Restart Nginx
# service "nginx" do
#   action :restart
# end
