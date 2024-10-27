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

#---------- Load utility functions --------------------------------------------

source ${PROVISIONING_SCRIPTS}/util.sh

#---------- Provision host ----------------------------------------------------

log "Starting server specific provisioning tasks on host ${HOSTNAME}..."


