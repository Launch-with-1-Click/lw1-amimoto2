default[:yum][:repo][:amimoto_repo] = true
default[:yum][:repo][:remi][:php][:mirrorlist] = 'http://rpms.famillecollet.com/enterprise/6/remi/mirror'
default[:yum][:repo][:remi][:php][:baseurl] = 'http://rpms.famillecollet.com/enterprise/6/remi/$basearch/'
default[:yum][:repo][:remi][:php70][:mirrorlist] = 'http://rpms.famillecollet.com/enterprise/6/php70/mirror'
default[:yum][:repo][:remi][:php70][:baseurl] = 'http://rpms.famillecollet.com/enterprise/6/php70/$basearch/'
default[:yum][:repo][:remi][:php71][:mirrorlist] = 'http://rpms.famillecollet.com/enterprise/6/php71/mirror'
default[:yum][:repo][:remi][:php71][:baseurl] = 'http://rpms.famillecollet.com/enterprise/6/php71/$basearch/'
default[:yum][:repo][:remi][:php72][:mirrorlist] = 'http://rpms.famillecollet.com/enterprise/6/php72/mirror'
default[:yum][:repo][:remi][:php72][:baseurl] = 'http://rpms.famillecollet.com/enterprise/6/php72/$basearch/'
default[:yum][:repo][:remi][:php73][:mirrorlist] = 'http://rpms.famillecollet.com/enterprise/6/php73/mirror'
default[:yum][:repo][:remi][:php73][:baseurl] = 'http://rpms.famillecollet.com/enterprise/6/php73/$basearch/'
default[:yum][:repo][:nginx][:baseurl] = 'https://packagecloud.io/amimoto-nginx-mainline/amzn2/el/6/$basearch'
default[:yum][:repo][:percona][:baseurl] = 'http://repo.percona.com/centos/6Server/os/$basearch/'

if node[:yum][:repo][:amimoto_repo]
  default[:yum][:repo][:remi][:php][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/6/remi/x86_64/'
  default[:yum][:repo][:remi][:php70][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/6/remi-php70/x86_64/'
  default[:yum][:repo][:remi][:php71][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/6/remi-php71/x86_64/'
  default[:yum][:repo][:remi][:php72][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/6/remi-php72/x86_64/'
  default[:yum][:repo][:remi][:php73][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/6/remi-php73/x86_64/'
  default[:yum][:repo][:nginx][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/7/amimoto-nginx-mainline-amzn2/x86_64/'
  default[:yum][:repo][:percona][:baseurl] = 'https://repos.amimoto-ami.com/enterprise/6/percona/x86_64/'
end
