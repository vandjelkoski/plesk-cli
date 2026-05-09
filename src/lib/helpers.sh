COOKIES=cookie.txt
OPTIONS='-s'
BASE_URL="${PLESK_BASE_URL:-https://dnshosting01.oblaci.rs:8443}"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

getToken () {
    grep -o '"forgery_protection_token" content="[^"]*' < /dev/stdin | sed 's/"forgery_protection_token" content="//'
}

getJson () {
    grep -oh 'Plesk.run(.*);' < /dev/stdin | sed -e "s/Plesk.run(//" -e "s/);//"
}