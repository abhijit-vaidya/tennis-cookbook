#
# Cookbook Name:: cookbook-ace-app
# Recipe:: supervisor
#
# Copyright (C) 2013 ZehnerGroup
#
# All rights reserved - Do Not Redistribute
#

python_pip "supervisor" do
  action :install
end

include_recipe "supervisor"

supervisor_service node["tennis"]["ace"]["app_name"] do
  autostart       true
  autorestart     true
  user            node["tennis"]["ace"]["user"]
  #environment     "DJANGO_SETTINGS_MODULE" => node["tennis"]["ace"]["setting"], "PYTHON_EGG_CACHE" => '/tmp'
  directory       ::File.join(node["tennis"]["ace"]["deploy_to"], "current")
  stdout_logfile  ::File.join(node["tennis"]["ace"]["deploy_to"], "shared/logs/ace_access.log")
  stderr_logfile  ::File.join(node["tennis"]["ace"]["deploy_to"],"shared/logs/ace_error.log")
  redirect_stderr true
  stopsignal      "QUIT"
  command "/usr/local/bin/uwsgi
    --wsgi-file #{node["tennis"]["ace"]["uwsgi"]["wsgi"]}
    --socket  #{node["tennis"]["ace"]["uwsgi"]["socket"]}
    --chmod-socket=666
    --virtualenv #{node["tennis"]["ace"]["virtualenv_path"]}
    --processes #{node["tennis"]["ace"]["uwsgi"]["num_processes"]}
    --master
    --log-5xx
    --log-zero
    --log-date
    --log-slow 1000
    --harakiri 120"
  action [:enable, :reload]
end
