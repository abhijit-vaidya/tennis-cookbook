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
<<<<<<< HEAD
=======
  version node["uwsgi"]["version"]
>>>>>>> 226dcaef3d7a72a9c1c6126b1693f0529f730ce5
end
