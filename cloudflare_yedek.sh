#!/usr/bin/env bash

ACCOUNTID=""
ACCOUNTNAME=""
APIKEY=""

mkdir -p zones
curl -s -X GET "https://api.cloudflare.com/client/v4/zones??status=active&account.id=${ACCOUNTID}&page=1&per_page=150" -H  "X-Auth-Key:${APIKEY}" -H "X-Auth-Email:${ACCOUNTNAME}" -H "Content-Type:application/json" | jq -r '.result[] | .id' | while read -r line; do
#curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${line}" -H "X-Auth-Email:${ACCOUNTNAME}" -H "X-Auth-Key:${APIKEY}" -H "Content-Type:application/json"

domainname=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${line}" -H "X-Auth-Email:${ACCOUNTNAME}" -H "X-Auth-Key:${APIKEY}" -H "Content-Type:application/json" | jq -r '.result .name')
echo  ${domainname}
outputFile=$(echo $domainname | sed 's|\.|_|g')
echo ${domainname} >> "./zones/domains.txt"
echo "${line} | ${domainname} | ${outputFile}"
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${line}/dns_records/export" -H "X-Auth-Email:${ACCOUNTNAME}" -H "X-Auth-Key:${APIKEY}" -H "Content-Type:application/json"  > "./zones/${domainname}.zone"
done
