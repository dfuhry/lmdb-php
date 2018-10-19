all:
	gcc -Wall -Wno-unused-label -Wno-unused-function -Wno-unused-variable -O2 -shared -fpic  lmdb-php_wrap.c -I/usr/local/include/php/Zend/ -I/usr/local/include/php/TSRM/ -I/usr/local/include/php/ -I/usr/local/include/php/main/ -I/usr/include/php5/Zend/ -I/usr/include/php5/ -I/usr/include/php5/TSRM/ -I/usr/include/php5/main/ -llmdb -o lmdb-php.so

swig-php5:
	swig -php5 -Wall lmdb-php.i

test:
	cd tests && ( for p in *php; do echo -n "$$p: "; php -d extension=../lmdb-php.so $$p > /dev/null  && echo OK || echo NOT OK; done )



