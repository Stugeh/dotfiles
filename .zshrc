source ~/Repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:~/.local/bin:~/local/bin:$PATH
set -o vi
alias thn="thunar . & disown"
alias rn="ranger ."
alias pics="ranger ~/Pictures"
alias downs="ranger ~/Downloads"
alias confs="ranger ~/.config"
alias ls="ls --color -l -h" 
alias grep="grep -n --color" 
alias mkdir="mkdir -pv" 
alias ping="ping -c 5" 
alias HEAD="curl -I"
alias sus="systemctl suspend"
alias c="clear"
alias bton="systemctl start bluetooth.service"
alias btoff="systemctl stop bluetooth.service"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/tuukka/Repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/lf/lfcd.sh

export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
