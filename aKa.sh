add() {
	shift
	alias=$1
	command=$2
	if [ $# -lt 2 ]; then
		if [ $# -eq 0 ]; then
			echo -n "Enter your alias name and press enter [ENTER]: "
			read alias
		fi		
		echo -n "Enter an associated command for $alias and press enter [ENTER]: "
		read command
	fi			
	echo $alias : $command > aKa.list
	exit
}

help() {
cat help
}

remove() {
echo remove
}

list() {
cat aKa.list
}

version() {
echo version
}

main() {
	if [ $# -eq 0 ]; then
		help
	fi
	
	while [ $# -ne 0 ];do
		if [ "$1" = "--add" ] || [ "$1" = "-a" ]; then
			add $*
		elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
			help
		elif [ "$1" = "--remove" ] || [ "$1" = "-r" ];then
			remove
		elif [ "$1" = "--list" ] || [ "$1" = "-l" ]; then
			list
		elif [ "$1" = "--version" ]; then
			version
		else
			help
		fi
		shift
	done
}

main $*
