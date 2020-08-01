
linkcheck_list(){

	local mrkdwnFILE_NAME
	while read -r mrkdwnFILE_NAME; do
		echo "$PWD/$mrkdwnFILE_NAME"
	done < <(ls --format=single-column *.md)
}

linkcheck_run(){

	local mrkdwnFILE_PATH
	local mrkdwnPATH
	while read -r mrkdwnFILE_PATH; do
		mrkdwnPATH="$(dirname $mrkdwnFILE_PATH)"
		docker run --rm -a stdout -a stderr -v "$mrkdwnPATH":"$mrkdwnPATH" markdown_link_checker "$mrkdwnFILE_PATH"
	done
}

linkcheck_sysout_filter(){

	# retain the report's filename ("^FILE: ") and any lines reporting on an error " Status: " 
	grep "^FILE: \| Status: "
}

linkcheck_pipe(){

	local pipeOPT
	linkcheck__pipe_option_save pipeOPT
	set -o pipefail
	linkcheck_list | linkcheck_run | linkcheck_sysout_filter
	linkcheck__pipe_option_restore "$pipeOPT"
}

linkcheck__pipe_option_save(){
	eval $1=\"\$\(\set\ \+o \| \grep pipefail\)\"
}

linkcheck__pipe_option_restore(){
	eval $1
}




