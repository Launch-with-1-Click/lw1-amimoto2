default[:monit][:config_file]    = '/etc/monit.conf'
default[:monit][:config_dir]     = '/etc/monit.d'
default[:monit][:config][:alert] = []

default[:monit][:monitor] = {
  'nginx'     => node[:nginx][:enabled],
  'httpd'     => node[:httpd][:enabled] || node[:mod_php7][:enabled],
  'php-fpm'   => node[:phpfpm][:enabled],
  'mysql'     => node[:mysql][:enabled],
  'memcached' => node[:memcached][:enabled],
  'redis'     => node[:redis][:enabled],
  'crond'     => true,
  'logging'   => true,
}

default[:monit][:source] = {
  'nginx'     => 'monit/nginx.erb',
  'httpd'     => 'monit/process_monitor.erb',
  'php-fpm'   => 'monit/php-fpm.erb',
  'mysql'     => 'monit/process_monitor.erb',
  'memcached' => 'monit/process_monitor.erb',
  'redis'     => 'monit/process_monitor.erb',
  'crond'     => 'monit/process_monitor.erb',
  'logging'   => 'monit/logging.erb'
}

default[:monit][:settings][:processes] = [
  {
   :name => 'nginx',
   :pidfile => '/var/run/nginx.pid',
   :start => '/bin/systemctl start nginx.service',
   :stop  => '/bin/systemctl stop nginx.service',
   :user  => node[:nginx][:config][:user],
   :group => node[:nginx][:config][:group],
   :rules => [
     'if failed port 80 protocol http then restart'
   ]
  },
  {
   :name => 'httpd',
   :pidfile => '/var/run/httpd/httpd.pid',
   :start => '/bin/systemctl start httpd.service',
   :stop  => '/bin/systemctl stop httpd.service',
   :user  => node[:nginx][:config][:user],
   :group => node[:nginx][:config][:group],
   :rules => [
   ]
  },
  {
   :name => 'php-fpm',
   :pidfile => '/var/run/php-fpm/php-fpm.pid',
   :start => '/bin/systemctl start php-fpm.service',
   :stop  => '/bin/systemctl stop php-fpm.service',
   :user  => node[:php][:config][:user],
   :group => node[:php][:config][:group],
   :rules => [
   ]
  },
  {
   :name => 'mysql',
   :pidfile => '/var/run/mysqld/mysqld.pid',
   :start => '/bin/systemctl start mysqld.service',
   :stop  => '/bin/systemctl stop mysqld.service',
   :user  => node[:mysql][:config][:user],
   :group => node[:mysql][:config][:group],
   :rules => [
   ]
  },
  {
   :name => 'memcached',
   :start => '/bin/systemctl start memcached.service',
   :stop  => '/bin/systemctl stop memcached.service',
   :rules => [
   ]
  },
  {
   :name => 'redis',
   :pidfile => '/var/run/redis/redis.pid',
   :start => '/bin/systemctl start redis.service',
   :stop  => '/bin/systemctl stop redis.service',
   :rules => [
   ]
  },
  {
   :name => 'crond',
   :pidfile => '/var/run/crond.pid',
   :start => '/bin/systemctl start crond.service',
   :stop  => '/bin/systemctl stop crond.service',
   :rules => [
   ]
  },
  {
   :name => 'logging',
   :rules => [
   ]
  },
]
