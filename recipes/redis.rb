%w[
php-pecl-redis
php-pecl-igbinary
].map do |pkg|
  package pkg do
    action [:install, :upgrade]
    notifies :run, 'bash[update-motd]', :delayed
  end
end

amzn2_extras 'redis6'

%w[
jemalloc
redis
].map do |pkg|
  package pkg do
    action [:install, :upgrade]
    notifies :run, 'bash[update-motd]', :delayed
  end
end

service 'redis' do
  action node[:redis][:service_action]
end
