# create www Group
group node[:php][:config][:group] do
  members ['ec2-user',node[:php][:config][:user]]
  action :create
end

# php install
php_install_option = ['--skip-broken']
packages = node[:php][:packages].dup
if node[:phpfpm][:version] >= '80'
  amzn2_extras node[:phpfpm][:amzn2_extras] do
    action :install
    exclusive_extras node[:phpfpm][:exclusive_extras]
    exclusive_pkgs node[:phpfpm][:exclusive_pkgs]
  end

  php_install_option = [
    "--skip-broken"
  ]
  
  %w{ libwebp ImageMagick }.each do | pkg_name |
    yum_package pkg_name do
      action [:install, :upgrade]
      notifies :run, 'bash[update-motd]', :delayed
    end
  end
  
  package 'php-pecl-redis' do
    action [:remove]
    notifies :run, 'bash[update-motd]', :delayed
  end
  packages.delete('php-pecl-redis')

else
  node[:phpfpm][:exclusive_extras].each do | extra |
    amzn2_extras extra do
      action :disable
      only_if "amazon-linux-extras | grep 'enabled' | grep -q '#{extra}'"
      exclusive_pkgs node[:phpfpm][:exclusive_pkgs]
    end
  end
  amzn2_extras node[:phpfpm][:amzn2_extras] do
    action :disable
    only_if "amazon-linux-extras | grep 'enabled' | grep -q '#{node[:phpfpm][:amzn2_extras]}'"
    exclusive_pkgs node[:phpfpm][:exclusive_pkgs]
  end


  php_install_option = [
    "--skip-broken",
    "--disablerepo=*",
    "--enablerepo=epel,remi-php#{node[:phpfpm][:version]}"
  ]

  remote_file "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm" do
    source "http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
    #ssl_verify_mode :verify_none
    not_if "rpm -qa | grep -q '^remi'"
    action :create
    notifies :install, "rpm_package[remi-release]", :immediately
  end
  rpm_package "remi-release" do
    source "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm"
    action :nothing
  end
  bash 'remi-enable' do
    user 'root'
    code <<-EOC
      yum-config-manager --enable remi-php#{node[:phpfpm][:version]}
    EOC
  end

  %w{ harfbuzz libwebp ImageMagick }.each do | pkg_name |
    yum_package pkg_name do
      action [:install, :upgrade]
      notifies :run, 'bash[update-motd]', :delayed
    end
  end

  %w{ oniguruma oniguruma5php jq }.each do | pkg_name |
    yum_package pkg_name do
      action [:install, :upgrade]
      options [
        "--disablerepo=*",
        "--enablerepo=epel,remi,remi-php#{node[:phpfpm][:version]}"
      ]
      notifies :run, 'bash[update-motd]', :delayed
    end
  end

  if node[:phpfpm][:version] >= '72'
    %w{ php-mcrypt php-pecl-zip }.each do | pkg_name |
      yum_package pkg_name do
        action [:remove]
        notifies :run, 'bash[update-motd]', :delayed
      end
      packages.delete(pkg_name)
    end
  end
end

yum_package 'php-packages' do
  package_name packages
  action [:install, :upgrade]
  flush_cache [ :before ]
  options php_install_option
  notifies :reload, 'service[php-fpm]'
  notifies :run, 'bash[update-motd]', :delayed
  retries 2
  retry_delay 4
end

# configure php

%w{ php.ini php-fpm.conf php-fpm.d/www.conf }.each do | file_name |
  template "/etc/" + file_name do
    variables node[:php][:config]
    source "php/" + file_name + ".erb"
    notifies :reload, 'service[php-fpm]'
  end
end

# file '/etc/httpd/conf.d/php.conf' do
#   action :delete
# end

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

if node[:phpfpm][:enabled]
  group node[:php][:config][:group] do
    action :modify
    members [node[:php][:config][:user]]
    append true
  end
end

# php-fpm start
service "php-fpm" do
  action node[:phpfpm][:service_action]
end
