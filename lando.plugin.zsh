LANDO_ZSH_SITES_DIRECTORY="$HOME/Sites"

LANDO_ZSH_CONFIG_FILE=./.lando.yml

# Enable multiple commands with lando.
function  artisan \
          composer \
          drush \
          gulp \
          npm \
          wp \
          yarn {

  if checkForFile ; then
    lando "$0" "$@"
  else
    command "$0" "$@"
  fi
}

# Check for the file in the current and parent directories.
checkForFile(){

  local current_directory="$PWD"

  # Bash is backwards. 0 is true 1 (non-zero) is false.
  flag="1"

  # Only bother checking for lando within the Sites directory.
  if [[ ":$PWD:" == *":$LANDO_ZSH_SITES_DIRECTORY"* ]]; then

    echo "Checking for file: $LANDO_ZSH_CONFIG_FILE within $LANDO_ZSH_SITES_DIRECTORY..."

    while true; do
      if [ $current_directory != "$LANDO_ZSH_SITES_DIRECTORY" ]; then
          if [ -f "$current_directory/$LANDO_ZSH_CONFIG_FILE" ]; then
            return "0"
          fi
        current_directory="$(dirname $current_directory)"
      else
        break;
      fi
    done

    if [[ "$flag" == "1" ]]; then
      echo "Could not find $LANDO_ZSH_CONFIG_FILE in the current directory or in any of its parents up to $LANDO_ZSH_SITES_DIRECTORY."
    fi

  else

    echo "Checking for file: $LANDO_ZSH_CONFIG_FILE"

    if [ -f "$LANDO_ZSH_CONFIG_FILE" ]; then
      echo "Found it"
      return 0
    else
      echo "Not Found"
      return "1"
    fi

    if [[ "$flag" == "1" ]]; then
      echo "Could not find $LANDO_ZSH_CONFIG_FILE."
    fi

  fi

  return $flag

}
