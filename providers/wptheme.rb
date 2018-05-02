action :install do
  wpcontent_path = "#{::File.join(new_resource.install_path,'/wp-content/')}"
  themes_path  = "#{::File.join(new_resource.install_path,'/wp-content/themes/')}"
  install_path = "#{::File.join(new_resource.install_path,'/wp-content/themes/',new_resource.theme_name)}"
  release_file = "#{new_resource.theme_name}.zip"
  work_file    = "#{::File.join('/tmp/.cache/wpthemes/',release_file)}"
  release_url  = "http://downloads.wordpress.org/theme/#{new_resource.theme_name}.zip"

  directory '/tmp/.cache/wpthemes/' do
    recursive true
    owner node[:nginx][:config][:user]
    group node[:nginx][:config][:group]
    mode 00775
    action :create
  end

  # recursive option did not set mode of parents dir.
  [wpcontent_path, themes_path].each do |dir|
    directory dir do
      owner node[:nginx][:config][:user]
      group node[:nginx][:config][:group]
      mode 00775
      action :create
    end
  end

  directory install_path do
    recursive true
    owner node[:nginx][:config][:user]
    group node[:nginx][:config][:group]
    mode 00775
    action :create
    notifies :run, 'bash[wp-theme-unpack]', :immediately
  end

  remote_file work_file do
    source release_url
    action :create
    notifies :run, 'bash[wp-theme-unpack]', :immediately
  end

  # unpack WordPress theme
  bash "wp-theme-unpack" do
    action :nothing
    user "root"
    umask '0002'
    cwd "/tmp"
    only_if "test -f #{work_file}"
    code <<-EOH
      /usr/bin/unzip #{work_file} -d #{themes_path}
      chown -R #{node[:nginx][:config][:user]}:#{node[:nginx][:config][:group]} #{install_path}
      find #{install_path} -type d -exec chmod 775 {} \;
      find #{install_path} -type f -exec chmod 664 {} \;
    EOH
  end
end
