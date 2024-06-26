# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

#######################
# Neovim Aliases
#######################

alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias neovim='nvim'
alias neovi='nvim'
alias neov='nvim'
alias nv='nvim'
alias nvi='nvim'
alias nvim='nvim'
alias n='nvim'
alias nvi='nvim'
alias nv='nvim'

#######################
# Git Aliases
#######################

alias g='git status'
alias gs='git status'
alias gcam='git commit -am'
alias gl='git log'
alias glp='git log -p'
alias glo='git log --one-line'
alias gd='git diff'

#######################
# System Aliases
#######################
# alias l='colorls --light -lah'
# alias ll='colorls --light -lah'
# alias ls='colorls --light -lah'

# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/william/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

#######################
# GO LANG
#######################
export GOROOT=/usr/local/go

export GOBIN=/Users/william/gobin

export PATH="$GOBIN:$PATH"

#######################
# FZF
#######################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Light theme for fzf
export FZF_DEFAULT_OPTS="--color=light"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/william/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/william/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/william/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/william/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2024-02-29 18:09:53
export PATH="$PATH:/Users/william/.local/bin"

# For lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# Commandes valides
ZSH_HIGHLIGHT_STYLES[command]='fg=black,bold'
# Commandes avec une faute de frappe
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
# Une affectation de variable
ZSH_HIGHLIGHT_STYLES[assign]='fg=magenta'
# Alias
ZSH_HIGHLIGHT_STYLES[alias]='fg=black,bold'
# Arguments des commandes
ZSH_HIGHLIGHT_STYLES[arg0]='fg=black'
# Quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'

#############################
# zsh-vi-mode configuration
#############################

# Only changing the escape key to `jj` in insert mode, we still
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

