bash 'pecl-igbinary' do
    action :nothing
    code <<-EOH
        pecl install igbinary
        echo "extension=igbinary.so" > /etc/php.d/40-igbinary.ini
    EOH
    notifies :reload, 'service[php-fpm]'
  
    subscribes :run, 'yum_package[php-packages]', :delayed
end
  
bash 'pecl-redis' do
    action :nothing
    code <<-EOH
        pecl install -D 'enable-redis-igbinary="yes" enable-redis-lzf="no" enable-redis-zstd="no"' redis
        echo "extension=redis.so" > /etc/php.d/50-redis.ini
    EOH
    notifies :reload, 'service[php-fpm]'
  
    subscribes :run, 'yum_package[php-packages]', :delayed
end