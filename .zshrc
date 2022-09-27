# Flex
neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Aliases
alias ls="ls --color=auto"
alias la="ls -la --color=auto"
alias lh="ls -lh --color=auto"
alias nv="nvim"
alias sl="sl -e"
alias tp="trash-put"

# ZSH Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Powerlevel10k Theme
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Auto CD
setopt autocd

# Vi keybindings
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '/home/phoenix/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Default Editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# Fzf keybindings and completion
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# PATH
## Rust to PATH
export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:$HOME/.spicetify
export PATH=$PATH:$HOME/.local/bin
