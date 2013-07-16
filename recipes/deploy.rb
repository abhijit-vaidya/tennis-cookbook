#
# Cookbook Name:: tennis-ace
# Recipe:: deploy
#
# Copyright (C) 2013 Miller Publishing
#
# All rights reserved - Do Not Redistribute
#

# Create required app folders
node["tennis"]["ace"]["create_dirs"].each do |dir|
  directory dir do
    owner node["tennis"]["ace"]["user"]
    group node["tennis"]["ace"]["group"]
    mode 00755
    recursive true
    action :create
  end
end

# Deploy application
application node["tennis"]["ace"]["app_name"] do
  path        node["tennis"]["ace"]["deploy_to"]
  owner       node["tennis"]["ace"]["user"]
  group       node["tennis"]["ace"]["group"]
  repository  node["tennis"]["ace"]["repo"]["url"]
  revision    node["tennis"]["ace"]["repo"]["branch"]
  deploy_key  node["tennis"]["ace"]["repo"]["deploy_key"]

  migrate true

  django do
    settings_template 'settings_local.py.erb'
    local_settings_file 'apps/settings_local.py'
    settings ({
      :db => node["tennis"]["ace"]["db"],
      :log_dir => node["tennis"]["ace"]["log_dir"]
    })
    migration_command <<-CMD
    #{node["tennis"]["ace"]["virtualenv_path"]}/bin/python apps/manage.py syncdb --noinput && \
    #{node["tennis"]["ace"]["virtualenv_path"]}/bin/python apps/manage.py migrate --noinput
    CMD
  end

  symlink_before_migrate "uploads" => "uploads"

  action :deploy
end
