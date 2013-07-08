#
# Cookbook Name:: cookbook-iw-app
# Recipe:: uwsgi
#
# Copyright (C) 2013 ZehnerGroup
#
# All rights reserved - Do Not Redistribute
#

# needed for uwsgi starting with version 1.3
package "libssl0.9.8" do
  action :upgrade
end


python_pip "uwsgi" do
  action :install
  version node["uwsgi"]["version"]
end
