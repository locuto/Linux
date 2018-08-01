#
# SAP Product Environment variables
#
SAP_JRE8_32="/opt/sap/shared/SAPJRE-8_1_008_32BIT"
export SAP_JRE8_32
INCLUDE="/opt/sap/OCS-16_0/include":$INCLUDE
export INCLUDE
LIB="/opt/sap/OCS-16_0/lib":$LIB
export LIB
PATH="/opt/sap/OCS-16_0/bin":$PATH
export PATH
#
# Replace lib, lib3p, and lib3p64 with devlib, devlib3p, and devlib3p64 when debugging
#
LD_LIBRARY_PATH="/opt/sap/OCS-16_0/lib:/opt/sap/OCS-16_0/lib3p64:/opt/sap/OCS-16_0/lib3p":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
LD_LIBRARY_PATH="/opt/sap/DataAccess/ODBC/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
LD_LIBRARY_PATH="/opt/sap/DataAccess64/ODBC/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
PATH="/opt/sap/COCKPIT-4/bin":$PATH
export PATH
PATH="/opt/sap/ASE-16_0/bin:/opt/sap/ASE-16_0/install":$PATH
export PATH
LD_LIBRARY_PATH="/opt/sap/ASE-16_0/lib":$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
PATH="/opt/sap/ASE-16_0/jobscheduler/bin":$PATH
export PATH

#Need this stty for better handling
stty erase ^H
stty -tostop

#Must keep the following for licensing
SYBASE_SAM_CAPACITY=MACHINE:BE389A4754E30209D6A0826064DBC81DB7F83EF1D29890DFA7AA9C3F4BEFDF38B0888C4C40685EB253AE11169D5812C567EEB5F6EADDB3EDA5
export SYBASE_SAM_CAPACITY

#Set Server name
DSQUERY=CPDB2
export DSQUERY

#Set ll alias
alias ll='ls -lrth'
alias l='ls -lrth'

SAP_JRE7_32="/opt/sap/shared/SAPJRE-7_1_043_32BIT"
export SAP_JRE7_32
SAP_JRE7="/opt/sap/shared/SAPJRE-7_1_043_64BIT"
export SAP_JRE7
SAP_JRE7_64="/opt/sap/shared/SAPJRE-7_1_043_64BIT"
export SAP_JRE7_64
SAP_JRE8="/opt/sap/shared/SAPJRE-8_1_022_64BIT"
export SAP_JRE8
SAP_JRE8_64="/opt/sap/shared/SAPJRE-8_1_022_64BIT"
export SAP_JRE8_64
SYBASE_OCS="OCS-16_0"
export SYBASE_OCS
COCKPIT_JAVA_HOME="/opt/sap/shared/SAPJRE-8_1_022_64BIT"
export COCKPIT_JAVA_HOME
SYBASE="/opt/sap"
export SYBASE
SYBASE_ASE="ASE-16_0"
export SYBASE_ASE
SYBROOT="/opt/sap"
export SYBROOT
SYBASE_JRE_RTDS="/opt/sap/shared/SAPJRE-7_1_043_64BIT"
export SYBASE_JRE_RTDS
SYBASE_WS="WS-16_0"
export SYBASE_WS
