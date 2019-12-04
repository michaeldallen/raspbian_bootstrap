diag :
	echo foo


unit.install : /etc/systemd/system/mpinet.service /usr/local/bin/boot_test.bash

/usr/local/bin/boot_test.bash : boot_test.bash
	cp -v boot_test.bash /usr/local/bin/boot_test.bash
	chmod -v +x /usr/local/bin/boot_test.bash

/etc/systemd/system/mpinet.service : mpinet.service
	cp -v mpinet.service /etc/systemd/system/mpinet.service
	systemctl daemon-reload

unit.status :
	systemctl status mpinet

unit.start :
	systemctl start mpinet

unit.log :
	journalctl -b -u mpinet

unit.enable :
	systemctl enable mpinet

unit.disable :
	systemctl disable mpinet


clean :
	@find * -type f -name '*~' -print | sort | xargs --no-run-if-empty rm -v

