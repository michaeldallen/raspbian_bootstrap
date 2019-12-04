TIMEZONE="US/Eastern"
echo "$TIMEZONE" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
