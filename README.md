# CloudFloor-Acme
ACME plugin for certbot + dns01 + cloudfloor DNS

DNS01 scripts for cloudfloor DNS

Use them like this:

Create a service account in Cloudfloor with limited access, just able to create and remove TXT records.  Edit the scripts to use the service account that you created.

certbot certonly --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges=dns --manual-cleanup-hook  /etc/letsencrypt/certbot-cloudfloor-cleanup.sh  --manual-auth-hook=/etc/letsencrypt/certbot-cloudfloor-authenticator.sh -d *.mydomain.rocks

