# epel
amzn2_extras 'epel'

# amimoto-nginx-mainline
template "/etc/yum.repos.d/amimoto-nginx-mainline.repo" do
  source "yum/amimoto-nginx-mainline.repo.erb"
end

# MySQL
# 5.7: http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
# 8.0: http://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm

rpm_package 'mysql57-community-release' do
  source 'http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm'
  not_if { ::File.exist?('/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql-2022') }
end

rpm_package 'mysql80-community-release' do
  source 'http://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm'
  only_if { ::File.exist?('/etc/pki/rpm-gpg/RPM-GPG-KEY-mysql-2022') }
  notifies :run, "bash[modify_mysql_version]", :immediately
end

bash "modify_mysql_version" do
  action :nothing
  code <<-EOH
    yum-config-manager --disable mysql80-community
    yum-config-manager --enable mysql57-community
  EOH
end

# RHEL
if %w(redhat).include?(node[:platform])
  # nginx
  template '/etc/yum.repos.d/nginx.repo' do
    source 'yum/nginx.repo.erb'
    action :create
  end

  %w(libmcrypt).each do |pkg|
    yum_package pkg do
      action [:install, :upgrade]
      options '--enablerepo=epel'
      flush_cache [:before]
    end
  end

  # iuscommunity
  template '/etc/yum.repos.d/iuscommunity.repo' do
    source 'yum/iuscommunity.repo.erb'
    action :create
  end
end

