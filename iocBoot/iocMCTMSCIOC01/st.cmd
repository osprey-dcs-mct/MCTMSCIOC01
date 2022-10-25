#!../../bin/linux-x86_64/MCTMSCIOC01
#
# $File: //ASP/opa/mct/iocs/MCTMSCIOC01/iocBoot/iocMCTMSCIOC01/st.cmd $
# $Revision: #3 $
# $DateTime: 2021/09/09 17:34:07 $
# Last checked in by: $Author: pozara $
#

## You may have to change MCTMSCIOC01 to something else
## everywhere it appears in this file

< envPaths

# Usually set by epics.service script
epicsEnvSet ("IOCNAME", "MCTMSCIOC01")
epicsEnvSet ("IOCSH_PS1","MCTMSCIOC01> ")

# Path to lua scripts
#
epicsEnvSet ("LUA_SCRIPT_PATH", "$(TOP)/crapi/")

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/MCTMSCIOC01.dbd"
MCTMSCIOC01_registerRecordDeviceDriver pdbbase

## Autosave set-up
#
< ${AUTOSAVESETUP}/crapi/save_restore.cmd

## Restore auto save like this ....
set_pass0_restoreFile ("vbm_stripe_control.sav")
set_pass1_restoreFile ("vbm_stripe_control.sav")

set_pass0_restoreFile ("pds_filters.sav")
set_pass1_restoreFile ("pds_filters.sav")

## Load record instances
#
# Set hash table size
#
dbPvdTableSize (4096)

# Allow epics service script to initiate clean shutdown by performing
#   caput MCTMSCIOC01:exit.PROC 1
#
dbLoadRecords ("${EPICS_BASE}/db/softIocExit.db", "IOC=${IOCNAME}")

# Load standard bundle build status and IOC (and host) monitoring records.
#
dbLoadRecords ("${BUNDLESTATUS}/db/build.template", "IOC=${IOCNAME}")
dbLoadRecords ("${IOCSTATUS}/db/IocStatus.template", "IOC=${IOCNAME}")

dbLoadRecords ("db/dmm_energy_control.db")
dbLoadRecords ("db/vbm_stripe_control.db")
dbLoadTemplate ("db/pds_filters.substitutions")

register_service_name ("/beamline/perforce/opa/mct/iocs/MCTMSCIOC01/bin/linux-x86_64/mct_dmm_energy_control")

cd ${TOP}/iocBoot/${IOC}
iocInit

# Catch SIGINT and SIGTERM - do an orderly shutdown
#
catch_sigint
catch_sigterm

# Update the firewall to allow use of arbitary port number
#
system firewall_update

# Dump all record names
#
dbl > /asp/logs/ioc/${IOCNAME}/${IOC}.dbl

## Autosave monitor set-up.
#
create_monitor_set ("vbm_stripe_control.req", 30)
create_monitor_set ("pds_filters.req", 30)

# end
