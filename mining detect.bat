@echo off

rem Function to detect mining programs
:detect_mining
tasklist /FI "IMAGENAME eq miner*" /FO CSV | find /C "miner"
if %errorlevel% equ 0 (
    tasklist /FI "IMAGENAME eq miner*" /FO TABLE
) else (
    echo No mining programs detected.
)

rem Function to create the results file
:create_results_file
set desktop=%USERPROFILE%\Desktop
set results_file=%desktop%\mining_programs_detection_results.txt

call :detect_mining > %results_file%
echo Results saved to %results_file%