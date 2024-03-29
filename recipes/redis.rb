if node[:phpfpm][:version] >= '73'
  include_recipe 'amimoto::pecl-redis'
else
  include_recipe 'amimoto::pecl-redis-from-yum'
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
template "/etc/redis/redis.conf" do
  variables node[:redis][:config]
  source "redis/redis.conf.erb"
  notifies :reload_or_restart, 'systemd_unit[redis.service]'
end

systemd_unit 'redis.service' do
  action node[:redis][:service_action]
end

service 'redis' do
  action node[:redis][:service_action]
end
