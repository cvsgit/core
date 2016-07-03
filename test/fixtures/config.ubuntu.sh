sudo mkdir /var/cvs
sudo cvs -d /var/cvs init

sudo cp test/fixtures/cvspserver /etc/xinetd.d/cvspserver

/etc/init.d/xinetd restart

netstat -tap | grep cvs
