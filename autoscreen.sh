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
# source this file at the very END (important!)
# of your shell's .*rc file

_autoscreen() {
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
  return 1
 fi
 
 if [ "$1" ]
 then
  local MYTEST="$1"
 else
  local MYTEST=""
 fi
 if [ "$2" ]
 then
  local STARTWAIT="$2"
 else
  local STARTWAIT=2
 fi
 if [ "$3" ]
 then
  local EXITWAIT="$3"
 else
  local EXITWAIT=1
 fi
 typeset -i i STARTWAIT
 typeset -i i EXITWAIT
 local READC
 local RGOOD
 local LENGTH
 
 if [[ -z "$STY" && "$TERM" != "dumb" && -z "$MYTEST" || "$HOSTNAME" = $MYTEST ]]
 then
  printf "Starting screen. ^C to cancel... "
  # countdown
  for((i=STARTWAIT;i>0;i--))
  do
   printf '%b' $i
   read -rsd '\0' -N 1 -t 1 READC && RGOOD=1
   LENGTH=${#i}
   for((j=0;j<LENGTH;j++))
   do
    printf ' '
   done
   if [[ -z "$READC" && "$RGOOD" ]]
   then
    break
   fi
  done
  printf '0\n'
  RGOOD=""
  # start screen session
  # clear screen
  screen -D -RR && clear &&
  echo "Screen terminated. Exiting. ^C to cancel..." &&
  # countdown
  for((i=EXITWAIT;i>0;i--))
  do
   printf '%b' $i
   read -rsd '\0' -N 1 -t 1 READC && RGOOD=1
   LENGTH=${#i}
   for((j=0;j<LENGTH;j++))
   do
    printf ' '
   done
   if [[ -z "$READC" && "$RGOOD" ]]
   then
    break
   fi
  done &&
  printf '0\n'
 else
  return 1
 fi
}
# close shell or connection after successful execution
_autoscreen "$@" && exit
# do not exit on error
