%w[
php-pecl-redis
php-pecl-igbinary
].map do |pkg|
  package pkg do
    action [:install, :upgrade]
    notifies :reload, 'service[php-fpm]'
    notifies :run, 'bash[update-motd]', :delayed
  end
end