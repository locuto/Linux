
#1) Copy the below script.
#2) vi sybase
#3) edit to change the servers name & path
#4) cp sybase  /etc/init.d/sybase
#5) chmod 755 /etc/init.d/sybase
#6) Now find the syslog number by 
#ls /etc/rc3.d/S* 
#ls /etc/rc5.d/S*
#7) If 87 is free then create soft link for both run level 3 & 5  by
#ln -s /etc/init.d/sybase     /etc/rc3.d/S87sybase
#ln -s /etc/init.d/sybase     /etc/rc5.d/S87sybase

#We can also use to start & stop the server manually

#./sybase  stop
#./sybase  start
#./sybase  restart
##################################################################################################################

#!/bin/sh
#only replace the sybase path & name of ASE & backup server in #below 3 steps.

SYBASE=/opt/sap
SERVER=CPSYBTEST
SERVER1=CPSYBTEST_BS

# Set environment variables.

. $SYBASE/SYBASE.sh
# The name of the script is..

NAME=`basename $0`

start() {

SYBASE_START=$"Starting ${NAME} service: "

$SU -l sybase -c ". $SYBASE/SYBASE.sh; $SYBASE/$SYBASE_ASE/install/startserver \

-f $SYBASE/$SYBASE_ASE/install/RUN_${SERVER} > /dev/null"

$SU -l sybase -c ". $SYBASE/SYBASE.sh; $SYBASE/$SYBASE_ASE/install/startserver \

-f $SYBASE/$SYBASE_ASE/install/RUN_${SERVER1} > /dev/null"

ret=$?

if [ $ret -eq 0 ]

then

echo "$SYBASE_START Success."

else

echo "$SYBASE_START Failed!"

exit 1

fi

}

stop() {

echo -n $"Stopping ${NAME} service: "

$SU -l sybase -c ". $SYBASE/SYBASE.sh; isql -S $SERVER -U sa -P " < \

$SYBASE/$SYBASE_ASE/upgrade/shutdown.sql > /dev/null"

#             echo -n $"Stopping ${NAME} service: "

$SU -l sybase -c ". $SYBASE/SYBASE.sh; isql -S $SERVER1 -U sa -P " < \

$SYBASE/$SYBASE_ASE/upgrade/shutdown.sql > /dev/null"

ret=$?

if [ $ret -eq 0 ]

then

echo "Success."

else

echo "Failed!"

exit 1

fi

}

restart() {

stop

start

}

case "$1″ in

start)

start

;;

stop)

stop

;;

restart)

restart

;;

*)

echo $"Usage: $0 {start|stop|restart}"

exit 1

esac

exit 0