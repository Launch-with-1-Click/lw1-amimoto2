## Nginx
default[:nginx][:enabled] = true
default[:nginx][:http2_enable] = false
default[:nginx][:ngx_cache_purge_enable] = false
default[:nginx][:ngx_mruby] = false
default[:nginx][:ngx_pagespeed] = false

default[:nginx][:packages] = %w{ nginx }
if node[:nginx][:ngx_cache_purge_enable]
  default[:nginx][:packages].push('nginx-mod-http_cache_purge23')
end
if node[:nginx][:ngx_mruby]
  default[:nginx][:packages].push('nginx-mod-ngx_mruby')
end
if node[:nginx][:ngx_pagespeed]
  default[:nginx][:packages].push('nginx-mod-ngx_pagespeed')
end

default[:nginx][:service_action] = [:disable, :stop]
if node[:nginx][:enabled]
  default[:nginx][:service_action] = [:enable, :start]
end

default[:nginx][:config][:user] = node[:web][:user]
default[:nginx][:config][:group] = node[:web][:group]
default[:nginx][:config][:backend_upstream] = 'unix:/var/run/nginx-backend.sock'
default[:nginx][:config][:php_upstream] = 'unix:/var/run/php-fpm.sock'
default[:nginx][:config][:upstream_keepalive] = 16
default[:nginx][:config][:listen] = '80'
default[:nginx][:config][:listen_ssl] = '443'
default[:nginx][:config][:listen_backend] = node[:nginx][:config][:backend_upstream]
default[:nginx][:config][:worker_processes] = node[:cpu][:total]
default[:nginx][:config][:client_max_body_size] = '32M'
default[:nginx][:config][:proxy_read_timeout] = '90'
default[:nginx][:config][:worker_rlimit_nofile] = '10240'
default[:nginx][:config][:worker_connections] = '8192'
default[:nginx][:config][:phpmyadmin_enable] = false
default[:nginx][:config][:wp_multisite] = false
default[:nginx][:config][:mobile_detect_enable] = false
default[:nginx][:config][:UA_ktai] = '(DoCoMo|J-PHONE|Vodafone|MOT-|UP\.Browser|DDIPOCKET|ASTEL|PDXGW|Palmscape|Xiino|sharp pda browser|Windows CE|L-mode|WILLCOM|SoftBank|Semulator|Vemulator|J-EMULATOR|emobile|mixi-mobile-converter|PSP)'
default[:nginx][:config][:UA_smartphone] ='(iPhone|iPod|incognito|webmate|Android|dream|CUPCAKE|froyo|BlackBerry|webOS|s8000|bada|IEMobile|Googlebot\-Mobile|AdsBot\-Google)'
default[:nginx][:config][:UA_smartphone_off] ='wptouch[^\\=]+\\=(normal|desktop)'

default[:nginx][:config][:expires_default] = 'off'
default[:nginx][:config][:expires_image] = 'max'
default[:nginx][:config][:expires_audio] = 'max'
default[:nginx][:config][:expires_video] = 'max'
default[:nginx][:config][:expires_css] = '30d'
default[:nginx][:config][:expires_js] = '30d'
default[:nginx][:config][:expires_pdf] = 'max'
default[:nginx][:config][:expires_flash] = '30d'
default[:nginx][:config][:expires_woff] = 'max'
default[:nginx][:config][:expires_eot] = 'max'
default[:nginx][:config][:abuse_ua_blocking] = false

default[:nginx][:config][:vpc_ips] = %w{
  10.0.0.0/8
  172.16.0.0/12
  192.168.0.0/16
  }
