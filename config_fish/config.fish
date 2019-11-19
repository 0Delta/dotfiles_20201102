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
alias starwars "telnet towel.blinkenlights.nl"
alias tailf "tail -f"
alias cls "clear"
# alias ccls "$GOPATH/bin/longcat -l 10 -i 0.4 -H"
# alias rm "trash"
# alias nosleep "caffeinate"
# eval (hub alias -s)
# alias less "~/bin/vim/share/vim/vim81/macros/less.sh"
# alias more "~/bin/vim/share/vim/vim81/macros/less.sh"

### fontcode
# set -x LANG ja_JP.UTF-8
# set -x LC_TYPE ja_JP.UTF-8

#     set -g theme_display_git no
#     set -g theme_display_git_dirty no
#     set -g theme_display_git_untracked no
#     set -g theme_display_git_ahead_verbose yes
#     set -g theme_display_git_dirty_verbose yes
#     set -g theme_display_git_stashed_verbose yes
#     set -g theme_display_git_master_branch yes
#     set -g theme_git_worktree_support yes
#     set -g theme_display_vagrant yes
#     set -g theme_display_docker_machine no
#     set -g theme_display_k8s_context yes
#     set -g theme_display_hg yes
#     set -g theme_display_virtualenv no
#     set -g theme_display_ruby no
#     set -g theme_display_user ssh
#     set -g theme_display_hostname ssh
#     set -g theme_display_vi no
#     set -g theme_avoid_ambiguous_glyphs yes
#     set -g theme_powerline_fonts no
#     set -g theme_nerd_fonts yes
#     set -g theme_show_exit_status yes
#     set -g default_user your_normal_user
#     set -g theme_color_scheme dark
#     set -g fish_prompt_pwd_dir_length 0
#     set -g theme_project_dir_length 1
#     set -g theme_newline_cursor yes



