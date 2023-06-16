#!/usr/bin/env bash
#===============================================================================
#
#  ________  ________  ________  ___  ___  ________ ___    ___ 
# |\   __  \|\   __  \|\   ____\|\  \|\  \|\  _____|\  \  /  /|
# \ \  \|\ /\ \  \|\  \ \  \___|\ \  \\\  \ \  \__/\ \  \/  / /
#  \ \   __  \ \   __  \ \_____  \ \   __  \ \   __\\ \    / / 
#   \ \  \|\  \ \  \ \  \|____|\  \ \  \ \  \ \  \_| /     \/  
#    \ \_______\ \__\ \__\____\_\  \ \__\ \__\ \__\ /  /\   \  
#     \|_______|\|__|\|__|\_________\|__|\|__|\|__|/__/ /\ __\ 
#                        \|_________|              |__|/ \|__| 
#                                                             
#-------------------------------------------------------------------------------
#$ name:bashfx
#$ author:qodeninja
#$ autobuild: 00001
#$ date:
#-------------------------------------------------------------------------------
#=====================================code!=====================================


#-------------------------------------------------------------------------------
# FX Main
#-------------------------------------------------------------------------------

	function main(){
		local call ret
		for call in "${@}"; do
			case $call in
				inst*)     api_install;   ret=$?;;
				unins*)    api_uninstall; ret=$?;;
				dl)				 fx_vars; fx_download; ret=$?;;
				*)
					if [ ! -z "$call" ]; then
						die "Invalid command $call";
						ret 1;
					fi
				;;
			esac
		done
		#fx_dump
		return $ret
	}

#-------------------------------------------------------------------------------
# FX Driver
#-------------------------------------------------------------------------------

	if [ "$0" = "-bash" ]; then
		:
	else
		orig_args=("${@}")
		api_options "${orig_args[@]}"
		args=( "${orig_args[@]/\-*}" ); #delete anything that looks like an option
		main "${args[@]}";ret=$?
	fi

