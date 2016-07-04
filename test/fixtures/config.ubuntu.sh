sudo mkdir /var/cvs
sudo cvs -d /var/cvs init
sudo cp test/fixtures/cvspserver /etc/xinetd.d/cvspserver
sudo service xinetd restart

netstat -tap | grep cvs
