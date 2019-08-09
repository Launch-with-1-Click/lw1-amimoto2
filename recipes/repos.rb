# epel
amzn2_extras 'epel'

# amimoto-nginx-mainline
template "/etc/yum.repos.d/amimoto-nginx-mainline.repo" do
  source "yum/amimoto-nginx-mainline.repo.erb"
end

# MySQL
# 5.7: http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
# 8.0: http://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

rpm_package 'mysql57-community-release' do
  source 'http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm'
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

