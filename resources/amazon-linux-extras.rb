resource_name :amzn2_extras
default_action :install

property :exclusive_extras, Array, default: []
property :exclusive_pkgs, Array, default: []

load_current_value do
end

action :install do
  if current_state  == 'enabled'
    log 'up to date'
    return
  end

  remove_pkgs(new_resource.exclusive_pkgs) if new_resource.exclusive_pkgs.any?
  new_resource.exclusive_extras.each do |extra|
    disable_extra(extra)
  end

  execute "amazon-linux-extras install -y #{new_resource.name}"
end


action_class do
  def logg
    log "def into"
  end

  def current_state
    result = shell_out("amazon-linux-extras list | grep #{new_resource.name}")
    lines = result.stdout.split("\n")
    return lines.first.split[2] if lines.length == 1

    if lines.length == 0
      raise ::Chef::Exceptions::ResourceNotFound, "#{new_resource.name} is not provided by amazon-linux-extra"
    end

    founds = lines.select {|l| l.split[1] == new_resource.name }
    if founds.length > 1
      found_extras = founds.map {|ex| ex.split[1]}
      raise ::Chef::Exceptions::MultipleIdentityError, "#{new_resource.name} matches #{found_extras}"
    end

    founds.first.split[2]
  end

  def remove_pkgs(pkgs)
    execute "yum remove -y #{pkgs.join(' ')}"
  end

  def disable_extra(extra)
    execute "amazon-linux-extras disable #{extra}"
  end
end
