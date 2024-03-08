# change to http (this is the default)
git_http:
	git remote set-url origin https://github.com/WilliamLenoir/dotfiles.git
	git remote -v

# change to ssh
git_ssh:
	git remote set-url origin git@github.com:WilliamLenoir/dotfiles.git
	git remote -v

