# Reference:
# - https://github.com/reobin/typewritten
# - https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/git-prompt.plugin.zsh

# Default values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="] "
# ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
# ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[red]%}%{S:%G%}"
# ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{U:%G%}"
# ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
# ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{?%G%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

ZSH_THEME_GIT_PROMPT_CACHE="1"

# Override preexec_udpate_git_vars function, so git_info will be reloaded
# when "repo" command is used.
function preexec_update_git_vars() {
    case "$2" in
        git*|hub*|gh*|stg*|repo*)
        __EXECUTED_GIT_COMMAND=1
        ;;
    esac
}

# git status display
local git_info='$(git_super_status)%{$reset_color%}'

# current user and hostname
local user_host='%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[yellow]%}%m:%{$reset_color%}'

local prompt_color="%{$reset_color%}"
local prompt_symbol="$"

local prompt='${prompt_color}${prompt_symbol} %{$reset_color%}'

# current directory display
local directory_path='%{$fg_bold[blue]%}$(shrink_path -f -T)'

local time_info='%{$reset_color%}[%*] '
# last command return code
local return_code='%(?,,%{$fg_bold[red]%} [%?]%{$reset_color%})'

PROMPT=$(
<<- EOF
${time_info}${user_host}${git_info}${directory_path}${return_code}
${prompt}
EOF
)

# local right_prompt_prefix="%{$reset_color%}"

# right prompt definition
# because a default one is defined in git-prompt plugin, we have to clear it if
# we don't want this.
#
# RPROMPT="${right_prompt_prefix}"
# RPROMPT+="${git_info}"
RPROMPT=""

# Do we really need this?
# prompt cursor fix when exiting vim
# local cursor="\e[3 q"
# if [ "$TYPEWRITTEN_CURSOR" = "block" ]; then
#   cursor="\e[1 q"
# elif [ "$TYPEWRITTEN_CURSOR" = "beam" ]; then
#   cursor="\e[5 q"
# fi
# _fix_cursor() {
#   echo -ne "${cursor}"
# }
# precmd_functions+=(_fix_cursor)
