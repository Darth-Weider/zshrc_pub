export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/opt/gorson/bin"
export PATH=/usr/local/Terraform/:$PATH
export PATH=/usr/local/bin/aws:$PATH
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export LDFLAGS="-L/usr/local/opt/ilmbase/lib"
export CPPFLAGS="-I/usr/local/opt/ilmbase/include"
export PKG_CONFIG_PATH="/usr/local/opt/ilmbase/lib/pkgconfig"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# LESS man page colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export ITERM2_SQUELCH_MARK=1
export CLICOLOR=1
export AWS_PAGER="" ##"less" or "" https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-pagination.html

export AWS_DEFAULT_REGION=us-east-1
export AWS_SDK_LOAD_CONFIG=1 #Needed for terraform to work with AWS profiles
export AWS_SHARED_CREDENTIALS_FILE=$HOME/.aws/credentials
export GRANTED_QUIET=true ##Reference: https://docs.commonfate.io/granted/configuration
export OP_SERVICE_ACCOUNT_TOKEN="$(cat $HOME/.config/op/service_account_token)"

# Use oh-my-posh instead of oh-my-zsh prompt
#ZSH_THEME=
eval "$(oh-my-posh --init --shell zsh --config ~/terminal_prompt/aliens_v2.omp_aws.json)" #Prompt settings require oh-my-posh https://github.com/JanDeDobbeleer/oh-my-posh

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(ansible aws docker git terraform macos kubectl) #work related plugins
autoload -Uz compinit && compinit
plugins+=(vscode fzf)
#fzf-tab plugin https://github.com/Aloxaf/fzf-tab#oh-my-zsh
#fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting!!
source  ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.zsh
#References https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
plugins+=(zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh #For ZSH only

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias python=/usr/local/bin/python3                                    # Set Python 3 as default Python
alias pip=/usr/local/bin/pip3                                          # Set pip3 as default pip
alias dodo="pmset sleepnow"                                            # set computer to sleep immediatly
alias httpstatuscode="curl -w %{http_code} -s --output /dev/null $1"   # Retrieves the http status code for any URL
alias gohome="cd ~"                                                    # Go back to my home folder
alias reload="source ~/.zshrc"                                  # Reloads the prompt, usefull to take new modifications into account
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias powershell="/usr/local/bin/pwsh"                                # Open up PowerShell
alias public_ip="dig +short myip.opendns.com @resolver1.opendns.com"  # Public ip
alias local_ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'" # Local ip
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete && find . -name 'Thumbs.db' -type f -ls -delete" # removes a bunch of crap from your finder
alias rm="rm -i"
alias firefox=/Applications/Firefox.app/Contents/MacOS/firefox
alias lsh="lsd -ld .??*" # only show dot files
alias ls="lsd"
alias cat="ccat"
alias restartdock="killall -KILL Dock"
alias memory_status="top -l 1 -s 0 | grep PhysMem"
alias drop_rc="env -i zsh -f"
alias star_wars="{ sleep 1 ; echo starwars ; sleep 99999 ;} | nc -c telehack.com 23"

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

timestamp=$(date +"%D %T")

# Find files and ignore directories
function ff(){
  find . -iname $1 | grep -v .svn | grep -v .sass-cache
}

function fif(){
	if [ "$#" -eq 1 ]; then
		grep -nr $1 . --color
	else
		s `grep -nr $1 . | sed -n $2p | cut -d: -f-2`
	fi

}

# export git repo
function gitexport(){
	mkdir -p "$1"
	git archive master | tar -x -C "$1"
}

function randompw() {
	if [ -z $1 ]; then
		MAXSIZE=27
	else
		MAXSIZE=$1
	fi
	array1=(
	q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D
	F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0
	\! \@ \$ \% \^ \& \* \! \@ \$ \% \^ \& \* \@ \$ \% \^ \& \*
	)
	MODNUM=${#array1[*]}
	pwd_len=0
	while [ $pwd_len -lt $MAXSIZE ]
	do
	    index=$(($RANDOM%$MODNUM))
	    echo -n "${array1[$index]}"
	    ((pwd_len++))
	done
	echo
}

function sshKeyGen(){

echo "What's the name of the Key (no spaced please) ? ";
read name;

echo "What's the email associated with it? ";
read email;

`ssh-keygen -t rsa -f ~/.ssh/id_rsa_$name -C "$email"`;

ssh-add ~/.ssh/id_rsa_$name

pbcopy < ~/.ssh/id_rsa_$name.pub;

echo "SSH Key copied in your clipboard";

}


function sha256sum() { openssl sha256 "$@" | awk '{print $2}'; } #https://unix.stackexchange.com/questions/426837/no-sha256sum-in-macos

function filestolower(){
# rename all the files which contain uppercase letters to lowercase in the current folder
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in `ls`
      do
      skip=false
      if [ -d $x ]; then
	read -p "'$x' is a folder, rename it? [y/n]: " renamedir
	if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
	  skip=true
	fi
      fi
      if [ "$skip" == "false" ]; then
        lc=`echo $x  | tr '[A-Z]' '[a-z]'`
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}

#AWS Environment var reference http://saurabh-hirani.github.io/writing/2018/04/05/zsh-and-aws-profiles
#Load AWS profile from .aws/credentials file
#Require AWS CLI

list_aws_profiles() {
   cat ~/.aws/config | grep '\[profile' | sed -n 's/\[profile \(.*\).*\]/\1/p' | sort
   #cat ~/.aws/credentials | grep '\[' | grep pbs | grep -v '#' | tr -d '[' | tr -d ']'
  }

current_aws_profile() {
      aws_profile=$(aws configure list | egrep profile | awk '{print "("$2")"}')
      if [[ "${aws_profile}" == "(<not)" ]]
      then
        echo > /dev/null
      else
        Account_ID=$(aws sts get-caller-identity | jq -r ".Account")
        echo "${aws_profile} - ${Account_ID}"

      fi
}

set_aws_profile() {
    local aws_profile=$1
    set -x
    export AWS_PROFILE=${aws_profile}
    set +x

  }

drop_aws_profile(){
#require aws plugin
   acp
}
#EC2 Name Tag, InstanceID, Private IP address
aws_ec2_info() {

aws ec2 describe-instances \
    --filter Name=instance-state-name,Values=running \
    --query 'Reservations[].Instances[].{ID: InstanceId,Hostname: PublicDnsName,Name: Tags[?Key==`Name`].Value | [0],Type: InstanceType, Platform: Platform || `Linux`, IP: PrivateIpAddress, VpcID: VpcId}' \
    --output table \

}
#To sync my aws cred to github in case I need to use it on my Windows laptop
update_aws_cred(){

  cd ~/.aws
  if [ -n "$(git status --porcelain)" ]; then

   git add credentials
   git commit -m "AWS credential update `date +'%Y-%m-%d'`"
   git push

else

   echo "no change, no commit, no push";

fi

cd - > /dev/null

}

# Require AWS login auditor permission to run

aws_login_status(){

aws iam list-users | jq ".Users[] | [.UserName, .PasswordLastUsed] |@csv" | tr -d '"'

}

aws_access_key_status(){
#Check access key activity
for user in $(aws iam list-users --output text | awk '{print $NF}'); do
    aws iam list-access-keys --user $user --output text
    test $? -gt 128 && exit
done

}

aws_rds_info() {

aws rds describe-db-instances \
    --query 'DBInstances[*].{ID: DBInstanceIdentifier,Name: DBName,Type: DBInstanceClass, Engine: Engine, Engine_version: EngineVersion, Status: DBInstanceStatus, Endpoint: Endpoint.Address, PubliclyAccessible: PubliclyAccessible} ' \
    --output table

}


update_repos() {
#repos update, for all the git repos in a parent folder
for dir in */; do
  if [ -d "$dir/.git" ]; then
    echo "Updating repository in $dir"

    pushd "$dir" || exit
    git pull
    popd || exit
  else
    echo "Skipping $dir - not a Git repository"
  fi
done


    extract () {
#   extract:  Extract tar files (tar.gz, tar.bz2, .tar, etc)
#   Reference: https://gist.github.com/benwilcock/ade030ee60e695e408ec50675aa50fe6#file-zshrc-L157-L177
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#1password cli auto complete
eval "$(op completion zsh)"; compdef _op op
#kubectl auto complete
source <(kubectl completion zsh)
#Reference: https://docs.commonfate.io/granted/configuration
granted completion -s zsh > /dev/null 2>&1

