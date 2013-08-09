#
# Cookbook Name:: tennis-static
# Recipe:: deploy
#
# Copyright (C) 2013 Miller Publishing
#
# All rights reserved - Do Not Redistribute
#


# Deploy application
application node["tennis"]["ace"]["static"]["app_name"] do
  path        node["tennis"]["ace"]["static"]["deploy_to"]
  owner       node["tennis"]["ace"]["static"]["user"]
  group       node["tennis"]["ace"]["static"]["group"]
  repository  node["tennis"]["ace"]["static"]["repo"]["url"]
  revision    node["tennis"]["ace"]["static"]["repo"]["branch"]
  deploy_key  node["tennis"]["ace"]["static"]["repo"]["deploy_key"]

  action :deploy
end
