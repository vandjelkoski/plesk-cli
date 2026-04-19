records_list() {
    # args
    local DOMAIN_ID=${args[domain_id]}
    
    # env
    DOMAIN_ID="${DOMAIN_ID:-$PLESK_DOMAIN_ID}"

    local PAGE=$(curl $OPTIONS --compressed --cookie $COOKIES "$BASE_URL/smb/dns-zone/records-list/id/$DOMAIN_ID/type/domain")
    local JSON=$(echo $PAGE | getJson)
    local TOKEN=$(echo $PAGE | getToken)
    echo $JSON | jq -c '.data.data.data[] | select(.type=="A")'
}

records_list