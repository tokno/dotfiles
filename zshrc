TERM=xterm-256color

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

WORDCHARS='*?_-.[]~=&;&%^(){}<>'

# lsコマンドのカラー設定
export LS_COLORS="di=01;36:ln=04;33:ex=31"
export LSCOLORS="Gxdxxxxxbxxxxxxxxxxxxx"
zstyle ':completion:*' list-colors 'di=01;36' 'ln=04;33' 'ex=31'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias exit=" exit"
alias pwd=" pwd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."

alias -s txt=less
alias -s scala=scala
alias -s groovy=groovy
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

# like emacs
bindkey -e
bindkey "^U" backward-kill-line

# 使わないキーバインドを削除
bindkey -r '^X^K' # kill-buffer
bindkey -r '^X^N' # infer-next-history
bindkey -r '^[a'  # accept-and-hold
bindkey -r '^[A'  # accept-and-hold
bindkey -r '^[c'  # capitalize-word
bindkey -r '^[C'  # capitalize-word
bindkey -r '^[h'  # run-help
bindkey -r '^[H'  # run-help
bindkey -r '^[l'  # down-case-word
bindkey -r '^[u'  # up-case-word

# completion
zstyle ':completion:*' menu true select

zmodload zsh/complist

function _accept_and_exec() {
    zle accept-line
}

zle -N accept-and-exec _accept_and_exec

bindkey -M menuselect 'h' backward-char
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'l' forward-char
bindkey -M menuselect '^i' accept-and-infer-next-history
bindkey -M menuselect '\t' accept-and-infer-next-history
bindkey -M menuselect '^@' send-break
bindkey -M menuselect '^m' accept-and-exec
bindkey -M menuselect '^j' accept-and-exec

if [ -d ~/.zsh/zsh-completions/src ]; then
    fpath=(~/dotfiles/zshcompletion ~/.zsh/zsh-completions/src $fpath)
fi

autoload -Uz compinit
compinit

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# completion
setopt complete_aliases

# コマンド履歴
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt inc_append_history

# ディレクトリ移動
setopt cdable_vars
setopt auto_cd
setopt pushd_ignore_dups
setopt auto_pushd

# zmv
autoload -Uz zmv
alias zmv='noglob zmv -W'
alias zcp='noglob zmv -WC'

# プロンプト
setopt no_flow_control
setopt print_eight_bit
setopt interactive_comments
setopt no_beep

# menu
setopt auto_menu
setopt auto_list

# correct
setopt correct

# タイトルにuser@hostnameを表示
function echo_terminal_info_title() {
    echo -ne "\033]0;${USER}@${HOST}\007"
}

# タイトルに実行したコマンドを表示
function echo_execution_info_title() {
    local cmd="$*"
    echo -ne "\033]0;${cmd}\007"
}

# プロンプトに色を付ける
autoload -U colors; colors

setopt prompt_subst

function _my_new_line() {
    if [ -z "$BUFFER" ]; then
        first_show=0
    else
        first_show=1
    fi

    zle accept-line
}

# 改行関数
zle -N _my_new_line
bindkey "^M" _my_new_line
bindkey "^J" _my_new_line

function _my_ctrl_z() {
    if [[ -n `jobs | grep suspended` ]]; then
        fg
        zle accept-line
    fi
}

zle -N _my_ctrl_z
bindkey "^Z" _my_ctrl_z

zle -N _history_peco
bindkey "^X^P" _history_peco

# Gitリポジトリのファイル情報表示
prompt_vcs_status=1

# gitリポジトリ情報を表示する
# [staged:1 untracked:0 master@dotfiles]
function _prompt_git_info() {
    local repodir=`git rev-parse --show-toplevel 2> /dev/null`

    # gitリポジトリ外
    if [ -z "$repodir" ]; then
        return
    fi

    local reponame=`basename $repodir`
    local branch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`

    # ステータス出力offの場合
    if [ $prompt_vcs_status -eq 0 ]; then
        echo " [Git $branch@$reponame]"
        return
    fi

    local st
    st=`git status --porcelain 2> /dev/null`

    local staging
    local working
    staging=`echo -n "$st" | cut -c 1`
    working=`echo -n "$st" | cut -c 2`

    local staging_change
    local working_change
    local untracked_file
    staging_change=`echo -n "$staging" | grep -v " " | grep -v "?" | wc -l | tr -d " "`
    working_change=`echo -n "$working" | grep -v " " | grep -v "?" | wc -l | tr -d " "`
    untracked_file=`echo -n "$st" | grep "??" | wc -l | tr -d " "`

    local changes
    if [[ $staging_change -ne "0" ]]; then
        changes=($changes "staged:$staging_change")
    fi

    if [[ $working_change -ne "0" ]]; then
        changes=($changes "unstaged:$working_change")
    fi

    if [[ $untracked_file -ne "0" ]]; then
        changes=($changes "untracked:$untracked_file")
    fi

    local padding

    if [[ -n "$changes" ]];then
        padding=" "
    fi

    local color
    if [[ "$staging_change" != "0" && "$working_change" != "0" ]]; then
        color="214"
    elif [[ "$staging_change" != "0" ]]; then
        color="120"
    elif [[ "$working_change" != "0" ]]; then
        color="227"
    else
        color="117"
    fi

    local git_label
    git_label="%B$branch@$reponame%b"

    echo -n " [${changes}${padding}%{\e[38;5;${color}m%}${git_label}%{\e[m%}]"
}

# エラーが発生したらプロンプトに表示
function _prompt_smiley() {
    if [ $1 -eq 0 ]; then
        return
    fi

    if [ $1 -eq 18 ]; then
        echo -n " Zzz (-_-)"
    else
        echo -n " $1 (>_<｡)"
    fi
}

function _suspended_jobs() {
    local suspended_jobs job_info

    suspended_jobs=`jobs | grep suspended | sed 's/ [\+|-] /   /' | awk '{print $3}'`

    if [[ -z $suspended_jobs ]]; then
        return
    fi

    job_info=`echo $suspended_jobs | tr '\n' ' ' | sed -e 's/ $//'`

    echo -n " [$job_info]"
}

function _right_prompt() {
    local st=$?

    if [ $st -ne 0 -a "$first_show" -eq 1 ]; then
        _prompt_smiley "$st"
        return
    fi

    _suspended_jobs
    _prompt_git_info
}

PROMPT=$'%{\e[38;5;215m%}%m%{\e[m%} > %{\e[38;5;215m%}%~%{\e[m%}\n%n%# '
PROMPT2="%{${fg[white]}%}%_> %{${reset_color}%}"
RPROMPT=$'`_right_prompt`'
SPROMPT="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

REPORTTIME=1

precmd() {
    echo_terminal_info_title
}

preexec() {
    echo_execution_info_title $1
}

case "${OSTYPE}" in
  darwin*)
    alias l="ls -FG"
    alias la="l -A"
    alias ll='l -Aloh'
    ;;
  *)
    alias l="ls --color -F --group-directories-first"
    alias la="l -A"
    alias ll='l -AGlh --time-style=+%Y-%m-%d\ %H:%M:%S'
    ;;
esac

# cheat
alias cht=cheat
export DEFAULT_CHEAT_DIR=~/dotfiles/cheatsheets

alias 'today=date +"%Y-%m-%d"'


[ -f ~/dotfiles/functions ] && source ~/dotfiles/functions
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
if [ -f ~/.fzf.zsh ]; then
    export FZF_DEFAULT_COMMAND='ag -g ""'
    source ~/.fzf.zsh
fi

path=(
    ~/bin(N-/)
    $path
)

