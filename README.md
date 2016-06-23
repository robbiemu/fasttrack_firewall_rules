# Fasttrack_Firewall rules script

## Purpose

* open/close pings (in fact, all icmp v4)
* open port for development (fasttrack port is set to TCP:667)

## Usage

1. open the local copy of the repository in the file explorer.
2. double clicking the link file (named "fasttrack_firewall.lnk") toggles the firewall rules.

or

2. you can also run it from the commandline with on/off parameter to explicitly turn the rules on or off

## Ensure

The easiest way to see if it works is with a partner. have your partner ping your machine (it should time out).
Then double click the shortcut, and ping again (it should now work). When/if you want to close the port and icmp messages (ping access), double click the shortcut again.

## Rule names

The firewall rules are named, so you cna manually find and remove them:

* FastTrack
* All ICMP V4

## Common Problems
_(hopefully none)_

* if it doesn't work double-clicking the link, ensure the link has "run as administrator" checked