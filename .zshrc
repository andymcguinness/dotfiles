# OH-MY-ZSH ZSHRC
#
# By Maia McGuinness

# === BASIC CONFIG === #
export ZSH=$HOME/.oh-my-zsh

# === ZSH SETTINGS === #
ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"

# === OH MY ZSH SETTINGS === #
# Plugins
plugins=(bower brew bundler common-aliases gem git npm svn-fast-info)

# === GENERAL SHELL SETTINGS === #
if [[ $USER = "mmcguinness" ]]
then
    export PATH="/Users/mmcguinness/.rvm/gems/ruby-2.1.3/bin:/Users/mmcguinness/.rvm/gems/ruby-2.1.3@craftsman_club/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"
else
    export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"
fi

# === RUN ON STARTUP === #
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh"

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

# Stopping zsh's zany rm behavior
unalias rm

# Restarting zsh
alias reload='source ~/.zshrc'

# Frequently used Craftsman Club commands
alias dbmigrate='bundle exec rake db:migrate'
alias dbdrop='bundle exec rake db:drop db:create db:migrate;rake make_super_admin:first_admin;'
alias start='bundle exec rails s'
alias dealstart='(redis-server &> /dev/null &);foreman start -p 3000'
alias staging='git push staging $(current_branch):master'
alias demo='git push demo $(current_branch):master'
alias backstage='git push backstage $(current_branch):master'

# Push it real good
alias ggpushit='(afplay ~/Push_It_Real_Good.aif &> /dev/null &);git push origin $(current_branch)'

# Edit my todo list
alias todo='vim ~/Dropbox/todo.txt/todo.txt'

# === RVM === #
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# === PERL === #
PERL_MB_OPT="--install_base \"/Users/mmcguinness/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/mmcguinness/perl5"; export PERL_MM_OPT;