default[:nginx][:config][:cf_ips] = %w{
  120.52.22.96/27
  205.251.249.0/24
  180.163.57.128/26
  204.246.168.0/22
  18.160.0.0/15
  205.251.252.0/23
  54.192.0.0/16
  204.246.173.0/24
  54.230.200.0/21
  120.253.240.192/26
  116.129.226.128/26
  130.176.0.0/17
  108.156.0.0/14
  99.86.0.0/16
  205.251.200.0/21
  223.71.71.128/25
  13.32.0.0/15
  120.253.245.128/26
  13.224.0.0/14
  70.132.0.0/18
  15.158.0.0/16
  13.249.0.0/16
  18.238.0.0/15
  18.244.0.0/15
  205.251.208.0/20
  65.9.128.0/18
  130.176.128.0/18
  58.254.138.0/25
  54.230.208.0/20
  116.129.226.0/25
  52.222.128.0/17
  18.164.0.0/15
  64.252.128.0/18
  205.251.254.0/24
  54.230.224.0/19
  71.152.0.0/17
  216.137.32.0/19
  204.246.172.0/24
  18.172.0.0/15
  120.52.39.128/27
  118.193.97.64/26
  223.71.71.96/27
  18.154.0.0/15
  54.240.128.0/18
  205.251.250.0/23
  180.163.57.0/25
  52.46.0.0/18
  223.71.11.0/27
  52.82.128.0/19
  54.230.0.0/17
  54.230.128.0/18
  54.239.128.0/18
  130.176.224.0/20
  36.103.232.128/26
  52.84.0.0/15
  143.204.0.0/16
  144.220.0.0/16
  120.52.153.192/26
  119.147.182.0/25
  120.232.236.0/25
  54.182.0.0/16
  58.254.138.128/26
  120.253.245.192/27
  54.239.192.0/19
  18.68.0.0/16
  18.64.0.0/14
  120.52.12.64/26
  99.84.0.0/16
  130.176.192.0/19
  52.124.128.0/17
  204.246.164.0/22
  13.35.0.0/16
  204.246.174.0/23
  36.103.232.0/25
  119.147.182.128/26
  118.193.97.128/25
  120.232.236.128/26
  204.246.176.0/20
  65.8.0.0/16
  65.9.0.0/17
  108.138.0.0/15
  120.253.241.160/27
  64.252.64.0/18
  13.113.196.64/26
  13.113.203.0/24
  52.199.127.192/26
  13.124.199.0/24
  3.35.130.128/25
  52.78.247.128/26
  13.233.177.192/26
  15.207.13.128/25
  15.207.213.128/25
  52.66.194.128/26
  13.228.69.0/24
  52.220.191.0/26
  13.210.67.128/26
  13.54.63.128/26
  99.79.169.0/24
  18.192.142.0/23
  35.158.136.0/24
  52.57.254.0/24
  13.48.32.0/24
  18.200.212.0/23
  52.212.248.0/26
  3.10.17.128/25
  3.11.53.0/24
  52.56.127.0/25
  15.188.184.0/24
  52.47.139.0/24
  18.229.220.192/26
  54.233.255.128/26
  3.231.2.0/25
  3.234.232.224/27
  3.236.169.192/26
  3.236.48.0/23
  34.195.252.0/24
  34.226.14.0/24
  13.59.250.0/26
  18.216.170.128/25
  3.128.93.0/24
  3.134.215.0/24
  52.15.127.128/26
  3.101.158.0/23
  52.52.191.128/26
  34.216.51.0/25
  34.223.12.224/27
  34.223.80.192/26
  35.162.63.192/26
  35.167.191.128/26
  44.227.178.0/24
  44.234.108.128/25
  44.234.90.252/30
  }

## Apache
default[:httpd][:enable] = false
default[:httpd][:packages] = %w{
  php
  httpd
  httpd-devel
  httpd-manual
  httpd-tools
  }
default[:httpd][:service_action] = [:stop, :disable]
if node[:httpd][:enable]
  default[:httpd][:service_action] = [:enable, :start]
end
default[:httpd][:config][:user]  = node[:web][:user]
default[:httpd][:config][:group] = node[:web][:group]
default[:httpd][:config][:servername] = node[:web][:servername]
default[:httpd][:config][:listen] = '8080'
if node[:nginx][:enable]
  default[:httpd][:config][:listen] = '8080'
end
default[:httpd][:config][:allow_override] = 'NONE'
default[:httpd][:config][:max_requests_per_child] = 4000
default[:httpd][:config][:max_keep_alive_requests] = 2500
default[:httpd][:config][:keep_alive_timeout] = 5
