
# load bashrc
if type -q bass
    bass source ~/.bash_profile
    bass source ~/.bashrc
end

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
if type -q gcloud
    set -x PATH $PATH $HOME/google-cloud-sdk/bin
    set -x GOOGLE_APPLICATION_CREDENTIALS $HOME/gcpkey-c1e781856f52.json
    set -x LD_LIBRARY_PATH /usr/lib/

    # alias gssh '$HOME/bin/gcp_compute_ssh.sh'
    alias gcloud-shell 'gcloud alpha interactive'
    alias gcloud-chcnf='gcloud config configurations activate (gcloud config configurations list | tail -n +2 | peco | cut -d " " -f 1)'
    alias gcloud-shell='gcloud alpha interactive'
end

### shell
set -x SHELL /usr/bin/fish
set -x EDITOR "vim"
set -x VISUAL "vim"

### pipenv
if type -q pipenv
    set -x PIPENV_VENV_IN_PROJECT true
end

### golang
if type -q go
    set -x PATH $PATH /usr/local/go/bin
    set -x GOPATH $HOME/go
    set -x PATH $PATH $GOPATH/bin
    set -x GO111MODULE on
end

### python
set -x PATH $PATH $HOME/.local/bin

### redpen
set -x PATH $PATH /usr/local/redpen/bin

### kubectx
if test -d $HOME/.kubectx
    set -x PATH $PATH $HOME/.kubectx
end

### krew
if test -d $HOME/.krew
    set -x PATH $PATH $HOME/.krew/bin
end

if test -f /usr/bin/lsyncd 
    /usr/bin/lsyncd /etc/lsyncd/lsyncd.conf.lua 
    alias lsync-stat "sudo service lsyncd status;cat /tmp/lsyncd.status | grep -E '^Sync' -A1"
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
alias starwars "telnet towel.blinkenlights.nl"
alias tailf "tail -f"
alias vl "view -"
alias cls "clear"
alias g "git"

if type -q kubectl
    alias kc "kubectl"
    alias kc-reset "kubectl config use-context kind-kind"
end

alias rm "trash"

# alias ccls "$GOPATH/bin/longcat -l 10 -i 0.4 -H"
# alias nosleep "caffeinate"
# eval (hub alias -s)
# alias less "~/bin/vim/share/vim/vim81/macros/less.sh"
# alias more "~/bin/vim/share/vim/vim81/macros/less.sh"

if type -q explorer.exe
    alias winexp='explorer.exe (wslpath -a -w $PWD)'
end


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
