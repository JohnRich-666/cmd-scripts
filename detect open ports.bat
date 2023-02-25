@echo off

rem Function to detect open ports
:detect_open_ports
netstat -an | find /C "LISTENING"
if %errorlevel% equ 0 (
    netstat -an | find /I "LISTENING"
) else (
    echo No open ports detected.
)

rem Function to create the results file
:create_results_file
set desktop=%USERPROFILE%\Desktop
set results_file=%desktop%\open_ports_detection_results.txt

call :detect_open_ports > %results_file%
echo Results saved to %results_file%
