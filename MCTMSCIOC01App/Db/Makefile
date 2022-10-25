TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += dmm_energy_control.db
DB += vbm_stripe_control.db
DB += pds_filter.template
DB += pds_filters.substitutions

CRAPI += vbm_stripe_control.req
CRAPI += pds_filters.req
CRAPI += vbm_stripe_calc.lua

#----------------------------------------------------
# Call up all refraction files
# This will be installed into <top>/crapi/refractions
#
CRAPI += $(patsubst ../%, %, $(shell find ../refractions -type f ) )

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

