#!/bin/bash
# A script to install the appropriate styles for Thesis
# 1. Make this script executable (with: chmod +x install.sh )
# 2. Run this script as root

if [[ -e CSThesis.conf ]]; then source CSThesis.conf
elif [[ -e /etc/CSThesis.conf ]]; then source /etc/CSThesis.conf
fi

function global_vars(){
	NORMAL=$(tput sgr0)
	GREEN=$(tput setaf 2; tput bold)
	YELLOW=$(tput setaf 3)
	RED=$(tput setaf 1)
}

function debug() { [ "$DEBUG" ] && echo ">>> $*"; }
function error() { echo -e "$RED$*$NORMAL"; }
function success() { echo -e "$GREEN$*$NORMAL"; }
function warn() { echo -e "$YELLOW$*$NORMAL"; }

# Variables
function linux_vars(){
	: ${LATEX_PATH:="/usr/share/texmf-texlive"}
	PATH_TO_LATEX_STYLES="$LATEX_PATH/tex/latex/base"
	PATH_TO_BIBTEX_STYLES="$LATEX_PATH/bibtex/bst/"
	PATH_TO_LYX_LAYOUTS="$HOME/.lyx/layouts"
}

function mac_vars(){
	: ${LATEX_PATH:="/usr/local/texlive/2013basic/texmf-dist"}
	PATH_TO_LATEX_STYLES="$LATEX_PATH/tex/latex/base"
	PATH_TO_BIBTEX_STYLES="$LATEX_PATH/bibtex/bst"
	PATH_TO_LYX_LAYOUTS="$HOME/Library/Application Support/LyX-2.0/layouts"
}

function which_os(){
	check_root
	global_vars
	unamestr=`uname`
	if [[ "$unamestr" == 'Linux' ]]; then
	   linux_vars
	   deb_install_packages
	   check_tex_dir
	   main
	   refresh_tex_cache
	elif [[ "$unamestr" == 'Darwin' ]]; then
	   mac_vars
	   mac_install_packages
	   check_tex_dir
	   main
	fi
}

function main(){
	copy_latex_styles
	copy_bibtex_styles
	copy_lyx_layouts
	refresh_tex_cache
}

##################
# INSTALL
##################
function deb_install_packages(){
	require apt-get
	apt-get install texlive latexmk texlive-latex-extra texlive-bibtex-extra lyx 
}

function yum_install_packages(){
	echo "TODO"
}

function mac_install_packages(){
	require curl
	curl http://mirror.switch.ch/ftp/mirror/tex/systems/mac/mactex/mactex-basic.pkg -o mactex-basic.pkg
	require installer
	installer -pkg mactex-basic.pkg -target /
	rm mactex-basic.pkg
}

function require() { 
	which -s "$1"; 

	if [ $? -gt 0 ]
    then
      error '$1 is not in your path. Exiting'
      exit 1
    fi

}

function copy_latex_styles(){
	debug "Copying Latex Styles"
	cp template/*.sty $PATH_TO_LATEX_STYLES
}

function copy_bibtex_styles(){
	debug "Copying Bibtex Styles"
	mkdir -p "$PATH_TO_BIBTEX_STYLES/apa-good"
	cp template/*.bst $PATH_TO_BIBTEX_STYLES/apa-good
}

function copy_lyx_layouts(){
	debug "Copying Lyx Layouts"
	cp template/*.layout "$PATH_TO_LYX_LAYOUTS"
}

function refresh_tex_cache(){
	debug "Refreshing the TEX cache"
	mktexlsr || debug
}

function check_root(){
	if [ "$(id -u)" != "0" ]; then
   		error "This script must be run as root!" 
   		exit 1
	fi
}

function check_tex_dir(){
	if [ -d "$LATEX_BASE_PATH" ]; then
 		debug "Using TEX installed at "$LATEX_BASE_PATH" found in path!"
	else
      error ""$LATEX_BASE_PATH" is not in your path. Exiting"
      exit 1
    fi
}

function require() { 
    if command -v $1 >/dev/null; then
      debug ""$1" found in path!"
    else
      error ""$1" is not in your path. Please set the path to Latex in the included CSThesis.conf file and re-run script. Exiting!! "
      exit $?
    fi
}

which_os



