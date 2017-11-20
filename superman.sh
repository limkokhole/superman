#!/usr/bin/env bash
#Author: <limkokhole@gmail.com>

#https://unix.stackexchange.com/questions/318195/less-pattern-endswith-or
#[todo:0] support section parameter
#[tofix:0] "grotty:<standard input> (<standard input>):146452: character above first line discarded" if use `superman mpv`
#|\+ is for --gstabs+
function superman () {
    if [[ "$1" == "-I" || "$1" == "-i" ]]; then
        man "$2" | less -I -p "^[ ]+-*$3( |=|,|$|\[|\+)"
    else
        man "$1" | less -p "^[ ]+-*$2( |=|,|$|\[|\+)"
    fi
}
function superinfo () {
    if [[ "$1" == "-I" || "$1" == "-i" ]]; then
        info "$2" | less -I -p "^ *‘*'*-*\** *$3’*( |=|,|$|\[|:|'|\+)"
    else
        info "$1" | less -p "^ *‘*'*-*\** *$2’*( |=|,|$|\[|:|'|\+)"
    fi
}
export -f superinfo
alias si=superinfo
export si
export -f superman
alias sm=superman
export sm
<<"SUPERMAN"
This will work if i run superman -i gcc wl which means case-insensitive to jump into -Wl,option section. -Wl,option from gcc require ,. scaletempo from mplayer require [, and scale from mplayer require =
SUPERMAN
<<"SUPERINFO"
Tested with superinfo gcc _HPPA, superinfo -i gcc werror, superinfo -i gcc wl, superinfo -i mplayer scaletempo, superinfo -i mplayer stats, superinfo -i ls f, superinfo -i ls -f. Unicode's LEFT SINGLE QUOTATION MARK ’ used by -f of ls.
p/s: 
[1] si -i bash '!n'
[2] `man type` got PATH with underline, but `si -i type path` able get it but no underline already, [further:0]
[3] man mknod and info coreutils 'mknod invocation'
[3.1]
xb@dnxb:/run/systemd/journal$ info -k Werror
"(automake-1)amhello's configure" -- -Werror
"(gcc-6)Warning Options" -- Werror
"(gcc-6)Preprocessor Options" -- Werror <1>
"(gcc-6)Warning Options" -- Werror=
"(gcc-4)Warning Options" -- Werror
"(gcc-4)Preprocessor Options" -- Werror <1>
"(gcc-4)Warning Options" -- Werror=
"(libc)DES Encryption" -- DESERR_HWERROR
xb@dnxb:/run/systemd/journal$ 
SUPERINFO

bashman () { LESS="+/^ *$*" man bash;}
#wont work when bashman readline :(
bashman2 ()
{
    man bash | less -p "^       $1 "
}
alias bm=bashman


