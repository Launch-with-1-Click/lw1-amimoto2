case node[:ec2][:instance_type]
when "t1.micro","t2.nano","t3.nano","t3a.nano"
  ## memcached
  default[:memcached][:enabled] = false
  default[:memcached][:service_action] = [:stop, :disable]

  ## redis
  default[:redis][:enabled] = false
  default[:redis][:service_action] = [:stop, :disable]

  ## Nginx
  default[:nginx][:config][:worker_processes] = '1'

  ## PHP
  default[:php][:config][:pm] = 'static'
  default[:php][:config][:max_children] = '2'
  default[:php][:config][:start_servers] = '1'
  default[:php][:config][:min_spare_servers] = '1'
  default[:php][:config][:max_spare_servers] = '4'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '32M'
  default[:mysql][:config][:query_cache_size] = '32M'
  default[:mysql][:config][:tmp_table_size]  = '32M'
  default[:mysql][:config][:table_open_cache] = '512'
  default[:mysql][:config][:max_connections] = '64'
  default[:mysql][:config][:thread_cache] = '64'
when "t2.micro","t3.micro","t3a.micro"
  ## memcached
  default[:memcached][:enabled] = false
  default[:memcached][:service_action] = [:disable, :stop]

  ## redis
  default[:redis][:enabled] = false
  default[:redis][:service_action] = [:disable, :stop]

  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '5'
  default[:php][:config][:start_servers] = '1'
  default[:php][:config][:min_spare_servers] = '1'
  default[:php][:config][:max_spare_servers] = '4'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '128M'
  default[:mysql][:config][:query_cache_size] = '64M'
  default[:mysql][:config][:tmp_table_size]  = '64M'
  default[:mysql][:config][:max_connections] = '128'
  default[:mysql][:config][:thread_cache] = '128'
when "t2.small","t3.small","t3a.small"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '5'
  default[:php][:config][:start_servers] = '1'
  default[:php][:config][:min_spare_servers] = '1'
  default[:php][:config][:max_spare_servers] = '4'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '128M'
  default[:mysql][:config][:query_cache_size] = '128M'
  default[:mysql][:config][:tmp_table_size]  = '128M'
  default[:mysql][:config][:max_connections] = '128'
  default[:mysql][:config][:thread_cache] = '128'
when "t2.medium","t3.medium","t3a.medium"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "t2.large","t3.large","t3a.large"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "t2.xlarge","t3.xlarge","t3a.xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '4'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "t2.2xlarge","t3.2xlarge","t3a.2xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m1.small"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '1'

  ## PHP
  default[:php][:config][:max_children] = '5'
  default[:php][:config][:start_servers] = '1'
  default[:php][:config][:min_spare_servers] = '1'
  default[:php][:config][:max_spare_servers] = '4'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '128M'
  default[:mysql][:config][:query_cache_size] = '128M'
  default[:mysql][:config][:tmp_table_size]  = '128M'
  default[:mysql][:config][:max_connections] = '128'
  default[:mysql][:config][:thread_cache] = '128'
