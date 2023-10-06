#!/bin/bash
if [ $1 == "" ]
then
	echo "--------------------------------------------"
	echo "Support pdf, doc, docx, xls, xlsx, ppt, pptx"
	echo "--------------------------------------------"
	echo "Modo de uso: ./metafind.sh target.com docx"
	echo "-------------------------------------------"
else
ALVO="$1"
ARQUIVO="$2"
lynx --dump "https://google.com/search?&q=site:$ALVO+ext:$ARQUIVO" | grep ".$ARQUIVO" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > $ALVO.txt
#lynx --dump "https://google.com/search?&q=site:desecsecurity.com+ext:pdf" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > desec
for url in $(cat $ALVO.txt);do wget -q $url;done  

fi
