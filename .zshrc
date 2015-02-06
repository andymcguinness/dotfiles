# OH-MY-ZSH ZSHRC
#
# By Maia McGuinness

# === BASIC CONFIG === #
export ZSH=$HOME/.oh-my-zsh

# === ZSH SETTINGS === #
ZSH_THEME="dogenpunk"
COMPLETION_WAITING_DOTS="true"

# === OH MY ZSH SETTINGS === #
# Plugins
plugins=(bower brew bundler common-aliases gem git npm svn-fast-info)

# Other Oh-My-Zsh settings
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/Users/mmcguinness/.rvm/gems/ruby-2.1.3@craftsman_club/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"

# === PERSONAL ALIASES === #
alias vimrc='vim ~/.vimrc'
unalias rm

# === OTHER STUFF === #
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh"

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
   \`. :MM$\$b.,dYY$\$Yii\" :\'   :YYYYllYiiYYYiYY    
_.._ :\`4MM$!YYYYYYYYYii,.__.diii\$\$YYYYYYYYYYY
.,._ \$b\`P\`     \"4\$\$\$\$\$iiiiiiii\$\$\$\$YY\$\$\$\$\$\$YiY;
   \`,.\`\$:       :\$\$\$\$\$\$\$\$\$YYYYY\$\$\$\$\$\$\$\$\$YYiiYYL
    \"\`;\$\$.    .;PPb\$\`.,.\`\`T\$\$YY\$\$\$\$YYYYYYiiiYYU:  
    ;\$P\$;;: ;;;;i\$y\$\"!Y\$\$\$b;\$\$\$Y\$YY\$\$YYYiiiYYiYY 
    \$Fi\$\$ .. \`\`:iii.\`-\":YYYYY\$\$YY\$\$\$\$\$YYYiiYiYYY    
    :Y\$\$rb \`\`\`\`  \`_..;;i;YYY\$YY\$\$\$\$\$\$\$YYYYYYYiYY:    
     :\$\$\$\$i;;iiiiidYYYYYYYYYY\$\$\$\$\$\$YYYYYYYiiYYYY. 
      \`\$\$\$\$\$\$\$YYYYYYYYYYYYY\$\$\$\$\$\$YYYYYYYYiiiYYYYYY    
      .i!\$\$\$\$\$\$YYYYYYYYY\$\$\$\$\$\$YYY\$\$YYiiiiiiYYYYYYY    
     :YYiii\$\$\$\$\$\$\$YYYYYYY\$\$\$\$YY\$\$\$\$YYiiiiiYYYYYYi\'  
....\"Have you doged today?\"...."
