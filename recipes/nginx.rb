# nginx install
node[:nginx][:packages].each do | pkg |
  yum_package pkg do
    action [:install, :upgrade]
    options ['--disablerepo=*', '--enablerepo=amimoto-nginx-mainline']
    notifies :run, 'bash[update-motd]', :delayed
  end
end

# create www Group
group node[:nginx][:config][:group] do
  members ['ec2-user',node[:nginx][:config][:user]]
  action :create
end

# configure nginx

template "/etc/nginx/nginx.conf" do
  variables node[:nginx][:config]
  source "nginx/nginx.conf.erb"
  notifies :restart, 'service[nginx]'
end

%W{ /etc/nginx/modules.d /etc/nginx/conf.d }.each do | dir_name |
  directory dir_name do
    owner "root"
    group "root"
    mode 00755
    recursive true
    action :create
  end
end

%w{ drop mobile-detect phpmyadmin php-fpm mime.types wp-front wp-multisite-subdir wp-singlesite }.each do | file_name |
  template "/etc/nginx/" + file_name do
    variables node[:nginx][:config]
    source "nginx/" + file_name + ".erb"
    notifies :reload, 'service[nginx]'
  end
end

%W{ /var/cache/nginx /var/log/nginx /var/lib/nginx /var/tmp/nginx /var/www/vhosts }.each do | dir_name |
  directory dir_name do
    owner node[:nginx][:config][:user]
    group node[:nginx][:config][:group]
    mode 00755
    recursive true
    action :create
  end
end

%w{ 00_real_ip.conf 01_expires_map.conf }.each do | file_name |
  template "/etc/nginx/conf.d/" + file_name do
    variables node[:nginx][:config]
    source "nginx/conf.d/" + file_name + ".erb"
    notifies :reload, 'service[nginx]'
  end
end

template "/etc/nginx/modules.d/default_module.conf" do
  variables node[:nginx][:config]
  source "nginx/modules.d/default_module.conf.erb"
  notifies :reload, 'service[nginx]'
end

if node[:nginx][:ngx_cache_purge_enable]
  template "/etc/nginx/modules.d/ngx_http_cache_purge_module.conf" do
    #variables node[:nginx][:config]
    source "nginx/modules.d/ngx_http_cache_purge_module.conf.erb"
    notifies :restart, 'service[nginx]'
  end
else
  file "/etc/nginx/modules.d/ngx_http_cache_purge_module.conf" do
    action :delete
    notifies :restart, 'service[nginx]'
  end
end

if node[:nginx][:ngx_mruby]
  template "/etc/nginx/modules.d/ngx_mruby_module.conf" do
    #variables node[:nginx][:config]
    source "nginx/modules.d/ngx_mruby_module.conf.erb"
    notifies :restart, 'service[nginx]'
  end
else
  file "/etc/nginx/modules.d/ngx_mruby_module.conf" do
    action :delete
    notifies :restart, 'service[nginx]'
  end
end
file "/etc/nginx/modules.d/ngx_http_mruby_module.conf" do
    action :delete
    notifies :restart, 'service[nginx]'
end

# remove ngx_pagespeed
file "/etc/nginx/modules.d/ngx_pagespeed_module.conf" do
  action :delete
  notifies :restart, 'service[nginx]'
end

# update www group

if node[:nginx][:enabled]
  group node[:nginx][:config][:group] do
    action :modify
    members [node[:nginx][:config][:user]]
    append true
  end
end

service "nginx" do
  action node[:nginx][:service_action]
  not_if { ::File.exist?('/usr/lib/systemd/system/nginx.service.d') }
end

systemd_unit 'nginx.service' do
  action node[:nginx][:service_action]
  only_if { ::File.exist?('/usr/lib/systemd/system/nginx.service.d') }
end
