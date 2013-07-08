#
# Cookbook Name:: tennis-ace
# Recipe:: default
#
# Copyright (C) 2013 Miller Publishing
#
# All rights reserved - Do Not Redistribute
#

include_recipe "build-essential"
include_recipe "apt::default"
include_recipe "python"
include_recipe "mysql::client"

# Install LXML Packages
[ "git",
  "libxml2",
  "libxslt1.1",
  "libxml2-dev",
  "libxslt1-dev",
  "python-libxml2",
  "python-libxslt1",
  "python-dev",
  "python-setuptools"].each do |pkg|
    package pkg do
      action :install
    end
end

# Modify hosts file
hostsfile_entry "127.0.0.1" do
  hostname  node["hostname"]
  action    :create_if_missing
end

# Set virtualenv path
#node.set["tennis"]["ace"]["virtualenv_path"] = ::File.join(node["tennis"]["ace"]["deploy_to"], "shared", "env")

# Create App user
#user node["tennis"]["ace"]["user"] do
#  home "/home/#{node["tennis"]["ace"]["user"]}"
#  supports :manage_home=>true
#  shell "/bin/bash"
#  system true
#end

# Set App users's deploy key
#github_deploy_key node["tennis"]["ace"]["user"] do
#  username "zg-tennis-bot"
#  email "aduro@zehnergroup.com"
#  password "suite340"
#end
# Set virtualenv path
node.set["tennis"]["static"]["virtualenv_path"] = ::File.join(node["tennis"]["ace"]["deploy_to"], "shared", "env")

# Create App user
user node["tennis"]["static"]["user"] do
  home "/home/#{node["tennis"]["static"]["user"]}"
  supports :manage_home=>true
  shell "/bin/bash"
  system true
end

# Set App users's deploy key
github_deploy_key node["tennis"]["static"]["user"] do
  username "zg-tennis-bot"
  email "aduro@zehnergroup.com"
  password "suite340"
end

include_recipe "tennis-ace::db"
include_recipe "tennis-ace::deploy"
include_recipe "tennis-ace::static"
