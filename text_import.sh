#!/bin/bash
PAK=pak64
CONFIRM=true

while getopts 'n' opt; do
	case "$opt" in
		n)
			CONFIRM=false
			;;
		?|h)
			echo "Usage: $(basename $0) [-n]"
			exit 1
	esac
done

wget -q --post-data "version=312&choice=all&submit=Export!"  --delete-after https://translator.simutrans.com/script/main.php?page=wrap
wget -O texts.zip https://makie.de/translator/data/tab/language_pack-Scenario+Tutorial+$PAK.zip
mkdir tmp && cd tmp
unzip ../texts.zip
rsync -avr --exclude='en.tab' --exclude='_objectlist.txt' --exclude='_translate_users.txt' * ..
cd ..
rm -r tmp
rm texts.zip

if [ "$CONFIRM" = true ]
then
	git diff
	select yn in "Commit translations and push" "Keep changes but don't commit" "Cancel and reset"; do
		case $yn in
			"Commit translations and push" ) git add .; git commit -m "Translation: Import texts from Simutranslator"; git push; break;;
			"Keep changes but don't commit" ) break;;
			"Cancel and reset" ) git reset --hard origin/main; break;;
		esac
	done
else
	git add .; git commit -m "Translation: Import texts from Simutranslator"; git push;
fi
