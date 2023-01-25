%w{ php-pecl-redis php-pecl-igbinary }.each do | pkg |
  yum_package pkg do
    action [:install, :upgrade]
    options [
      "--skip-broken",
      "--disablerepo=*",
      "--enablerepo=epel,remi,remi-php#{node[:phpfpm][:version]}"
    ]
    notifies :reload, 'service[php-fpm]'
    notifies :run, 'bash[update-motd]', :delayed
  end
end