@echo off
setlocal enabledelayedexpansion

set RuleName=FastTrack
set RulePort=667
set ICMPRule=All ICMP V4
REM Profile can be any one of these: public, private, domain, any
set RuleProfile=domain

set toggle=%1

2>NUL CALL :CASE_%toggle%
IF ERRORLEVEL 1 CALL :TOGGLE # if label doesn't exist

ECHO Done.
EXIT /B

:TOGGLE
	netsh.exe advfirewall firewall show rule name="%RuleName%" | find.exe /i "-----" >NUL
	if not errorlevel 1 (
		GOTO CASE_off
	)
	GOTO CASE_on
:CASE_on
	netsh.exe advfirewall firewall show rule name="%RuleName%" | find.exe /i "-----" >NUL
	if not errorlevel 1 (
		echo Rule '%RuleName%' already set, exiting.
		exit /b 0
	)

	netsh advfirewall firewall add rule name="%ICMPRule%" dir=in action=allow protocol=icmpv4
	netsh advfirewall firewall add rule name="%RuleName%" dir=in action=allow protocol=TCP localport=667
	ECHO Firewall opened for fastrack (ICMP and TCP port 667)
	GOTO END_CASE
:CASE_off
	netsh advfirewall firewall delete rule name="%ICMPRule%"
	netsh advfirewall firewall delete rule name="%RuleName%"
	ECHO Fastrack firewall rules closed (ICMP and TCP port 667)
	GOTO END_CASE
:DEFAULT_CASE
  ECHO run this with "on" or "off" parameter
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL