directory "/var/run/php5-fpm" do
action :create
end

template "#{node["tennis"]["php-fpm"]["path"]}/#{node["tennis"]["enetpulse"]["server_name"]}.conf" do
source "php-fpm.erb"
owner "root"
group "root"
variables(
    :server_name    => node["tennis"]["enetpulse"]["server_name"]
  )
 action :create
end


service "php5-fpm" do
action :restart
end
