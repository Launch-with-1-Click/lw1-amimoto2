#!/bin/bash
AMIMOTO_BRANCH='2019.07'

hash jq  || /usr/bin/yum -y install jq

[ ! -e /opt/local ] && mkdir -p /opt/local
[ ! -f /opt/local/amimoto.json ] && echo '{"run_list":["recipe[amimoto]"]}' > /opt/local/amimoto.json
[ "$(cat /opt/local/amimoto.json)" = "" ] && echo '{"run_list":["recipe[amimoto]"]}' > /opt/local/amimoto.json

# node[:mod_php7][:enabled] enabled
TMP_JSON=$(mktemp)
/usr/bin/jq -s '.[0] * .[1]' \
  <(echo '{"phpfpm":{"version":"74"}, "mod_php7":{"enabled":true}}') \
  /opt/local/amimoto.json \
  > ${TMP_JSON}
[ -f ${TMP_JSON} ] && mv -f ${TMP_JSON} /opt/local/amimoto.json

/usr/bin/curl -L -s https://raw.githubusercontent.com/Launch-with-1-Click/lw1-amimoto2/${AMIMOTO_BRANCH}/initial.wp-setup.sh | /bin/bash
