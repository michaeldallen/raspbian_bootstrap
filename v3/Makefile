LOG    = 2>&1 | tee -a log.$(shell date +%Y.%m.%d_%H.%M.%S).$@
DATE   = date | sed -n '/\(.*\)/ { h ; 's/./-/g' p ; x ; p ; x ; p }'
IAM   := flasher


SHELL := /bin/bash

.PHONY: make.vars make.targets make.clean make.default

make.default : make.vars make.targets

make.vars :
	@echo "available variables"
	@$(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk '/^# makefile/,/^[^#]/ { if ($$1 !~ "^[#.]") {print $$$$1} }' \
	| sed -e 's/ := / !:= /' -e 's/ = / ! = /' \
	| column -t -s'!' \
	| sed 's/  \([:=]\)/\1/' \
	| sed 's/^/    /' \
	| sort

make.targets :
	@echo "available Make targets:"
	@$(MAKE) -pRrq -f $(firstword $(MAKEFILE_LIST)) : 2>/dev/null \
	| awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' \
	| egrep -v '^make.default$$' \
	| sed 's/^/    make    /' \
	| sed 's/make    maven.release/make -n maven.release/' \
	| sort


make.clean : 
	rm -vf *~
	rm -vf *.retry

ansible.debian-dist-upgrade :
	ansible-playbook --inventory=mpinet-ah.inventory --connection=local debian-dist-upgrade.yml

ansible.debian-packages :
	ansible-playbook --inventory=mpinet-ah.inventory --connection=local debian-packages.yml

ansible.hostconfig :
	ansible-playbook --inventory=mpinet-ah.inventory --connection=local hostconfig.yml

#EOF
