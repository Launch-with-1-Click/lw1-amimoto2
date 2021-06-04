%w[
php-pecl-redis
php-pecl-igbinary
].map do |pkg|
  package pkg do
    action [:install, :upgrade]
    notifies :run, 'bash[update-motd]', :delayed
  end
end

amzn2_extras node[:redis][:amzn2_extras] do
  action :install
  exclusive_extras node[:redis][:exclusive_extras]
  exclusive_pkgs node[:redis][:exclusive_pkgs]
end

%w[
jemalloc
redis
].map do |pkg|
  package pkg do
    action [:install, :upgrade]
    notifies :run, 'bash[update-motd]', :delayed
  end
end

# configure redis
template "/etc/my.cnf" do
  variables node[:redis][:config]
  source "redis/redis.conf.erb"
  notifies :reload_or_restart, 'systemd_unit[redis.service]'
end

service 'redis' do
  action node[:redis][:service_action]
end
