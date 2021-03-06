# configure nginx.conf
%w{ default.conf default.backend.conf }.each do | file_name |
  template "/etc/nginx/conf.d/" + file_name do
    variables(
      :listen => node[:nginx][:config][:listen],
      :listen_backend => node[:nginx][:config][:listen_backend],
      :server_name => node[:ec2][:instance_id],
      :document_root => node[:wordpress][:document_root],
      :wp_multisite => node[:nginx][:config][:wp_multisite],
      :mobile_detect_enable => node[:nginx][:config][:mobile_detect_enable],
      :phpmyadmin_enable => node[:nginx][:config][:phpmyadmin_enable]
    )
    source "nginx/conf.d/" + file_name + ".erb"
    notifies :restart, 'service[nginx]'
  end
end

if node[:nginx][:http2_enable]
  template "/etc/nginx/conf.d/default-ssl.conf" do
    variables(
      :listen => node[:nginx][:config][:listen_ssl],
      :listen_backend => node[:nginx][:config][:listen_backend],
      :server_name => node[:ec2][:instance_id],
      :document_root => node[:wordpress][:document_root],
      :wp_multisite => node[:nginx][:config][:wp_multisite],
      :mobile_detect_enable => node[:nginx][:config][:mobile_detect_enable],
      :phpmyadmin_enable => node[:nginx][:config][:phpmyadmin_enable]
    )
    source "nginx/conf.d/default-ssl.conf.erb"
    notifies :restart, 'service[nginx]'
  end
end

service "nginx" do
  action node[:nginx][:service_action]
  not_if { ::File.exist?('/usr/lib/systemd/system/nginx.service.d') }
end

systemd_unit 'nginx.service' do
  action node[:mysql][:service_action]
  only_if { ::File.exist?('/usr/lib/systemd/system/nginx.service.d') }
end
