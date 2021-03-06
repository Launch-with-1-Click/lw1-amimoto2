require 'serverspec'
$LOAD_PATH.concat Dir.glob('/opt/chef/embedded/lib/ruby/gems/1.9.1/gems/*/lib')
require 'ohai'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end
  c.formatter = :documentation
  ENV['LANG'] = 'C'
end

ohai = Ohai::System.new
ohai.hints = {"ec2"=>{}}
ohai.all_plugins
$ohaidata = ohai.data


