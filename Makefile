# This Makefile works to install git-token.
# However, it exist mainly as a source of inspiration for creating your own
# repository, possibly forked by this gist.
#
# See https://github.com/kaarmu/git-token

install:
	# Install any potential tokens
	mkdir -p ${HOME}/.local/share/git-token
ifeq (,"$(wildcard tokens/*)")
	cp -r tokens/* ${HOME}/.local/share/git-token
endif
	# Install the git-token script
	mkdir -p ${HOME}/.local/bin
	install -m=775 ./git-token ${HOME}/.local/bin/git-token

uninstall:
	# Remove tokens
	rm -r ${HOME}/.local/share/git-token
	# Remove script
	rm ${HOME}/.local/bin/git-token

reinstall: uninstall install

update: install

load:
	# Get tokens from system and put in this repository
	cp -rf ${HOME}/.local/share/git-token/* tokens
