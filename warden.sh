#!/bin/bash
# warden is a wrapper script around apt and docker
# warden will:
# - run apt-get autoremove
# - docker prune

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
#COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
#COL_MAGENTA=$ESC_SEQ"35;01m"
#COL_CYAN=$ESC_SEQ"36;01m"


# Functions
# Error
error_exit() {
    echo -en "$COL_RED$1$COL_RESET" 1>&2
    exit 1
}

# Run apt-get autoremove
apt_auto() {
    echo -en "$COL_YELLOW Running apt-get autoremove ...$COL_RESET\n"
    apt autoremove -y
}
# Docker prune
docker_prune() {
    echo -en "$COL_YELLOW Housekeeping docker images ...$COL_RESET\n"
    docker system prune --all --force
}

if [[ $EUID -ne 0 ]];
then
    error_exit "Please run this script wit root or sudo"
else
    apt_auto
    docker_prune
fi

exit 0
