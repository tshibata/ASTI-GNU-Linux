#!/bin/bash

set -e

SSLDIR=`dirname $0`
rm -rf $SSLDIR/certs
mkdir $SSLDIR/certs

curl -o $SSLDIR/ca-bundle.crt https://curl.haxx.se/ca/cacert.pem
cat $SSLDIR/ca-bundle.crt | grep -v "^$" | grep -v "^#" | while read LINE
do
	echo $LINE >> $SSLDIR/certs/tmp.pem
	if [ "$LINE" = '-----END CERTIFICATE-----' ]
	then
		mv $SSLDIR/certs/tmp.pem $SSLDIR/certs/`openssl x509 -noout -hash -in $SSLDIR/certs/tmp.pem`.0
	fi
done

