#!/bin/sh

DOMAIN_DEFAUT=cloud.bencz.com
PEM_FOLDER="/etc/letsencrypt/live/${DOMAIN_DEFAUT}/" 
#LOG_FOLDER="/Users/YOUR_USER/letsencrypt/my_script/logs" 
#DATE=$(date +"%d-%m-%y")
#LOG_FILE="${LOG_FOLDER}/${DATE}.log" 

## Retrieve certificate - DELETE --dry-run AFTER THE TEST RUN WORKED
#sudo /Users/YOUR_USER/letsencrypt/letsencrypt-auto certonly -c cert.ini --dry-run
#
## Check that everything went fine
#LE_STATUS=$?
#
#if [ "$LE_STATUS" != 0 ]; then
#    echo Automated Get certificate failed:
#    cat $LOG_FILE
#    exit 1
#fi
 
# Generate a passphrase - UNCOMMENT THE NEXT LINE AFTER THE TEST RUN WORKED
PASS=$(openssl rand -base64 45 | tr -d /=+ | cut -c -30)

# Transform the pem files into a OS X Valid p12 file - UNCOMMENT THE NEXT LINE AFTER THE TEST RUN WORKED
sudo openssl pkcs12 -export -inkey "${PEM_FOLDER}privkey.pem" -in "${PEM_FOLDER}cert.pem" -certfile "${PEM_FOLDER}fullchain.pem" -out "${PEM_FOLDER}letsencrypt_sslcert.p12" -passout pass:$PASS

# import the p12 file in keychain - UNCOMMENT THE NEXT LINE AFTER THE TEST RUN WORKED
sudo security import "${PEM_FOLDER}letsencrypt_sslcert.p12" -f pkcs12 -k /Library/Keychains/System.keychain -P $PASS -T /Applications/Server.app/Contents/ServerRoot/System/Library/CoreServices/ServerManagerDaemon.bundle/Contents/MacOS/servermgrd

