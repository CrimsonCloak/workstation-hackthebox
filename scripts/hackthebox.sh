#! /bin/bash
#
# Provisioning script for Ansible control node

#--------- Bash settings ------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#--------- Variables ----------------------------------------------------------

# Location of provisioning scripts and files
declare PROVISIONING_SCRIPTS="/vagrant/scripts/"
# Location of files to be copied to this server
declare PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/${HOSTNAME}"

declare WORKSTATION_USER="hacker"

declare WORKSTATION_USER_PASSWORD="hackerman"

declare KEYBOARD_LOADOUT="be" # Change for desired keyboard loadout, eg. 'us', 'be',... (cat /usr/share/X11/xkb/rules/xorg.lst)

#---------- Load utility functions --------------------------------------------

source ${PROVISIONING_SCRIPTS}/util.sh

#---------- Provision host ----------------------------------------------------

log "Starting server specific provisioning tasks on host ${HOSTNAME}..."

log "Creating custom workstation user..."

ensure_user_exists ${WORKSTATION_USER}
# TO DO - set defaults for new user (home folder, shell!)

echo ${WORKSTATION_USER}:${WORKSTATION_USER_PASSWORD} | chpasswd

assign_groups ${WORKSTATION_USER} sudo

log "Changing keyboard loadout..."

set_keyboard_loadout ${KEYBOARD_LOADOUT}


log "Rebooting virtual machine..."

reboot



