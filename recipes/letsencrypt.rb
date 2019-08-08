package 'certbot' do
  action [:install, :upgrade]
  notifies :run, 'bash[update-motd]', :delayed
end

include_recipe 'amimoto::update-motd'
