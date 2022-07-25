# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="true"

plugins=( git)
# plugins+=(vi-mode)
plugins+=(npm)
plugins+=(zsh-vi-mode)
plugins+=(colored-man-pages)
plugins+=(fd)
source $ZSH/oh-my-zsh.sh
# User configuration

. ~/.z.sh
alias tree="tree -I 'node_modules|cache|test_*'"
alias hidden='ls -d .*'
clipboard(){
if command -v xclip 1>/dev/null; then
    if [[ -p /dev/stdin ]] ; then
        # stdin is a pipe
        # stdin -> clipboard
        xclip -i -selection clipboard
    else
        # stdin is not a pipe
        # clipboard -> stdout
        xclip -o -selection clipboard
    fi
else
    echo "Remember to install xclip"
fi
}

# open tmux by default
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/usr/bin:$PATH
export PATH=/usr/bin/env:$PATH

# Example aliases
alias zshconf="nvim ~/.zshrc"
alias vim="nvim ."
alias bashconfig="nvim ~/.bashrc"
alias nvimconf="nvim ~/.config/nvim/ ."
alias fontins="fc-cache -v -f"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/linuxbrew/.linuxbrew/bin:$PATH"
export PATH=/usr/bin/env:$PATH
export PATH=/home/estifanos/.local/bin/:$PATH
export PATH=/home/estifanos/.cargo/bin/:$PATH

# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
alias luamake=/home/estifanos/lua-language-server/3rd/luamake/luamake
