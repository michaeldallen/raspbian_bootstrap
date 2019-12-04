ANSIBLE_LOG     = ansible.log
CRUFT_ENUMERATE = find * -name '*~' -o -name '*.retry' -o -name '${ANSIBLE_LOG}'
CRUFT_WARN      = while read t ; do echo planning to gun down "'$${t}'" ; done
CRUFT_CLEAN     = xargs --no-run-if-empty rm -v

BLANK_LINE = echo ""

default :
	@echo "ansible: `ansible --version`"
	@echo "try one of these:" && for tgt in clean really_clean bootstrap software ; do echo "    make $${tgt}" ; done

clean :
	${BLANK_LINE} ; ${CRUFT_ENUMERATE} | ${CRUFT_WARN}

really_clean clean!:
	${BLANK_LINE} ; ${CRUFT_ENUMERATE} | ${CRUFT_CLEAN}


debian9_software :
	@touch ${ANSIBLE_LOG}
	ansible-playbook -i 'localhost,' --connection=local debian9_software.yml
