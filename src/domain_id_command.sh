domain_id () {
    # args
    local DOMAIN_ID=${args[domain_id]}

    # env
    DOMAIN_ID="${DOMAIN_ID:-$PLESK_DOMAIN_ID}"
    
    local JSON=$(curl $OPTIONS --compressed --cookie $COOKIES "$BASE_URL/smb/web/view" | getJson)
    echo $JSON | jq -r --arg domain $DOMAIN_NAME '.data.data.data[] | select(.displayName==$domain) | .domainId'
}

domain_id