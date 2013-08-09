#
# Cookbook Name:: tennis-static
# Recipe:: deploy
#
# Copyright (C) 2013 Miller Publishing
#
# All rights reserved - Do Not Redistribute
#


# Deploy application
application node["tennis"]["enetpulse"]["app_name"] do
  path        node["tennis"]["enetpulse"]["deploy_to"]
  repository  node["tennis"]["enetpulse"]["repo"]["url"]
  revision    node["tennis"]["enetpulse"]["repo"]["branch"]
  deploy_key  node["tennis"]["enetpulse"]["repo"]["deploy_key"]

  action :deploy
end
