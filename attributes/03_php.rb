## PHP
default[:phpfpm][:enabled] = true
default[:phpfpm][:version] = '80'
extra_php_versions = ['php7.1', 'php7.2', 'php7.3', 'php7.4', 'php8.0', 'php8.1']
default[:phpfpm][:exclusive_pkgs] = ['php', 'php-common', 'jq', 'oniguruma']
case node[:phpfpm][:version]
when '81'
  default[:phpfpm][:amzn2_extras] = 'php8.1'
  extra_php_versions.delete(node[:phpfpm][:amzn2_extras])
  default[:phpfpm][:exclusive_extras] = extra_php_versions
when '80'
  default[:phpfpm][:amzn2_extras] = 'php8.0'
  extra_php_versions.delete(node[:phpfpm][:amzn2_extras])
  default[:phpfpm][:exclusive_extras] = extra_php_versions
when '74'
  default[:phpfpm][:amzn2_extras] = 'php7.4'
  extra_php_versions.delete(node[:phpfpm][:amzn2_extras])
  default[:phpfpm][:exclusive_extras] = extra_php_versions
when '73'
  default[:phpfpm][:amzn2_extras] = 'php7.3'
  extra_php_versions.delete(node[:phpfpm][:amzn2_extras])
  default[:phpfpm][:exclusive_extras] = extra_php_versions
when '72'
  default[:phpfpm][:amzn2_extras] = 'php7.2'
  extra_php_versions.delete(node[:phpfpm][:amzn2_extras])
  default[:phpfpm][:exclusive_extras] = extra_php_versions
when '71'
  default[:phpfpm][:amzn2_extras] = 'php7.1'
  extra_php_versions.delete(node[:phpfpm][:amzn2_extras])
  default[:phpfpm][:exclusive_extras] = extra_php_versions
end

default[:phpfpm][:service_action] = [:disable, :stop]
if node[:phpfpm][:enabled]
  default[:phpfpm][:service_action] = [:enable, :start]
end

### mod_php7
default[:mod_php7][:enabled] = false
if node[:mod_php7][:enabled]
  force_default[:httpd][:enabled] = true
  force_default[:httpd][:service_action] = [:enable, :start]
  force_default[:httpd][:config][:listen] = '8080'
  force_default[:httpd][:config][:allow_override] = 'ALL'
  force_default[:nginx][:config][:backend_upstream] = '127.0.0.1:8080'
  force_default[:phpfpm][:enabled] = false
  force_default[:phpfpm][:service_action] = [:disable, :stop]
  force_default[:httpd][:config][:keep_alive_timeout] = 120
end


default[:php][:packages] = %w{
  php
  php-cli
  php-fpm
  php-mbstring
  php-gd
  php-pear
  php-xml
  php-intl
  php-soap
  php-mysqlnd
  php-pdo
  php-opcache
  php-pear
  php-bcmath
  }
if node[:phpfpm][:version] < '72'
  default[:php][:packages].push('php-mcrypt')
end

default[:php][:config][:user] = node[:web][:user]
default[:php][:config][:group] = node[:web][:group]
default[:php][:config][:listen] = '/var/run/php-fpm.sock'
if node[:phpfpm][:enabled]
  default[:nginx][:config][:php_upstream] = 'unix:/var/run/php-fpm.sock'
end
default[:php][:config][:listen_backlog] = '65536'
default[:php][:config][:rlimit_files] = '131072'
default[:php][:config][:rlimit_core] = '0'
default[:php][:config][:pm] = 'dynamic'
default[:php][:config][:max_children] = '5'
default[:php][:config][:start_servers] = '1'
default[:php][:config][:min_spare_servers] = '1'
default[:php][:config][:max_spare_servers] = '4'
default[:php][:config][:memory_limit] = '128M'
default[:php][:config][:max_requests] = '200'
default[:php][:config][:max_input_vars] = '1000'
default[:php][:config][:max_input_time] = '60'
default[:php][:config][:max_input_nesting_level] = '64'
default[:php][:config][:upload_max_filesize] = node[:nginx][:config][:client_max_body_size]
default[:php][:config][:post_max_size] = node[:php][:config][:upload_max_filesize]
default[:php][:config][:request_terminate_timeout] = node[:nginx][:config][:proxy_read_timeout]
default[:php][:config][:request_slowlog_timeout] = node[:php][:config][:request_terminate_timeout]
default[:php][:config][:max_execution_time] = node[:nginx][:config][:proxy_read_timeout]
default[:php][:config][:session_save_hundler] = 'files'
default[:php][:config][:session_save_path] = '/tmp'
default[:php][:config][:sendmail_path] = '/usr/sbin/sendmail -t -i'
default[:php][:config][:limit_extensions] = '.php'
