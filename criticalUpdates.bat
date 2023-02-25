@echo off

setlocal enabledelayedexpansion

set "criticalUpdates=KB4507456 KB4507459 KB4507460 KB4507466"
set "output="
for /f "tokens=2" %%a in ('wmic qfe list full /format:csv ^| findstr /r /c:"%criticalUpdates%"') do (
  set "installed=yes"
  for %%b in (%criticalUpdates%) do (
    if "%%a" == "%%b" set "installed=no"
  ))
  if "!installed!" == "yes" set "output=!output! Vulnerability detected: missing critical update %%a`n"
)

if defined output (
  echo !output! > "%userprofile%\desktop\vulnerability_report.txt"
) else (
  echo No vulnerabilities detected. > "%userprofile%\desktop\vulnerability_report.txt"
)