#!/bin/bash

cd wiki-abstracts

VERSION="20190120"
LANGS="af ar bg bn ca cs cy da de el en es et fa fi fr gu he hi hr hu id it ja kn ko lt lv mk ml mr ne nl no pa pl pt ro ru sk sl so sq sv sw ta te th tl tr uk ur vi"
for lang in $LANGS; do
	echo "Downloading ${lang}"
	wget -c https://dumps.wikimedia.org/${lang}wiki/${VERSION}/${lang}wiki-${VERSION}-abstract.xml.gz
done


ZH_CN_FILES="cn1 cn2 cn3 cn4 cn5 cn6"
for file in $ZH_CN_FILES; do
	echo "Downloading zh_${file}"
	wget -c https://dumps.wikimedia.org/zhwiki/${VERSION}/zhwiki-${VERSION}-abstract-zh-${file}.xml.gz
done
echo "<feed>" > zh-cnwiki-${VERSION}-abstract.xml
zcat zhwiki-${VERSION}-abstract-zh-cn*.xml.gz | grep -ve "^<feed>$" -ve "^</feed>$" >> zh-cnwiki-${VERSION}-abstract.xml
echo "</feed>" >> zh-cnwiki-${VERSION}-abstract.xml
gzip -9 zh-cnwiki-${VERSION}-abstract.xml


ZH_TW_FILES="tw1 tw2 tw3 tw4 tw5 tw6"
for file in $ZH_TW_FILES; do
	echo "Downloading zh_${file}"
	wget -c https://dumps.wikimedia.org/zhwiki/${VERSION}/zhwiki-${VERSION}-abstract-zh-${file}.xml.gz
done
echo "<feed>" > zh-twwiki-${VERSION}-abstract.xml
zcat zhwiki-${VERSION}-abstract-zh-tw*.xml.gz | grep -ve "^<feed>$" -ve "^</feed>$" >> zh-twwiki-${VERSION}-abstract.xml
echo "</feed>" >> zh-twwiki-${VERSION}-abstract.xml
gzip -9 zh-twwiki-${VERSION}-abstract.xml

cd -

