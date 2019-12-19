# load bashrc
bass source ~/.bash_profile

# Ctrl-R peco history search
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# ovewrite prompt
function fish_right_prompt -d 'Write out the right prompt'
  printf ''
end

# # PATH
# set -x PATH /opt/local/bin /opt/local/sbin $PATH
# set -x PATH $HOME/bin $HOME/.cask/bin $HOME/py35/bin $PATH

# ### Google Cloud
# set -x PATH $PATH $HOME/google-cloud-sdk/bin
# set -x GOOGLE_APPLICATION_CREDENTIALS $HOME/gcpkey.json
# alias gcloud-shell 'gcloud alpha interactive'
# alias gssh '$HOME/bin/gcp_compute_ssh.sh'
# alias gcloud-chcnf 'gcloud config configurations activate (gcloud config configurations list | tail -n +2 | peco | cut -d " " -f 1)'

### shell
set -x SHELL /usr/bin/fish
set -x EDITOR "vim"
set -x VISUAL "vim"

### pipenv
set -x PIPENV_VENV_IN_PROJECT true

### golang
set -x GOPATH $HOME/go
set -x GO111MODULE on

# ### path
# set -g fish_user_paths "/usr/local/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/binutils/bin" $fish_user_paths
# set -x PATH "$HOME/bin:$PATH"
# set -x PATH "$PATH:$GOPATH/bin"
# set -x PATH "$HOME/.nodebrew/current/bin:$PATH"
# set -x PATH "/usr/local/bin:$PATH"
# set -x PATH "$HOME/bin/vim/bin:$PATH"
# set -x PATH (echo $PATH | tr ' ' '\n' | sort -u | paste -d: -s -)

### alias
alias lsync-stat "sudo service lsyncd status;cat /tmp/lsyncd.status | grep -E '^Sync' -A1"
alias starwars "telnet towel.blinkenlights.nl"
alias tailf "tail -f"
alias cls "clear"
# alias ccls "$GOPATH/bin/longcat -l 10 -i 0.4 -H"
# alias rm "trash"
# alias nosleep "caffeinate"
# eval (hub alias -s)
# alias less "~/bin/vim/share/vim/vim81/macros/less.sh"
# alias more "~/bin/vim/share/vim/vim81/macros/less.sh"
alias gcloud-chcnf='gcloud config configurations activate (gcloud config configurations list | tail -n +2 | peco | cut -d " " -f 1)'
alias gcloud-shell='gcloud alpha interactive'
alias winexp='explorer.exe (wslpath -a -w $PWD)'


### fontcode
# set -x LANG ja_JP.UTF-8
# set -x LC_TYPE ja_JP.UTF-8

