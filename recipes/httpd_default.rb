# configure httpd

template "/etc/httpd/conf/httpd.conf" do
  variables node[:httpd][:config]
  source "httpd/conf/httpd.conf.erb"
  if node[:httpd][:service_action].include?(:start)
    notifies :restart, 'service[httpd]'
  end
end

template "/etc/httpd/conf.d/000-amimoto.conf.conf" do
  variables node[:httpd][:config]
  source "httpd/conf.d/000-amimoto.conf.erb"
  if node[:httpd][:service_action].include?(:start)
    notifies :restart, 'service[httpd]'
  end
end

template "/etc/httpd/conf.d/mod_remoteip.conf" do
  variables node[:httpd][:config]
  source "httpd/conf.d/mod_remoteip.conf.erb"
  if node[:httpd][:service_action].include?(:start)
    notifies :restart, 'service[httpd]'
  end
end

template "/etc/httpd/conf.d/wordpress.conf" do
  variables node[:httpd][:config]
  source "httpd/conf.d/wordpress.conf.erb"
  if node[:httpd][:service_action].include?(:start)
    notifies :restart, 'service[httpd]'
  end
end

service "httpd" do
  action node[:httpd][:service_action]
end
