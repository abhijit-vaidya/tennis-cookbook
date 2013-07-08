#
# Cookbook Name:: cookbook-ace-app
# Recipe:: supervisor
#
# Copyright (C) 2013 ZehnerGroup
#
# All rights reserved - Do Not Redistribute
#

python_pip "Distribute" do
  action :install
end

include_recipe "supervisor"

supervisor_service node["ace"]["app_name"] do
  autostart       true
  autorestart     true
  user            node["ace"]["user"]
  #environment     "DJANGO_SETTINGS_MODULE" => node["ace"]["setting"], "PYTHON_EGG_CACHE" => '/tmp'
  directory        '/opt/tennis-ace/current'
  stdout_logfile  '/opt/tennis-ace/shared/logs/ace_access.log'
  stderr_logfile  '/opt/tennis-ace/shared/logs/ace_error.log'
  redirect_stderr true
  stopsignal      "QUIT"
  command "/usr/local/bin/uwsgi
    --wsgi-file #{node["ace"]["wsgi"]}
    --socket  #{node["ace"]["socket"]}
 --virtualenv #{node["ace"]["virtualenv_path"]}
    --processes #{node["ace"]["uswgi"]["num_processes"]}
    --master
    --log-5xx
    --log-zero
    --log-date
    --log-slow 1000
    --harakiri 120"
  action [:enable, :reload]
end
supervisor_service node["ace_admin"]["app_name"] do
  autostart       true
  autorestart     true
  user            node["ace"]["user"]
  environment     "DJANGO_SETTINGS_MODULE" => node["ace"]["setting"], "PYTHON_EGG_CACHE" => '/tmp'
  directory        '/opt/tennis-ace/current'
  stdout_logfile  '/opt/tennis-ace/shared/logs/ace_admin_access.log'
  stderr_logfile  '/opt/tennis-ace/shared/logs/ace_admin_error.log'
  redirect_stderr true
  stopsignal      "QUIT"
  command "/usr/local/bin/uwsgi
    --wsgi-file #{node["ace_admin"]["wsgi"]}
    --socket  #{node["ace_admin"]["socket"]}
    --virtualenv #{node["ace"]["virtualenv_path"]}
    --processes #{node["ace"]["uswgi"]["num_processes"]}
    --master
    --log-5xx
    --log-zero
    --log-date
    --log-slow 1000
    --harakiri 120"
  action [:enable, :reload]
end
