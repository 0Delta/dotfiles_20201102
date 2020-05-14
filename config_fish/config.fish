# load bashrc
bass source ~/.bash_profile
bass source ~/.bashrc

# Ctrl-R peco history search
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# ovewrite prompt
function fish_right_prompt -d 'Write out the right prompt'
  printf '⎈ %s' (set_color brblue)(kubectl config current-context)(set_color white)
end

# # PATH
# set -x PATH /opt/local/bin /opt/local/sbin $PATH
# set -x PATH $HOME/bin $HOME/.cask/bin $HOME/py35/bin $PATH

### Google Cloud
set -x PATH $PATH $HOME/google-cloud-sdk/bin
set -x GOOGLE_APPLICATION_CREDENTIALS $HOME/gcpkey.json
alias gcloud-shell 'gcloud alpha interactive'
# alias gssh '$HOME/bin/gcp_compute_ssh.sh'
alias gcloud-chcnf 'gcloud config configurations activate (gcloud config configurations list | tail -n +2 | peco | cut -d " " -f 1)'
set -x LD_LIBRARY_PATH /usr/lib/

### shell
set -x SHELL /usr/bin/fish
set -x EDITOR "vim"
set -x VISUAL "vim"

### pipenv
set -x PIPENV_VENV_IN_PROJECT true

### golang
set -x PATH $PATH /usr/local/go/bin
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x GO111MODULE on

### python
set -x PATH $PATH $HOME/.local/bin

### redpen
set -x PATH $PATH /usr/local/redpen/bin

### kubectx
set -x PATH $PATH $HOME/.kubectx

### krew
set -x PATH $PATH $HOME/.krew/bin

if test -f /usr/bin/lsyncd 
    /usr/bin/lsyncd /etc/lsyncd/lsyncd.conf.lua 
end

# ### path
# set -g fish_user_paths "/usr/local/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/binutils/bin" $fish_user_paths
# set -x PATH "$HOME/bin:$PATH"
# set -x PATH "$HOME/.nodebrew/current/bin:$PATH"
# set -x PATH "/usr/local/bin:$PATH"
# set -x PATH "$HOME/bin/vim/bin:$PATH"
# set -x PATH (echo $PATH | tr ' ' '\n' | sort -u | paste -d: -s -)

### alias
alias lsync-stat "sudo service lsyncd status;cat /tmp/lsyncd.status | grep -E '^Sync' -A1"
alias starwars "telnet towel.blinkenlights.nl"
alias tailf "tail -f"
alias vl "view -"
alias cls "clear"
alias g "git"
alias kc "kubectl"
alias kc-reset "kubectl config use-context kind-kind"
# alias ccls "$GOPATH/bin/longcat -l 10 -i 0.4 -H"
# alias rm "trash"
# alias nosleep "caffeinate"
# eval (hub alias -s)
# alias less "~/bin/vim/share/vim/vim81/macros/less.sh"
# alias more "~/bin/vim/share/vim/vim81/macros/less.sh"
alias gcloud-chcnf='gcloud config configurations activate (gcloud config configurations list | tail -n +2 | peco | cut -d " " -f 1)'
alias gcloud-shell='gcloud alpha interactive'
alias winexp='explorer.exe (wslpath -a -w $PWD)'


alias helm='docker run -e KUBECONFIG="/root/.kube/config:/root/.kube/some-other-context.yaml" -e XDG_CONFIG_HOME="/root/.config/" -e XDG_DATA_HOME="/root/.local/share" -ti --rm -v $PWD:/apps -v ~/.kube:/root/.kube -v ~/.helm:/root/.helm -v ~/.config/helm:/root/.config/helm -v ~/.local/share/helm:/root/.local/share/helm alpine/helm'
alias terraform='docker run --rm -it -v $PWD:/app --workdir /app hashicorp/terraform:0.11.8'

### fontcode
# set -x LANG ja_JP.UTF-8
# set -x LC_TYPE ja_JP.UTF-8

# ls after cd
functions --copy cd standard_cd

function cd
  standard_cd $argv; and pwd; and ls
end
