#!/bin/bash

# ----------------------------------
# Job Configuration
# ----------------------------------
PYTHON='/usr/bin/python'
SCRIPT_LOCATION='/home/pi/gogrepo/gogrepo.py'

# platforms to download updates for
PLATFORMS='windows linux mac'

# languages to fetch games and extras for. See gogrepo.py for available languages
LANGUAGES='en'

# location to backup games and extras to
BACKUP_LOCATION='/home/pi/gogrepo/backups'
# ----------------------------------

gogrepo=''$PYTHON' '$SCRIPT_LOCATION''

# script expects execution in the same current working directory where it lives
cd $(dirname $SCRIPT_LOCATION)

# check for new games
$gogrepo update -os $PLATFORMS -lang $LANGUAGES -skipknown

# check for updates
$gogrepo update -os $PLATFORMS -lang $LANGUAGES -updateonly

# download manifest updates
$gogrepo download $BACKUP_LOCATION