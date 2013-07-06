include_recipe "database::mysql"

# DB Connection info
DB_CONNECTION = {
  :host       => node["tennis"]["ace"]["db"]["host"],
  :username   => "root",
  :password   => node["mysql"]["server_root_password"]
}

# Create Database
mysql_database node["tennis"]["ace"]["db"]["name"] do
  connection DB_CONNECTION
  action :create
end

# Create DB User
mysql_database_user node["tennis"]["ace"]["db"]["user"] do
  connection DB_CONNECTION
  password node["tennis"]["ace"]["db"]["pass"]
  action :create
end

# Grant DB User Priveleges
mysql_database_user node["tennis"]["ace"]["db"]["user"] do
  connection DB_CONNECTION
  database_name node["tennis"]["ace"]["db"]["name"]
  privileges [:all]
  action :grant
end