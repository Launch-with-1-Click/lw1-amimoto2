default[:yum][:repo][:amimoto_repo] = true
default[:yum][:repo][:nginx][:baseurl] = 'https://packagecloud.io/amimoto-nginx-mainline/amzn2/el/6/$basearch'

if node[:yum][:repo][:amimoto_repo]
  default[:yum][:repo][:nginx][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/7/amimoto-nginx-mainline-amzn2/x86_64/'
end
