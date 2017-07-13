#!/bin/bash

set -e

SSLDIR=`dirname $0`

curl -o $SSLDIR/tmp https://curl.haxx.se/ca/cacert.pem

test -e $SSLDIR/ca-bundle.crt && mv --no-target-directory --backup=numbered $SSLDIR/ca-bundle.crt $SSLDIR/ca-bundle.crt.old

mv $SSLDIR/tmp $SSLDIR/ca-bundle.crt

test -e $SSLDIR/certs && mv --no-target-directory --backup=numbered $SSLDIR/certs $SSLDIR/certs.old

mkdir $SSLDIR/certs

cat $SSLDIR/ca-bundle.crt | grep -v "^$" | grep -v "^#" | while read LINE
do
	echo $LINE >> $SSLDIR/certs/tmp.pem
	if [ "$LINE" = '-----END CERTIFICATE-----' ]
	then
		mv $SSLDIR/certs/tmp.pem $SSLDIR/certs/`openssl x509 -noout -hash -in $SSLDIR/certs/tmp.pem`.0
	fi
done

