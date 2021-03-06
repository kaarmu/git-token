# This Makefile works to install git-token.
# However, it exist mainly as a source of inspiration for creating your own
# repository, possibly forked by this gist.
#
# See https://github.com/kaarmu/git-token

install:
	# Install any potential tokens
	mkdir -p ${HOME}/.local/share/git-token
	[ -d tokens ] && install tokens/* "${HOME}/.local/share/git-token/"
	# Install the git-token script
	install -m=775 ./git-token ${HOME}/.local/bin/git-token
