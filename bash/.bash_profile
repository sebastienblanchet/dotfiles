#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

export PS1="\[\033[38;5;14m\]\u@\h \[\033[32m\]\w\[\033[0;31m\]\$(parse_git_branch)\[\033[00m\] $ "
export EDITOR=/usr/bin/vim
export BLOCKSIZE=1k
export CLICOLOR=1
export TERM='xterm-256color'

#   -------------------------------
#   2.  CUSTOM COMMMANDS
#   -------------------------------

alias ~="cd ~"                              # ~: Go Home
alias c='clear'                             # c: Clear terminal display
alias cb='cd -'                             # cb: Go back
alias b="cd .."
alias l='ls -FGlAhp'                       # Preferred 'ls' implementation
alias rmf='rm -rf'                          # remove
alias res='cd ~/Documents/Git/Resume/res'
alias resp='pdflatex Resume.tex'
alias dev='cd ~/Documents/Git'
alias vimup="vim ~/Documents/Git/dotfiles/vim/.vimrc"

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
alias gcan='git commit --amend --no-edit' # Ammenf last commit

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

# All in one git add commit push
gall() {
    git add . ; git commit -m "$1"; git push
}




#   -------------------------------
#   5.  LATEX COMMAND
#   -------------------------------

cleantex(){
	array=("*.aux" "*.upa")
	for i in "${array[@]}"
	do
		rm $i
	done
}


ctx(){
	# Define new variable name
	nm="Blanchet_Sebastien_"
	var=$1
	ts="_$(date +"%Y%m%d_%H%M%S").pdf";
	fname="$nm$var$ts"
	echo COMPILING $var.tex\;
	pdflatex $var.tex;
	echo \RENAMING $1.pdf TO out/$fname;
	# direx out;
	mv $var.pdf out/$fname
}

ctx_o(){
	# Define new variable name
	nm="Blanchet_Sebastien_"
	var=$1
	ts="_$(date +"%Y%m%d_%H%M%S").pdf";
	fname="$nm$var$ts"
	echo COMPILING $var.tex\;
	pdflatex $var.tex;
	echo \RENAMING $1.pdf TO out/$fname;
	# direx out;
	mv $var.pdf out/$fname;
	open out/$fname;
}

ts(){
	 date +"%Y%m%d_%H%M%S"
}


direx(){
	# if [ ! -d "$pwd/$1" ]
	# then
	# 	mkdir $1; echo \CREATED "$pwd/$1"
	# fi
	[ ! -d "$pwd/$1" ] && mkdir $1; echo \CREATED "$pwd/$1"|| \echo EXISTS "$pwd/$1"
}

texbib (){
	pdflatex $1.tex ; bibtex $1 ; pdflatex $1.tex ; pdflatex $1.tex
}
