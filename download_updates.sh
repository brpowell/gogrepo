#!/bin/bash

# ----------------------------------
# Job Configuration
# ----------------------------------

DEFAULT_LOCATION="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/gogrepo.py"
GOGREPO=$DEFAULT_LOCATION

# platforms to download updates for
PLATFORMS='windows linux mac'

# languages to fetch games and extras for. See gogrepo.py for available languages
LANGUAGES='en'

# location to backup games and extras to
BACKUP_FOLDER="$(dirname $GOGREPO)/backups"

# ----------------------------------

function update_and_download {
  # script expects execution in the same current working directory where it lives
  cd $(dirname $GOGREPO)

  # check for new games and update manifest
  $GOGREPO update -os $PLATFORMS -lang $LANGUAGES -skipknown

  # check for updates to existing games and update manifest
  $GOGREPO update -os $PLATFORMS -lang $LANGUAGES -updateonly

  # download missing files according to the manifest 
  $GOGREPO download $BACKUP_FOLDER
}

update_and_download