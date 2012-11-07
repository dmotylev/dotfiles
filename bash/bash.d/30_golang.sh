_go_color_rst=$(tput sgr0)
_go_color_new_path=$(tput setaf 208)
_go_color_lib_path=$(tput setaf 207)

set_gopath() {
	local mylib_path="${HOME}/Workshop/go/library"
	local cwd="$1"

	if [ -z $cwd ]; then
		export GOPATH=$mylib_path
		return
	fi

	if [ $cwd = $mylib_path ]; then
		export GOPATH=$mylib_path
		echo -e "${_go_color_lib_path}${mylib_path}${_go_color_rst}"
		return
	fi

	if [ $cwd = $HOME ]; then
		export GOPATH=$mylib_path
		echo -e "${_go_color_lib_path}${mylib_path}${_go_color_rst}"
		return
	fi

	export GOPATH=$cwd:$mylib_path
	echo -e "${_go_color_new_path}${cwd}${_go_color_rst}:${_go_color_lib_path}${mylib_path}${_go_color_rst}"
}

gopath() {
	set_gopath "${PWD}"
}

set_gopath
export GOROOT=/usr/local/go
PATH=${PATH}:${GOROOT}/bin
