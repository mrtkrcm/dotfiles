#!/usr/bin/env zsh

export CLICOLOR=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)


zstyle ':completion:*' completions 1
zstyle ':completion:*' verbose false
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $XDG_CACHE_HOME'/.zcompcache'
zstyle ':completion:*' completer _expand _complete _match _ignored _approximate
zstyle ':completion:*' auto-description 'with: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' prompt 'Did you mean...'
zstyle ':completion:*' select-prompt '%SMenu mode: %l completions%s'
zstyle ':completion:*' squeeze-slashes true

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

## ignore completion to commands we don't have
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
## zstyle show completion menu if 2 or more items to select
zstyle ':completion:*'						menu select=2
## cd
zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*'        file-sort access
zstyle ':completion:*:*:(cd):*'        menu select
zstyle ':completion:*:*:(cd):*'        completer _history
## kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


## zshell's
# zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


## logan's
# zstyle ':completion:*' expand prefix suffix
# zstyle ':completion:*' format 'Completing %d:'
# zstyle ':completion:*' insert-unambiguous true
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' list-suffixes true
# zstyle ':completion:*' max-errors 3 not-numeric
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' original false
# zstyle ':completion:*' preserve-prefix '//[^/]##/'
# zstyle ':completion:*' prompt '%e errors.'
# zstyle ':completion:*' select-prompt %SScrolling: %p%s
# zstyle ':completion:*' special-dirs true
# zstyle ':completion:*' squeeze-slashes true

# ?
# zstyle ':completion:*' expand prefix suffix
# zstyle ':completion:*' file-sort name
# zstyle ':completion:*' format 'Completions for %d'
# zstyle ':completion:*' glob 1
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' ignore-parents parent pwd ..
# zstyle ':completion:*' insert-unambiguous false
# zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
# zstyle ':completion:*' list-suffixes true
# zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'r:|[._-]=* r:|=*'
# zstyle ':completion:*' max-errors 2
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' original true
# zstyle ':completion:*' preserve-prefix '//[^/]##/'

# zstyle ':completion:*' substitute 1
# zstyle ':completion:*' verbose true

#brucebentley's

zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


zstyle :compinstall filename $XDG_CONFIG_HOME'/compinit.zsh'


