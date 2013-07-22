# autoscreen
# auto start a GNU screen session without inception
#
# Copyright (C) 2013 Mara Kim
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see http://www.gnu.org/licenses/.


### USAGE ###
# source this file at the very end (important!)
# of your shell's .*rc file

if [ "$1" = "-h" -o "$1" = "--help" ]
then
 echo "Usage: Source this script at the END of your .bashrc with:

  source </path/to/autoscreen.sh> HOSTNAME STARTWAIT EXITWAIT

Automatically start a GNU screen session without inception.
If HOSTNAME is not empty, check that \$HOSTNAME = HOSTNAME before starting (wildcards allowed).
Waits STARTWAIT seconds before start (default 2). 
Waits EXITWAIT seconds before exit (default 1).
Option		GNU long option		Meaning
-h		--help			Show this message"
 return 0
fi

if [ "$1" ]
then
 MYTEST="$1"
else
 MYTEST=""
fi
if [ "$2" ]
then
 STARTWAIT="$2"
else
 STARTWAIT=2
fi
if [ "$3" ]
then
 EXITWAIT="$3"
else
 EXITWAIT=1
fi

if [[ -z "$STY" && "$TERM" != "dumb" && -z "$MYTEST" || "$HOSTNAME" = $MYTEST ]]
then
 echo "Starting screen. ^C to cancel..."
 sleep "$STARTWAIT"
 # start screen session
 screen -D -RR
 # close shell or connection after termination
 clear
 echo "Screen terminated. Exiting. ^C to cancel..."
 sleep "$EXITWAIT"
 exit
fi
