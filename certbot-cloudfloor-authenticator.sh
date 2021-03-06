#!/bin/bash 

CloudFloor="username=DNS01-ServiceAcct@scavengineer.com&password=detcader42&aux=0&ttl=60&type=TXT&name=_acme-challenge"

DNS_APIURL="https://www.mtgsy.net/dns/api.php"

### END OF CONFIGURABLE PARAMETERS ###

[[ "${#BASH_SOURCE[@]}" -gt "1" ]] && { return 0; }

SET_REQUEST="$DNS_APIURL?command=addrecord&domainname=${CERTBOT_DOMAIN}&value=$CERTBOT_VALIDATION&${CloudFloor}"

wget -q "$SET_REQUEST" -O/dev/null

if [ "$?" -ne "0" ]; then
        echo "There was an error querying $SET_REQUEST"
        exit 1
fi

#Allow propagation of records
 sleep 30 

