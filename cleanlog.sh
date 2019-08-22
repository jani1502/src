LOG_DIR=/var/log
ROOT_UID=0
LINES=25
E_XCD=66
E_NOTROOT=67

if [ "$UID" -ne "$ROOT_UID" ]
then
 echo "you must be run to run this script"
 exit $E_NOTROOT
fi



if [ `pwd` != $LOG_DIR ]
then
 echo "cannot change to $LOG_DIR"
 exit $E_XCD
fi
	
tail -$LINES messages >mesg.temp
mv mesg.temp messages
cat /dev/null >wtmp
echo "all logs cleaned ..up"
exit


