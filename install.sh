#!/bin/bash
# A script to install the appropriate styles for Thesis
# 1. Modify variables as described below
# 2. Make this script executable (with: chmod +x install.sh )
# 3. Run this script as root

############# MODIFY BELOW
USERNAME="egronei" 
LINUX_LATEX_PATH="/usr/share/texmf-texlive"
MAC_LATEX_PATH="/usr/local/texlive/2013basic/texmf-dist"
############# MODIFY ABOVE

# Variables
function linux_vars(){
	USER_BASE_PATH="/home/$USERNAME"
	LATEX_BASE_PATH="$LINUX_LATEX_PATH" # default deb distro path
	PATH_TO_LATEX_STYLES="$LATEX_BASE_PATH/tex/latex/base"
	PATH_TO_BIBTEX_STYLES="$LATEX_BASE_PATH/bibtex/bst/"
	PATH_TO_LYX_LAYOUTS="$USER_BASE_PATH/.lyx/layouts"
}

function mac_vars(){
	USER_BASE_PATH="/Users/$USERNAME"
	LATEX_BASE_PATH="$MAC_LATEX_PATH" # CHECK VERSION!
	PATH_TO_LATEX_STYLES="$LATEX_BASE_PATH/tex/latex/base"
	PATH_TO_BIBTEX_STYLES="$LATEX_BASE_PATH/bibtex/bst"
	PATH_TO_LYX_LAYOUTS="$USER_BASE_PATH/Library/Application Support/LyX-2.0/layouts"
}

function which_os(){
	unamestr=`uname`
	if [[ "$unamestr" == 'Linux' ]]; then
	   linux_vars
	   deb_install_packages
	   main
	   refresh_tex_cache
	elif [[ "$unamestr" == 'Darwin' ]]; then
	   mac_vars
	   #mac_install_packages
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
	apt-get install texlive latexmk texlive-latex-extra texlive-bibtex-extra lyx 
}

function yum_install_packages(){
	echo "TODO"
}

function mac_install_packages(){
	curl http://mirror.switch.ch/ftp/mirror/tex/systems/mac/mactex/mactex-basic.pkg -o mactex-basic.pkg
	installer -pkg mactex-basic.pkg -target /
	rm mactex-basic.pkg
}

function copy_latex_styles(){
	echo "Copying Latex Styles"
	cp template/*.sty $PATH_TO_LATEX_STYLES
}

function copy_bibtex_styles(){
	echo "Copying Bibtex Styles"
	mkdir -p "$PATH_TO_BIBTEX_STYLES/apa-good"
	cp template/*.bst $PATH_TO_BIBTEX_STYLES/apa-good
}

function copy_lyx_layouts(){
	echo "Copying Lyx Layouts"
	cp template/*.layout "$PATH_TO_LYX_LAYOUTS"
}

function refresh_tex_cache(){
	mktexlsr
}

which_os



