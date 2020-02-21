link "/etc/localtime" do
	to "/usr/share/zoneinfo/" + node[:timezone]
end

template "/etc/sysconfig/clock" do
	source 'clock.erb'
	variables(
		:timezone => node[:timezone]
	)
	mode '0644'
	not_if {File.exist?("/etc/sysconfig/clock")}
end
ruby_block 'clock rewrite' do
	block do
		clock = Chef::Util::FileEdit.new("/etc/sysconfig/clock")
		clock.search_file_replace_line(/^ZONE=.*$/, "ZONE=\"#{node[:timezone]}\"")
		clock.write_file
	end
	only_if {File.exist?("/etc/sysconfig/clock")}
end