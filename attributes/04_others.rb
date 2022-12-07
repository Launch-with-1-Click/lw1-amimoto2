## memcached
default[:memcached][:enabled] = false
default[:memcached][:service_action] = [:disable, :stop]
if node[:memcached][:enabled]
  default[:memcached][:service_action] = [:enable, :start]
  default[:php][:packages].push('php-pecl-memcache')
end

## redis
default[:redis][:enabled] = false
default[:redis][:version] = '6'
default[:redis][:service_action] = [:disable, :stop]
if node[:redis][:enabled]
  default[:redis][:service_action] = [:enable, :start]
end
extra_redis_versions = ['redis4.0', 'redis6']
default[:redis][:exclusive_pkgs] = ['redis']
case node[:redis][:version]
when '4.0'
  default[:redis][:amzn2_extras] = 'redis4.0'
  extra_redis_versions.delete(node[:redis][:amzn2_extras])
  default[:redis][:exclusive_extras] = extra_redis_versions
when '6'
  default[:redis][:amzn2_extras] = 'redis6'
  extra_redis_versions.delete(node[:redis][:amzn2_extras])
  default[:redis][:exclusive_extras] = extra_redis_versions
end
default[:redis][:config][:bind] = '* -::*'

## goofys
default[:goofys][:install] = false
default[:goofys][:version] = '0.24.0'
default[:goofys][:packages] = %w{
  golang
  fuse
  }
default[:goofys][:source_url] = 'https://github.com/kahing/goofys/releases/download/v' + node[:goofys][:version] + '/goofys'
default[:goofys][:mount] = false
default[:goofys][:config][:profile] = 'default'
default[:goofis][:config][:reagion] = 'us-east-1'
default[:goofys][:config][:s3_bucket] = 's3_bucket_name'
default[:goofys][:config][:mount_point] = '/mnt/s3'

## letsencrypt
default[:letsencrypt][:install] = false
