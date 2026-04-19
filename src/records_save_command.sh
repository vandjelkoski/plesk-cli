save() {
    # args
    local DOMAIN_ID=${args[domain_id]}

    # env
    DOMAIN_ID="${DOMAIN_ID:-$PLESK_DOMAIN_ID}"

    local TOKEN=$(curl $OPTIONS --cookie $COOKIES $BASE_URL/smb/dns-zone/records-list/id/$DOMAIN_ID/type/domain| getToken)
    curl $OPTIONS --compressed --cookie $COOKIES -F forgery_protection_token=$TOKEN "$BASE_URL/smb/dns-zone/update/id/$DOMAIN_ID/type/domain?_randomId=$RANDOM"
}

save