#!/usr/bin/env zsh

#
# Editors
#

if [[ -z "$EDITOR" ]]; then
  export EDITOR='nvim'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='nvim'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
BIN_DIR="$HOME/bin"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

path=(
  $BIN_DIR(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
	/opt/homebrew/opt/llvm/bin(N) 								# LLVM
	/opt/homebrew/opt/coreutils/libexec/gnubin(N) # coreutils
	/opt/homebrew/opt/gnu-tar/libexec/gnubin(N) 	# tar
  $HOME/bin/aws-cli(N) 													# AWS CLI
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin(N)
  $path
)


#
# Tooling
#

# NI
export NI_CONFIG_FILE="$HOME/.config/.nirc"

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# N
# export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
# export N_PRESERVE_NPM=1
# export N_PRESERVE_COREPACK=1

# Cargo?
. "$HOME/.cargo/env"

# Python / pyenv
# eval "$(pyenv init --path)"

# To use the bundled libc++ with LLVM:
# LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

export CLANG_INSTALL_DIR=/opt/homebrew/opt/llvm
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# FZF
FZF_FD_OPTS="--color always --hidden --follow --exclude .git --exclude node_modules"
FZF_PREVIEW_FILE_COMMAND="bat --color=always --paging=never --style=plain"
FZF_PREVIEW_DIR_COMMAND="exa -1a --color=always --icons --group-directories-first"
FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --margin=1,4 --info=inline --border --margin=2"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --padding=0 --bind \"tab:accept,ctrl-y:preview-page-up,ctrl-v:preview-page-down,ctrl-e:execute-silent(\${VISUAL:-code} {+} >/dev/null 2>&1)\""
FZF_DEFAULT_COMMAND="fd --type f $FZF_FD_OPTS"
# FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git,.cache,.local,.npm,.zsh_sessions,.nvm,.dotfiles,.Trash,Library,Movies}"'
FZF_ALT_C_OPTS="--ansi --preview \"$FZF_PREVIEW_DIR_COMMAND {} 2>/dev/null\""
FZF_ALT_C_COMMAND="fd --type d . $FZF_FD_OPTS"
FZF_CTRL_T_OPTS="--ansi --bind \"ctrl-w:execute(\${EDITOR:-vim} {1} >/dev/tty </dev/tty)+refresh-preview\" --preview \"$FZF_PREVIEW_FILE_COMMAND {} 2>/dev/null\""
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# wine
export FREETYPE_PROPERTIES="truetype:interpreter-version=35"

# bat
export BAT_THEME='gruvbox-dark'
export BAT_PAGER='less -R -F -+X --mouse'
export MANPAGER='sh -c \"col -bx | bat --color=always --style=plain --language=man\"'

# Cypress
export CYPRESS_CACHE_FOLDER="~/.cache/Cypress"
export CYPRESS_CRASH_REPORTS=0

# Telemetries
export NEXT_TELEMETRY_DISABLED=1
export GATSBY_TELEMETRY_DISABLED=1

# Brew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
eval "$(/opt/homebrew/bin/brew shellenv)" # compability with Apple Silicon
