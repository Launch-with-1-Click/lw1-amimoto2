bash 'pecl-igbinary' do
    action :nothing
    code <<-EOH
        pecl install igbinary
    EOH
    notifies :create, "template[/etc/php.d/40-igbinary.ini]"
  
    subscribes :run, 'yum_package[php-cli]', :delayed
    subscribes :run, 'amzn2_extras[php8.0]', :delayed
end
  
template "/etc/php.d/40-igbinary.ini" do
    action :nothing
    source "php/php.d/40-igbinary.ini.erb"
end
  
bash 'pecl-redis' do
    action :nothing
    code <<-EOH
        pecl install -D 'enable-redis-igbinary="yes" enable-redis-lzf="no" enable-redis-zstd="no"' redis
    EOH
    notifies :create, "template[/etc/php.d/50-redis.ini]"
  
    subscribes :run, 'yum_package[php-cli]', :delayed
    subscribes :run, 'amzn2_extras[php8.0]', :delayed
end
  
template "/etc/php.d/50-redis.ini" do
    action :nothing
    source "php/php.d/50-redis.ini.erb"
end
  