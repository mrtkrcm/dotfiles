#!/usr/bin/env zsh

# Enable zsh profiler. Run "zprof" to output profiling results.
[ "$PROFILE" -eq 1 ] && zmodload zsh/zprof

####################################################################################################
#
# Ensure that a non-login, non-interactive shell has a defined environment.
#
if [[ ("$SHLVL" -eq 1 && ! -o LOGIN) && -s "$HOME/.zprofile" ]]; then
	source "$HOME/.zprofile"
fi

#
# Source all configuration files
#
for file in ~/.{path,functions,extra,aliases,plugins}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
#
#
#
####################################################################################################

[ "$DEBUG" = "zsh" ] && set +xv # disable ZSH verbose logs
