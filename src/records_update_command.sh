updateRecord() {    
    # args
    local ID=${args[record_id]}
    local HOST=${args[host]}
    local IP=${args[ip]}
    local DOMAIN_ID=${args[domain_id]}

    # env
    DOMAIN_ID="${DOMAIN_ID:-$PLESK_DOMAIN_ID}"

    local URL=$BASE_URL/smb/dns-zone/edit-record/id/$DOMAIN_ID/type/domain/recordId/$ID
    local TOKEN=$(curl $OPTIONS --cookie $COOKIES $URL | getToken)
    local DATA="type=A&typesForms%5BAType%5D%5BADomainName%5D=$HOST&typesForms%5BAType%5D%5BAttl%5D=300&typesForms%5BAType%5D%5BAIpAddress%5D=$IP&hidden=&forgery_protection_token=$TOKEN"
    local UPDATE_HEADER=(
        "Content-Type: application/x-www-form-urlencoded; charset=UTF-8"
        "X-Requested-With: XMLHttpRequest"
    )

    log "Updating $HOST with $IP"

    curl $OPTIONS --compressed --cookie $COOKIES "${UPDATE_HEADER[@]/#/-H}" -d $DATA $URL > /dev/null
}

updateRecord