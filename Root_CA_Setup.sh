#!/usr/bin/env bash

if [[ -n "$(find /tmp/cacerts/ -iname *.crt)" ]]; then
	for f in /tmp/cacerts/*; do
		case "$f" in
				*.crt)     $JAVA_HOME/bin/keytool -import -alias $f -keystore /etc/ssl/certs/java/cacerts -file "/tmp/cacerts/$f.crt" ;;
				*.cer)     $JAVA_HOME/bin/keytool -import -alias $f -keystore /etc/ssl/certs/java/cacerts -file "/tmp/cacerts/$f.cer" ;;
				*)         echo "$0: ignoring $f" ;;

		esac
	done
fi	