when "m1.medium","m3.medium"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m1.large","m3.large","m4.large","m5.large","m5a.large","m5ad.large","m5d.large","m5dn.large","m5n.large","m5zn.large","m6i.large","m6id.large"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m1.xlarge","m2.xlarge","m3.xlarge","m4.xlarge","m5.xlarge","m5a.xlarge","m5ad.xlarge","m5d.xlarge","m5dn.xlarge","m5n.xlarge","m5zn.xlarge","m6i.xlarge","m6id.xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '4'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m2.2xlarge","m3.2xlarge","m4.2xlarge","m5.2xlarge","m5a.2xlarge","m5ad.2xlarge","m5d.2xlarge","m5dn.2xlarge","m5n.2xlarge","m5zn.2xlarge","m6i.2xlarge","m6id.2xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m2.4xlarge","m4.4xlarge","m5.4xlarge","m5a.4xlarge","m5ad.4xlarge","m5d.4xlarge","m5dn.4xlarge","m5n.4xlarge","m5zn.4xlarge","m6i.4xlarge","m6id.4xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '16'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m6i.8xlarge","m6id.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '32'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m4.10xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '40'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m5.12xlarge","m5a.12xlarge","m5ad.12xlarge","m5d.12xlarge","m5dn.12xlarge","m5n.12xlarge","m5zn.12xlarge","m6i.12xlarge","m6id.12xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '48'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m4.16xlarge","m5.16xlarge","m5a.16xlarge","m5ad.16xlarge","m5d.16xlarge","m5dn.16xlarge","m5n.16xlarge","m6i.16xlarge","m6id.16xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '64'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m5.24xlarge","m5a.24xlarge","m5ad.24xlarge","m5d.24xlarge","m5dn.24xlarge","m5n.24xlarge","m6i.24xlarge","m6id.24xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '96'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m5.metal","m5d.metal","m5dn.metal","m5n.metal","m5zn.metal"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '96'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m6i.32xlarge","m6id.32xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '128'

  ## PHP
  default[:php][:config][:max_children] = '100'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '1024M'
  default[:mysql][:config][:query_cache_size] = '1024M'
  default[:mysql][:config][:tmp_table_size]  = '1024M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "m6i.metal","m6id.metal"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '128'

  ## PHP
  default[:php][:config][:max_children] = '100'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '1024M'
  default[:mysql][:config][:query_cache_size] = '1024M'
  default[:mysql][:config][:tmp_table_size]  = '1024M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c1.medium"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c3.large","c4.large","c5.large","c5a.large","c5d.large","c5n.large","c6i.large","c6id.large","c6a.large"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c1.xlarge","c3.xlarge","c4.xlarge","c5.xlarge","c5a.xlarge","c5d.xlarge","c5n.xlarge","c6i.xlarge","c6id.xlarge","c6a.xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c3.2xlarge","c4.2xlarge","c5.2xlarge","c5a.2xlarge","c5d.2xlarge","c5n.2xlarge","c6i.2xlarge","c6id.2xlarge","c6a.2xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c3.4xlarge","c4.4xlarge","c5.4xlarge","c5a.4xlarge","c5d.4xlarge","c5n.4xlarge","c6i.4xlarge","c6id.4xlarge","c6a.4xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c3.8xlarge","c4.8xlarge","c5a.8xlarge","c6i.8xlarge","c6id.8xlarge","c6a.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '32'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c5.9xlarge","c5d.9xlarge","c5n.9xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '36'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c5.12xlarge","c5a.12xlarge","c5d.12xlarge","c6i.12xlarge","c6id.12xlarge","c6a.12xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '48'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c5a.16xlarge","c6a.16xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '64'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c5.18xlarge","c5d.18xlarge","c5n.18xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '72'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c5.24xlarge","c5a.24xlarge","c5d.24xlarge","c6i.24xlarge","c6id.24xlarge","c6a.24xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '96'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c5.metal","c5d.metal","c5n.metal","c6a.metal"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '96'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c6i.32xlarge","c6id.32xlarge","c6a.32xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '128'

  ## PHP
  default[:php][:config][:max_children] = '100'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '1024M'
  default[:mysql][:config][:query_cache_size] = '1024M'
  default[:mysql][:config][:tmp_table_size]  = '1024M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "c6i.metal","c6id.metal"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '128'

  ## PHP
  default[:php][:config][:max_children] = '100'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '1024M'
  default[:mysql][:config][:query_cache_size] = '1024M'
  default[:mysql][:config][:tmp_table_size]  = '1024M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r3.large","r4.large","r5.large","r5a.large","r5ad.large","r6i.large","r6id.large","r6a.large"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '2'

  ## PHP
  default[:php][:config][:max_children] = '20'
  default[:php][:config][:start_servers] = '4'
  default[:php][:config][:min_spare_servers] = '4'
  default[:php][:config][:max_spare_servers] = '16'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r3.xlarge","r4.xlarge","r5.xlarge","r5a.xlarge","r5ad.xlarge","r6i.xlarge","r6id.xlarge","r6a.xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r3.2xlarge","r4.2xlarge","r5.2xlarge","r5a.2xlarge","r5ad.2xlarge","r6i.2xlarge","r6id.2xlarge","r6a.2xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r3.4xlarge","r4.4xlarge","r5.4xlarge","r5a.4xlarge","r5ad.4xlarge","r6i.4xlarge","r6id.4xlarge","r6a.4xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r3.8xlarge","r4.8xlarge","r5.8xlarge","r5a.8xlarge","r5ad.8xlarge","r6i.8xlarge","r6id.8xlarge","r6a.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '32'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r6i.12xlarge","r6id.12xlarge","r6a.12xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '48'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r4.16xlarge","r5.16xlarge","r5a.16xlarge","r5ad.16xlarge","r6i.16xlarge","r6id.16xlarge","r6a.16xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '64'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r5.24xlarge","r5a.24xlarge","r5ad.24xlarge","r6i.24xlarge","r6id.24xlarge","r6a.24xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '96'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r5.metal","r6a.metal"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '96'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r6i.32xlarge","r6id.32xlarge","r6i.32xlarge","r6id.32xlarge","r6a.32xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '128'

  ## PHP
  default[:php][:config][:max_children] = '100'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '1024M'
  default[:mysql][:config][:query_cache_size] = '1024M'
  default[:mysql][:config][:tmp_table_size]  = '1024M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "r6i.metal","r6id.metal"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '128'

  ## PHP
  default[:php][:config][:max_children] = '100'
  default[:php][:config][:start_servers] = '10'
  default[:php][:config][:min_spare_servers] = '10'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '1024M'
  default[:mysql][:config][:query_cache_size] = '1024M'
  default[:mysql][:config][:tmp_table_size]  = '1024M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "g2.2xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "cg1.4xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '16'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "cc2.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '32'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "cr1.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '32'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "i2.xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '4'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "i2.2xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '8'

  ## PHP
  default[:php][:config][:max_children] = '35'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '256M'
  default[:mysql][:config][:query_cache_size] = '256M'
  default[:mysql][:config][:tmp_table_size]  = '256M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "i2.4xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '16'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "i2.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '32'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "hs1.8xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '16'

  ## PHP
  default[:php][:config][:max_children] = '80'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
when "hi1.4xlarge"
  ## Nginx
  default[:nginx][:config][:worker_processes] = '16'

  ## PHP
  default[:php][:config][:max_children] = '50'
  default[:php][:config][:start_servers] = '5'
  default[:php][:config][:min_spare_servers] = '5'
  default[:php][:config][:max_spare_servers] = '25'
  default[:php][:config][:max_requests] = '200'

  ## MySQL
  default[:mysql][:config][:innodb_buffer_pool_size] = '512M'
  default[:mysql][:config][:query_cache_size] = '512M'
  default[:mysql][:config][:tmp_table_size]  = '512M'
  default[:mysql][:config][:max_connections] = '256'
  default[:mysql][:config][:thread_cache] = '256'
end

## memcached
if node[:memcached][:enabled]
  default[:memcached][:service_action] = [:enable, :start]
end

## redis
if node[:redis][:enabled]
  default[:redis][:service_action] = [:enable, :start]
end
