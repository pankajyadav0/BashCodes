if [[ -e config.txt ]] ; then
	echo 'The file "config.txt" already exists. Comparing with default . . .'
	diff -u config-default.txt config.txt > config-diff.txt
	echo 'A diff has been written to "config-diff.txt".'
else
	echo 'The file "config.txt" does not exist. Copying default . . .'
	cp config-default.txt config.txt
	echo '. . . done.'
fi
