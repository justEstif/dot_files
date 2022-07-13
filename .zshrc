# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git vi-mode)
source $ZSH/oh-my-zsh.sh
# User configuration

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
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/usr/bin:$PATH
export PATH=/usr/bin/env:$PATH
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconf="nvim ~/.zshrc"
alias bashconfig="nvim ~/.bashrc"
alias nvimconf="nvim ~/.config/nvim/ ."
alias fontins="fc-cache -v -f"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/linuxbrew/.linuxbrew/bin:$PATH"
export PATH=/usr/bin/env:$PATH
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
