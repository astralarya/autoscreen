# autoscreen

**autoscreen** - Automatically start GNU screen without inception


## Installation

Source `autoscreen.sh` at the very **END** of your .\*rc file.

    source /path/to/autoscreen.sh [HOSTNAME] [STARTWAIT] [EXITWAIT]

If *HOSTNAME* is not empty, check that $HOSTNAME = *HOSTNAME* before starting (wildcards allowed).  
Waits *STARTWAIT* seconds before starting screen (default 3).   
Waits *EXITWAIT* seconds before exiting the shell after screen terminates (default 2).  

## Usage

When you start your shell, you will be notified that you are about to enter a screen session (^C to cancel).  
When your screen session ends, you will be notified that your shell will exit (^C to cancel).  
You can skip the countdown with any key besides ^C.  

For help using GNU screen see the [GNU screen manual](http://www.gnu.org/software/screen/manual/screen.html).

## Dependencies

* bash
* screen
