#!/bin/bash
set -e

mainSOURCE_DIR="$(dirname "$(readlink "${BASH_SOURCE[0]}")")"
source "$mainSOURCE_DIR/linkcheck.source.sh"

main(){
	linkcheck_pipe
}
main
