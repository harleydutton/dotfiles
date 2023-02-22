#OH-MY-ZSH
ZSH_THEME="random"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

#PLUGINS
plugins=(git)

#JAVA
export JAVA_HOME=~/.java/jdk-17.0.6+10
export PATH="$PATH:$JAVA_HOME/bin"

#KUBERNETES
alias kc="kubectl"
alias kgn="kc get ns"
alias kgp="kc get pods"
alias kdp="kc describe pods"
alias keti="kc exec -ti"
alias klf="kc logs -f"
alias kcgc="kc config get-contexts"
alias kccc="kc config current-context"
alias kcuc="kc config use-context"
globalb(){
  export KUBECONFIG="$HOME/.kube/eks-rome-globalb_p2996224.config"
  kubectl config set-context --current --namespace=datadog
}

#HISTORY
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
HIST_STAMPS="yyyy--mm-dd"

#PROMPT
PROMPT='%n@%m %~ %# '

#GIT BRANCH
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'
git config --global alias.logline "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


#TAB-COMPLETE
autoload -U compinit promptinit
promptinit
compinit -i
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(/usr/local/share/zsh-completions $fpath)

