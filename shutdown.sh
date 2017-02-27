#!/bin/bash
F=/tmp/x.tmp
trap "/bin/rm -f $F" 0
/bin/ps -A -o pid,ppid,user,args >>$F
/usr/bin/logger -f $F
echo exec /sbin/.shutdown $@
