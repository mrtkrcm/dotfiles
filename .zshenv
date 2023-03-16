#!/usr/bin/env zsh

[ "$DEBUG" -eq 1 ] && set -xv # Enable ZSH debug logs

# There are five startup files that zsh will read commands from:
# $ZDOTDIR/.zshenv (this file)
# $ZDOTDIR/.zprofile
# $ZDOTDIR/.zshrc
# $ZDOTDIR/.zlogin
# $ZDOTDIR/.zlogout

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
# skip_global_compinit=1

# Additional ZSH tweaks: 		https://zsh.sourceforge.io/Doc/Release/Options.html
setopt auto_cd              # Use cd by typing directory name if it's not a command.
setopt auto_list            # Automatically list choices on ambiguous completion.
setopt auto_pushd           # Make cd push the old directory onto the directory stack.
setopt bang_hist            # Treat the '!' character, especially during Expansion.
setopt interactive_comments # Comments even in interactive shells.
setopt multios              # Implicit tees or cats when multiple redirections are attempted.
setopt no_beep              # Don't beep on error.
setopt prompt_subst         # Substitution of parameters inside the prompt each time the prompt is drawn.
setopt pushd_ignore_dups    # Don't push multiple copies directory onto the directory stack.
setopt pushd_minus          # Swap the meaning of cd +1 and cd -1 to the opposite.
# http://disq.us/p/f55b78
# If this option is unset, the startup files /etc/zprofile, /etc/zshrc, /etc/zlogin and /etc/zlogout will not be run.
setopt noglobalrcs
# Preventing aliases from being internally substituted before completion is attempted.
unset completealiases

# ZSH history options 			https://zsh.sourceforge.io/Doc/Release/Options.html#History
HISTFILE="$HOME/.history"
HISTIGNORE="&:ls:[bf]g:exit:reload:clear:cd:cd ..:cd..:zh:y:ys:gst:glog:glg"
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory notify 			# Allow multiple sessions to append to one Zsh command history.
setopt extended_history 					# Write the history file in the ":start:elapsed;command" format.
setopt share_history 							# Share history between different instances of the shell.
setopt inc_append_history				 	# Write to the history file immediately, not when the shell exits.
setopt BANG_HIST				 					# Treat the '!' character specially during expansion.
setopt HIST_EXPIRE_DUPS_FIRST  		# Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS				 		# Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  			# Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS				 	# Do not display a line previously found.
setopt HIST_IGNORE_SPACE				 	# Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS				 	# Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS				 	# Remove superfluous blanks before recording entry.
setopt HIST_VERIFY				 				# Don't execute immediately upon history expansion.
