#!/bin/sh
#
# Check gnu pass password with the haveibeenpwned.com database
#

# Change the dir to avoid further sed manipulations
cd ~

files=$(find .password-store -name password.gpg | sed -e 's/\.\<gpg\>//g' | sed -e 's/\.\<password-store\>\///g')


# Show passwords
for f in $files
do
	pass=$(pass show $f | tr -d [:space:])
	num=$(sh /home/fxleblanc/git/pass-pwned/pwned.sh $pass)
	if [ -n "$num" ]
	then
		printf "%s:%s:%s\n" $f $pass $num
	fi
done
