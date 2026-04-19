login() {
    local HEADERS=(
        "Content-Type: multipart/form-data"
        "Accept: */*"
        "X-Requested-With: XMLHttpRequest"
    )
    local TOKEN=$(curl -s $BASE_URL/login_up.php | getToken)
    local RESPONSE=$(curl $OPTIONS --cookie-jar $COOKIES --compressed -F login_name=$LOGIN_NAME -F passwd=$PASSWD -F locale_id=default "${HEADERS[@]/#/-H}" -H "X-Forgery-Protection-Token: $TOKEN" $BASE_URL/login_up.php)
    if echo "$RESPONSE" | grep -q '"forceRedirect":true'; then
        return 0
    else
        return 1
    fi
}

login