#PROMPT
PROMPT='%S %~ > %s'

#HISTORY
setopt share_history
alias hist="history -i 0"
alias hg="hist|grep"

#COMPLETE
source $ZSH_PLUGINS/zsh-z/zsh-z.plugin.zsh
source $ZSH_PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#SSH
eval `ssh-agent` > /dev/null
ssh-add -q ~/.ssh/id_ed25519 

#GIT
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
RPROMPT='%S ${vcs_info_msg_0_} %s'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%b%u%c'
alias gs="git status -s"

#KUBERNETES
alias kc="kubectl"
alias keti="kc exec -ti"

#FRAMEWORK
alias pm="rpm-ostree"
bindkey  "^[[3~"  delete-char #delete key
alias te="toolbox enter"

#MAVEN
alias mci="mvn clean install"
