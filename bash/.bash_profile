#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

export PS1="\[\033[38;5;14m\]\u@\h \
\[\033[32m\]\w\[\033[0;31m\]\$(parse_git_branch)\[\033[00m\] \nλ "
export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k
export CLICOLOR=1
export TERM='xterm-256color'
export PATH="$HOME/.cargo/bin:$PATH" # add rust to path

#   -------------------------------
#   2.  CUSTOM COMMMANDS
#   -------------------------------

alias ~="cd ~"
alias c='clear'
alias cb='cd -'
alias b="cd .."
alias l='ls -FGlAhp'
alias rf='rm -rf'
alias dev='cd ~/Documents/Git'
alias bashup="vim ~/Documents/Git/dotfiles/bash/.bash_profile; source \
~/.bash_profile"
alias vimup="vim ~/Documents/Git/dotfiles/vim/.vimrc"
alias mongod="mongod --dbpath=/Users/sebblanchet/data/db"
alias bp="source ~/.bash_profile"

#   -------------------------------
#   3.  GENERIC FUNCTIONS
#   -------------------------------

# To create a ZIP archive of a folder
zipf ()
{
	zip -r "$1".zip "$1" ;
}

pins ()
{
	pip install $1
}

# Generate table of contents for given markdown file
tocgen(){
    echo "## Contents" ;
    echo ;
    cat $1 | grep '^## ' | grep -v Contents | sed 's/^## //' | while read -r title ;
    do link=$(echo $title | tr 'A-Z ' 'a-z-') ;
    echo "* [$title](#$link)" ;
    done
}


#   -------------------------------
#   4.  GIT shortcuts
#   -------------------------------
alias gl="git log"
alias gs="git status"
alias ga="git add ."
alias gp="git push"
alias gpf="git push --force"
alias grh="git reset --hard"
alias gfa="git fetch --all"
alias gh="git log --pretty=format:'%h' -n 1"
alias gdl='git diff HEAD^ HEAD' # Get dif to last commit
alias gdls='git diff HEAD^ HEAD --stat' # Get diff to last commit stats
alias gcan='git commit --amend --no-edit' # Ammenf last commit
alias gpfo='git push origin --force'
alias gpot='git push origin $(gitBranch) --tags'
alias gpo='git push origin $(gitBranch)'
alias grho='git reset --hard origin/$(gitBranch)'
alias gsub='git submodule update --recursive --remote --merge --force'
alias gamcan='ga; gcan; gpfo'

gd()
{
	git diff $1
}

gc()
{
	git commit -m "$1"
}

gckbr()
{
	git checkout -b "$1"
}

# Get current branch, used for PS1
parse_git_branch()
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

gitBranch()
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# All in one git add commit push
gall()
{
  git add .; git commit -m "$1"; git push
}

gtp()
{
  git add .; git commit -m "$1"; git tag -a "$2" -m "$1"; git push origin $(gitBranch) --tags
}

gto()
{
  git add .; git commit -m "$1"; git tag -a "$2" -m "$1"; git push origin --tags
}
