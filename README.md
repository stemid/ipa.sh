# ipa.sh

Source code for the service at http://ipa.sh.

# Usage

Can be used in terminal from any Linux host.

    $ curl ipa.sh
    99.99.99.91

    $ curl 'ipa.sh/?v&pp'
    {'pretty json output'}

Those are the only two arguments available. _v_ also provides more output in browser mode. 

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
