# create www Group
group node[:php][:config][:group] do
  members ['ec2-user',node[:php][:config][:user]]
  action :create
end

# mod_php7 install
#execute '/usr/bin/yum clean all'

yum_package 'libwebp' do
  action [:install, :upgrade]
  notifies :run, 'bash[update-motd]', :delayed
end

if node[:phpfpm][:version] == '73'
  yum_package 'liblzf' do
    action [:install, :upgrade]
    notifies :run, 'bash[update-motd]', :delayed
  end
end

amzn2_extras node[:phpfpm][:amzn2_extras] do
  action :install
  exclusive_extras node[:phpfpm][:exclusive_extras]
  exclusive_pkgs node[:phpfpm][:exclusive_pkgs]
end

packages = node[:php][:packages].dup

if node[:phpfpm][:version] >= '72'
  package 'php-mcrypt' do
    action [:remove]
    notifies :run, 'bash[update-motd]', :delayed
  end
  packages.delete('php-mcrypt')
end

yum_package 'php-packages' do
  package_name packages
  action [:install, :upgrade]
  flush_cache [ :before ]
  options "--skip-broken"
  notifies :run, 'bash[update-motd]', :delayed
  retries 2
  retry_delay 4
end

# file '/etc/httpd/conf.d/php.conf' do
#   action :delete
# end

template '/etc/httpd/conf.d/php.conf' do
  source 'httpd/conf.d/php.conf.erb'
  notifies :reload, 'service[httpd]'
end


# configure php

%w{ php.ini }.each do | file_name |
  template "/etc/" + file_name do
    variables node[:php][:config]
    source "php/" + file_name + ".erb"
    notifies :reload, 'service[httpd]'
  end
end

%w{ /var/tmp/php /var/tmp/php/session /var/log/php-fpm }.each do | dir_name |
  directory dir_name do
    owner node[:php][:config][:user]
    group node[:php][:config][:group]
    mode 00755
    recursive true
    action :create
  end
end

# update www group

if node[:mod_php7][:enabled]
  group node[:php][:config][:group] do
    action :modify
    members [node[:php][:config][:user]]
    append true
  end
end

# php-fpm stop, disable

service "httpd" do
  action node[:httpd][:service_action]
end

service "php-fpm" do
  action node[:phpfpm][:service_action]
end
