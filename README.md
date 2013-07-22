# autoscreen

**autoscreen** - Automatically start screen without inception


## Installation

Source `autoscreen.sh` at the very **END** of your .\*rc file.

    source </path/to/autoscreen.sh> HOSTNAME STARTWAIT EXITWAIT

Automatically start a GNU screen session without inception.
If HOSTNAME is not empty, check that \$HOSTNAME = HOSTNAME before starting (wildcards allowed).
Waits STARTWAIT seconds before start (default 2). 
Waits EXITWAIT seconds before exit (default 1).

## Usage

When you start your shell, you will be notified that you are about to enter a screen session (^C to cancel).  
When your screen session ends, you will be notified that your shell will exit (^C to cancel).
You can skip the countdown with ENTER.

