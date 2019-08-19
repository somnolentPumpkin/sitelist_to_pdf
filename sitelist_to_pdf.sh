#!/bin/bash

SITELIST=site-list.txt
HTTPS="https://"
HTTP="http://"

function site_to_pdf() {
	for SITE in $(cat ./site-list.txt)
	do
		DOMAIN=$(echo $SITE | cut -d '.' -f1)
		DOMAIN=${DOMAIN//$HTTPS}
		DOMAIN=${DOMAIN//$HTTP}
		WPATH=$(echo $SITE | cut -d '/' -f2)
		FILE="$DOMAIN.pdf"
		if [[ $WPATH != $SITE ]];
		then
			if [[ $WPATH != "" ]];
			then
				FILE="$DOMAIN-$WPATH.pdf"
			fi
		else
			FILE="$DOMAIN.pdf"
		fi
#		echo "$FILE"
#		echo "$SPATH"
		echo $SITE ">" $FILE
		$(wkhtmltopdf -q $SITE $FILE 2>/dev/null)
		#echo "$SITE"
	done
}


if test -f "$SITELIST"; then
		site_to_pdf
else
	echo "Site-list not found. Creating sample file."
	$(touch site-list.txt)
	$(echo "example.com" > site-list.txt)
	site_to_pdf
fi
