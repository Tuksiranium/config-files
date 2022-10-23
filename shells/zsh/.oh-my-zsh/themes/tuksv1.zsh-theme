# purple username
username() {
   echo "%{$FG[031]%}%n%{$reset_color%}"
}

laptop_name() {
    echo "%{$FG[024]%}%m%{$reset_color%}"
}

# current directory, two levels deep
directory() {
   echo "%{$FG[031]%}%3~%{$reset_color%}"
}

# current time with milliseconds
current_time() {
   echo "%*"
}

# returns 👾 if there are errors, nothing otherwise
return_status() {
   echo "%(?..✗)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

# putting it all together
PROMPT='%{$FG[246]%}[%B$(username)%{$FG[238]%}@$(laptop_name)%{$FG[246]%}]$(directory)$(git_prompt_info)%{$FG[248]%}$%b '
RPROMPT=' $(current_time)'
