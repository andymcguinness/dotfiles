# OH-MY-ZSH ZSHRC
#
# By Maia McGuinness

# === BASIC CONFIG === #
export ZSH=$HOME/.oh-my-zsh

# === ZSH SETTINGS === #
ZSH_THEME="nanotech"
COMPLETION_WAITING_DOTS="true"

# === OH MY ZSH SETTINGS === #
# Plugins
plugins=(bower brew common-aliases gem git npm svn-fast-info)

# Other Oh-My-Zsh settings
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"

# === PERSONAL ALIASES === #
alias vimrc='vim ~/.vimrc'
