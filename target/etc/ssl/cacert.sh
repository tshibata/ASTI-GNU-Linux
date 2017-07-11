#!/bin/bash

set -e

SSLDIR=`dirname $0`

test -e $SSLDIR/certs && mv --backup=numbered $SSLDIR/certs $SSLDIR/certs.old

mkdir $SSLDIR/certs

test -e $SSLDIR/ca-bundle.crt && mv --backup=numbered $SSLDIR/ca-bundle.crt $SSLDIR/ca-bundle.crt.old

curl -o $SSLDIR/ca-bundle.crt https://curl.haxx.se/ca/cacert.pem

cat $SSLDIR/ca-bundle.crt | grep -v "^$" | grep -v "^#" | while read LINE
do
	echo $LINE >> $SSLDIR/certs/tmp.pem
	if [ "$LINE" = '-----END CERTIFICATE-----' ]
	then
		mv $SSLDIR/certs/tmp.pem $SSLDIR/certs/`openssl x509 -noout -hash -in $SSLDIR/certs/tmp.pem`.0
	fi
done

