# memcached install
pecl_pkg = 'php-pecl-memcached'
if node[:mod_php7][:enabled]
  pecl_pkg = 'php-pecl-memcached'
end
package pecl_pkg do
  action [:install, :upgrade]
  notifies :run, 'bash[update-motd]', :delayed
end

amzn2_extras 'memcached1.5'

package 'memcached' do
  action [:install, :upgrade]
  notifies :run, 'bash[update-motd]', :delayed
end

service "memcached" do
  action node[:memcached][:service_action]
end
