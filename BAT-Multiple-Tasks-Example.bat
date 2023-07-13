@echo off

:: Task 1: Generate a timestamp
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set timestamp=%%c-%%a-%%b)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (set timestamp=!timestamp!_%%a%%b)

:: Task 2: Create a backup directory
set backup_dir=Backup_%timestamp%
mkdir %backup_dir%

:: Task 3: Copy files to the backup directory
xcopy /E /C /I /Y "C:\Path\to\Files" "%backup_dir%"

:: Task 4: Retrieve system information
systeminfo > System_Info.txt

:: Task 5: Perform a disk cleanup
cleanmgr /sagerun:1

:: Task 6: Run a custom command
echo Running custom command...
your_custom_command.exe

:: Task 7: Prompt for user input
set /p user_input="Please enter your name: "
echo Hello, %user_input%!

:: Task 8: Loop through a directory and process files
for %%f in ("C:\Path\to\Files\*.txt") do (
    echo Processing file: %%f
    rem Perform additional operations on the file...
)

:: Task 9: Display a message box
echo MsgBox "This is a message box!" > message.vbs
start /w "" wscript.exe message.vbs

:: Task 10: Terminate a running process
taskkill /f /im your_process.exe

:: Task 11: Perform network operations
ping 8.8.8.8 -n 1 -w 1000
tracert www.example.com

:: Task 12: Generate a log file
echo Batch file executed successfully! > Log_%timestamp%.txt

:: Task 13: Clean up temporary files
del message.vbs

:: Task 14: Launch .jar file on share drive
/C pushd \\sharedrive\folder\subfolder & java -jar jarprogram.jar

::Task 15: Delete a file from a share drive
DEL /F/Q \\sharedrive\folder\subfolder\file.txt

echo All tasks completed.
pause