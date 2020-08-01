#!/bin/bash
set -e
main(){
	./review/tools/recurcmd/recurcmd.sh "build.sh" 'true'
}
main
