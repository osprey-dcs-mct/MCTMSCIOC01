# $File: //ASP/opa/mct/iocs/MCTMSCIOC01/MCTMSCIOC01App/src/Makefile $
# $Revision: #2 $
# $DateTime: 2021/08/05 18:41:55 $
# Last checked in by: $Author: pozara $
#
TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MCTMSCIOC01
# MCTMSCIOC01.dbd will be created and installed
DBD += MCTMSCIOC01.dbd

# MCTMSCIOC01.dbd will be made up from these files:
MCTMSCIOC01_DBD += base.dbd
MCTMSCIOC01_DBD += system.dbd

ifdef BASE_7_0
# We are using EPICS 7.0 or later - pull in PV Access dbd files and libraries.
#
MCTMSCIOC01_DBD += PVAServerRegister.dbd
MCTMSCIOC01_DBD += qsrv.dbd

MCTMSCIOC01_LIBS += nt
MCTMSCIOC01_LIBS += pvAccess
MCTMSCIOC01_LIBS += pvAccessCA
MCTMSCIOC01_LIBS += pvAccessIOC
MCTMSCIOC01_LIBS += pvData
MCTMSCIOC01_LIBS += pvDatabase
MCTMSCIOC01_LIBS += qsrv
endif

SCRIPTS += mct_dmm_energy_control.service
SCRIPTS += mct_dmm_energy_control

# Generic service start/stop support
#
MCTMSCIOC01_DBD += service_control.dbd
MCTMSCIOC01_LIBS += service_control

# IOC Status related dbd/libraries.
#
MCTMSCIOC01_DBD += IocStat.dbd
MCTMSCIOC01_LIBS += IocStat

# Signal handling related dbd/libraries (Linux only)
#
MCTMSCIOC01_DBD += signal_catch.dbd
MCTMSCIOC01_LIBS += signal_catch

# Include dbd files and libraries from all support applications
# needed by this IOC:
#
# Autosave related dbd/libraries.
#
MCTMSCIOC01_DBD += asSupport.dbd
MCTMSCIOC01_LIBS += autosave

# LUA support
#
MCTMSCIOC01_DBD += luaSupport.dbd
MCTMSCIOC01_LIBS += lua

# MCTMSCIOC01_registerRecordDeviceDriver.cpp derives from MCTMSCIOC01.dbd
MCTMSCIOC01_SRCS += MCTMSCIOC01_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MCTMSCIOC01_SRCS_DEFAULT += MCTMSCIOC01Main.cpp
MCTMSCIOC01_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MCTMSCIOC01_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MCTMSCIOC01_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

# end
