# MySQL Install

yum_package 'mariadb-libs' do
  action [:remove]
end

node[:mysql][:packages].each do |package_name|
  yum_package package_name do
    action [:install, :upgrade]
    if ['redhat'].include?(node[:platform])
      flush_cache [:before]
    end
    notifies :run, 'bash[update-motd]', :delayed
  end
end

# configure mysql
template "/etc/my.cnf" do
  variables node[:mysql][:config]
  source "mysql/my.cnf.erb"
  notifies :reload_or_restart, 'systemd_unit[mysqld.service]' unless node.run_state[:mysql_flush_ib_logfiles]
end

# sudo -u mysql mysqld --initialize-insecure
# sudo -u mysql mysqld --no-defaults --initialize-insecure
execute 'mysqld --no-defaults --initialize-insecure' do
  user 'mysql'
  not_if 'test -d /var/lib/mysql/mysql'
end

template "/etc/logrotate.d/mysql" do
  variables node[:mysql][:config]
  source "logrotat.d/mysql.erb"
end

file "/var/log/mysqld-slow.log" do
  owner node[:mysql][:config][:user]
  group "root"
  mode "0640"
  action :create
end

# service node[:mysql][:service_name] do
#   action node[:mysql][:service_action]
# end

systemd_unit 'mysqld.service' do
  action node[:mysql][:service_action]
end


# no longer need 5.7
## check innodb_log_file_size
# node.run_state[:mysql_flush_ib_logfiles] = false
# current_innodb_log_file_size =  get_mysql_variable("innodb_log_file_size")
# new_innodb_log_file_size =  to_mysql_bytes(node[:mysql][:config][:innodb_log_file_size])

# unless current_innodb_log_file_size == new_innodb_log_file_size
#   node.run_state[:mysql_flush_ib_logfiles] = true
# end


# ## restart with flush innodb_log_files

# if node.run_state[:mysql_flush_ib_logfiles]
#   restart_mysql_with_flush_ib_logfiles
# end

# node.run_state.delete(:mysql_flush_ib_logfiles)
