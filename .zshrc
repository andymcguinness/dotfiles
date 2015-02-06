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
echo '
         (__)
         (oo)
   /------\/
  / |    ||
 *  /\---/\
    ~~   ~~ 
...."Have you mooed today?"....'
