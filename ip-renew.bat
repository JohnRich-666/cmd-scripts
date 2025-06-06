@echo off
:: Disabling the current IP
echo Disabling the current IP...
ipconfig /release

:: Requesting a new IP address
echo Requesting a new IP address...
ipconfig /renew

:: Updating DNS
echo Updating DNS...
ipconfig /flushdns
ipconfig /registerdns

:: get a new IP address and write it to a file
echo get a new IP address and write it to a file...
ipconfig | findstr "IPv4" > new_ip.txt

:: Closing message
echo Ready! The new IP address in new_ip.txt
pause
