#!/bin/bash
config_executeable(){
	local -r myRoot="$1"
	# include components required to create this executable
	local mod
	for mod in $( "$myRoot/recurcmd_sh/sourcer/sourcer.sh" "$myRoot/recurcmd_sh"); do
		source "$mod"
	done
}

main(){
	config_executeable "$(dirname "${BASH_SOURCE[0]}")"
	recurcmd_run "$1" "$2"
}
main  "$@"
