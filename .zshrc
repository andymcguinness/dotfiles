# OH-MY-ZSH ZSHRC
#
# By Andy McGuinness

# === BASIC CONFIG === #
export ZSH=$HOME/.oh-my-zsh

# === ZSH SETTINGS === #
COMPLETION_WAITING_DOTS="true"

# === GENERAL SHELL SETTINGS === #
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

export DEFAULT_USER="mmcguinness"

# === ANTIGEN SETTINGS === #
source ~/antigen/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

# Load included plugins
antigen bundle bower
antigen bundle bundler
antigen bundle common-aliases
antigen bundle git

# Load external plugins
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle andymcguinness/andys-theme

# Load theme
antigen theme andymcguinness/andys-theme andys-theme

# Apply settings
antigen apply

# === RUN ON STARTUP === #
echo "
                Y.                      _   
                YiL                   .\`\`\`.  
                Yii;                .; .;;\`.    
                YY;ii._           .;\`.;;;; :    
                iiYYYYYYiiiii;;;;i\` ;;::;;;;    
            _.;YYYYYYiiiiiiYYYii  .;;.   ;;; 
         .YYYYYYYYYYiiYYYYYYYYYYYYii;\`  ;;;;    
       .YYYYYYY\$\$YYiiYY\$\$\$\$iiiYYYYYY;.ii;\`..   
      :YYY\$!.  TYiiYY\$\$\$\$\$YYYYYYYiiYYYYiYYii.    
      Y\$MM\$:   :YYYYYY\$!\"\`\`\"4YYYYYiiiYYYYiiYY.    
   \`. :MM$\$b.,dYY$\$Yii\" :'   :YYYYllYiiYYYiYY    
_.._ :\`4MM\$!YYYYYYYYYii,.__.diii\$\$YYYYYYYYYYY
.,._ \$b\`P\`     \"4\$\$\$\$\$iiiiiiii\$\$\$\$YY\$\$\$\$\$\$YiY;
   \`,.\`\$:       :\$\$\$\$\$\$\$\$\$YYYYY\$\$\$\$\$\$\$\$\$YYiiYYL
    \"\`;\$\$.    .;PPb\$\`.,.\`\`T\$\$YY\$\$\$\$YYYYYYiiiYYU:  
    ;\$P\$;;: ;;;;i\$y\$\"!Y\$\$\$b;\$\$\$Y\$YY\$\$YYYiiiYYiYY 
    \$Fi\$\$ .. \`\`:iii.\`-\":YYYYY\$\$YY\$\$\$\$\$YYYiiYiYYY    
    :Y\$\$rb \`\`\`\`  \`_..;;i;YYY\$YY\$\$\$\$\$\$\$YYYYYYYiYY:    
     :\$\$\$\$i;;iiiiidYYYYYYYYYY\$\$\$\$\$\$YYYYYYYiiYYYY. 
      \`\$\$\$\$\$\$\$YYYYYYYYYYYYY\$\$\$\$\$\$YYYYYYYYiiiYYYYYY    
      .i!\$\$\$\$\$\$YYYYYYYYY\$\$\$\$\$\$YYY\$\$YYiiiiiiYYYYYYY    
     :YYiii\$\$\$\$\$\$\$YYYYYYY\$\$\$\$YY\$\$\$\$YYiiiiiYYYYYYi'  
....\"Have you doged today?\"...."

# === PERSONAL ALIASES === #
# Vim
alias vimrc='vim ~/.vimrc'

# Z Shell
alias zshrc='vim ~/.zshrc'

# Stopping zsh's zany rm behavior
unalias rm

# Restarting zsh
alias reload='source ~/.zshrc'

# Push it real good
alias ggpushit='(afplay ~/Push_It_Real_Good.aif &> /dev/null &);git push origin $(current_branch)'

# Edit my todo list
alias todo='vim ~/Dropbox/todo.txt/todo.txt'

# Run MySQL
export MYSQL_HOME=/usr/local/mysql
alias start_mysql='sudo $MYSQL_HOME/bin/mysqld_safe &> /dev/null &'
alias stop_mysql='sudo $MYSQL_HOME/bin/mysqladmin shutdown'

# Run Apache
alias start_apache='sudo apachectl -k start'
alias stop_apache='sudo apachectl -k graceful'

# Fuck (the program)
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# Common git commands
alias production='git push production master'
alias staging='git push staging staging:master'

# === RVM === #
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# === ITERM CONFIG === #
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
function iterm2_print_user_vars() {
  iterm2_set_user_var currTime $(date +%T)
}
((while [ 1 ] ; do iterm2_print_user_vars; sleep 1; done) &)

# The next line updates PATH for the Google Cloud SDK.
source '/Users/amcguinness/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/amcguinness/google-cloud-sdk/completion.zsh.inc'
