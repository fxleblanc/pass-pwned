#!/bin/sh
#
# Check if password is pwned
#

pass=$1
hsh=$(echo -n $pass | sha1sum | cut -c1-40 | tr '[a-z]' '[A-Z]')
fst=$(echo -n $hsh | cut -c1-5)
res=$(curl -s "https://api.pwnedpasswords.com/range/$fst")
for r in $res
do
	suf=$(echo -n $r | cut -d ":" -f1)
	cmp="$fst$suf"
	if [ $hsh = $cmp ]
	then
		num=$(echo -n $r | cut -d ":" -f2)
		echo "$num"
	fi
done
