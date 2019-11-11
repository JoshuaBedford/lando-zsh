#!zsh

#
# A simple collection of alias functions to enable the use of CLIs within Lando without having to type 'lando'.
#
# WARNING: This could conflict with any aliases previously installed. If you have any of the CLIs installed globally (outside of lando)
# 		 : The functions *should* enable the ability to not have to type 'lando' before a command by prepending lando for all commands done in the same directory as a .lando.yml file.
#

# Enable wp command with lando.
function wp(){

	FILE=./.lando.yml
	if [ -f "$FILE" ]; then
		# Run Lando wp
		lando wp "$@"
	else
		# Run System wp
		command wp "$@"
	fi
}

# Enable composer command.
function composer(){

	FILE=./.lando.yml
	if [ -f "$FILE" ]; then
		# Run Lando composer
		echo "Using 'lando composer'"
		lando composer "$@"
	else
		# Run System composer
		command composer "$@"
	fi
}

# Enable artisan command.
function artisan(){

	FILE=./.lando.yml
	if [ -f "$FILE" ]; then
		# Run Lando artisan
		lando artisan "$@"
	else
		# Run System artisan
		command artisan "$@"
	fi
}

# Enable npm command for lando if lando file exists in directory.
function npm(){

	FILE=./.lando.yml
	if [ -f "$FILE" ]; then
		# Run Lando NPM
		lando npm "$@"
	else
		# Run System NPM
		command npm "$@"
	fi
}

# Enable gulp command.
function gulp(){

	FILE=./.lando.yml
	if [ -f "$FILE" ]; then
		# Run Lando gulp
		lando gulp "$@"
	else
		# Run System gulp
		command gulp "$@"
	fi
}