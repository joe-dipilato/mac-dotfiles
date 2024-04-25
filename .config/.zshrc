# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
eval "$(fzf --zsh)"

# fg="#CBE0F0"
# bg="#011628"
# bg_highlight="#143652"
# purple="#B388FF"
# blue="#06BCE4"
# cyan="#2CF9ED"
# export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# bat
# export BAT_THEME=tokyonight_night

# eza
# alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# shellenv
eval "$(brew shellenv)"

#  compinstall
fpath[1,0]=$HOME/.zsh/completion
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle :compinstall filename '/Users/joe.dipilato/.zshrc'
autoload -Uz compinit
compinit

# jj
source <(jj util completion zsh)

# kubectl
source <(kubectl completion zsh)

# poetry
export PATH="/Users/joe.dipilato/.local/bin:$PATH"

# asdf
. /Users/joe.dipilato/.asdf/asdf.sh
. /Users/joe.dipilato/.asdf/plugins/java/set-java-home.zsh

# env
export EDITOR="code -w"

# acct
export ARTIFACTORY_PASSWORD=$(pass artifactory/account/active | yq '.token')
export ARTIFACTORY_USERNAME=$(pass artifactory/account/active | yq '.username')
export DRONE_SERVER=$(pass drone/account/tokens/active | yq '.server')
export DRONE_TOKEN=$(pass drone/account/tokens/active | yq '.token')
export HUGGING_FACE_HUB_TOKEN=$(pass huggingface/tokens/hugging_face_hub_token)
export SILK_CLIENT_ID=$(pass silk/account/active | yq '.client_id')
export SILK_CLIENT_SECRET=$(pass silk/account/active | yq '.client_secret')
export SNYK_KEY=$(pass snyk/account/active | yq '.key')
export SNYK_TOKEN=$(pass snyk/account/active | yq '.token')

# proj
export PCT_ENV=staging
export THREAD_SLACK_MESSAGES=True

# Colors
bold="1"
dimmed="2"
italic="3"
underline="4"
red="31"
green="32"
yellow="33"
blue="34"
purple="35"
white="37"
dark_gray="90"
export EZA_COLORS="gr=${white}:gw=${white}:gx=${white}:ur=${white}:uw=${white}:ux=${white}:ue=${green}:tr=${white}:tw=${red}:tx=${white}:uu=${white}:gu=${white}:gn=38;5;52;${dimmed}:gR=38;5;52:uR=38;5;52:nb=38;5;193:nk=38;5;155:nm=38;5;184:ng=38;5;124;${bold}:nt=${red};${bold}:ex=38;5;154:fi=${white}:vi=${purple}:bu=38;5;166:di=${blue};1:ln=38;5;51:lp=${white};${italic}:xa=${red}:bO=${underline};${bold}:da=${blue}:sc=38;5;117:cr=38;5;88:do=${yellow}:im=${purple}:lo=${purple}:co=${green};${bold};${dimmed}:cm=${dark_gray}:tm=${dark_gray}:mu=${purple}"

# alias
alias ls="eza --color=always --git --icons=always -r -g -t modified"
alias lstree="ls --tree --level 3"

function get_build_variant() {
  local task_name="${1}"
  local last_path=${PWD}
  cd ~/mms/ || return
  evergreen evaluate .evergreen.yml | yq '.buildvariants | .[] | select(.tasks[].name == "'"${task_name}"'") | .name'
  cd "${last_path}" || return
}

function evg_patch() {
  local task_name="${1}"
  local build_varaint
  local last_path=${PWD}
  build_varaint=$(get_build_variant "${task_name}")
  cd ~/mms/ || return
  evergreen patch -p mms -d "$(git log -1 --pretty='%B' | tr '\n' ' ')" -y --browse -u -f --variants "${build_varaint}" --tasks "${task_name}"
  cd "${last_path}" || return
}

# function set_win_title(){q
#     echo -ne "\033]0; - $USER - \007"
# }
# precmd_functions+=(set_win_title)
