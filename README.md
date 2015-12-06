# ipa.sh

Source code for the service at http://ipa.sh.

# Install

Python dependencies:

  * Python 3
  * bottle
  * user\_agents
  * pygeoip
  * gunicorn

Also install the OS package containing GeoIP.dat, for example; ``sudo apt-get install geoip-database-contrib`` on Debian-based and ``sudo yum install GeoIP-GeoLite-data`` on RedHat-based. 

## Configure

See examples for gunicorn and apache2 configurations.
