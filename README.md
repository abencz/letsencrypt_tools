# Using letsencrypt With Apple Server

## Renewing Certificates
1. Run `sudo letsencrypt renew` to renew the certificate
2. Run `scripts/import_cert.sh` to import the updated certificate into the OS X Keychain
3. In OS X server switch to the new certificate for each affected site
4. Open "Keychain Access" and remove the expring/expired certificates from the system

## References
* [Installing and Configuring LetsEncrypt on a Mac OS X Client Server](https://community.letsencrypt.org/t/installing-and-configuring-letsencrypt-on-a-mac-os-x-client-server/8407)
