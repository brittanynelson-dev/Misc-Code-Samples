Option Explicit

' Task 1: Read and write to a text file
Dim filePath
filePath = "C:\Path\to\File.txt"

Dim fileSystemObject, textFile, content
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
Set textFile = fileSystemObject.OpenTextFile(filePath, 1)  ' 1 for reading
content = textFile.ReadAll()
textFile.Close()

content = Replace(content, "Hello", "Hi")
Set textFile = fileSystemObject.OpenTextFile(filePath, 2)  ' 2 for writing
textFile.Write content
textFile.Close()

' Task 2: Execute a command and capture output
Dim shell, command, output
Set shell = CreateObject("WScript.Shell")

command = "dir C:\"
output = shell.Exec(command).StdOut.ReadAll()
WScript.Echo output

' Task 3: Create a folder and copy files
Dim sourceFolder, destinationFolder
sourceFolder = "C:\Path\to\SourceFolder"
destinationFolder = "C:\Path\to\DestinationFolder"

If Not fileSystemObject.FolderExists(destinationFolder) Then
    fileSystemObject.CreateFolder(destinationFolder)
End If

Dim sourceFiles, file
Set sourceFiles = fileSystemObject.GetFolder(sourceFolder).Files
For Each file In sourceFiles
    fileSystemObject.CopyFile file.Path, destinationFolder & "\" & file.Name
Next

' Task 4: Get system information
Dim wmi, systemInfo
Set wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set systemInfo = wmi.ExecQuery("SELECT * FROM Win32_ComputerSystem")

Dim computer
For Each computer In systemInfo
    WScript.Echo "Computer Name: " & computer.Name
    WScript.Echo "Manufacturer: " & computer.Manufacturer
    WScript.Echo "Model: " & computer.Model
Next

' Task 5: Prompt for user input
Dim userInput
userInput = InputBox("Please enter your name:")
WScript.Echo "Hello, " & userInput & "!"

' Task 6: Perform mathematical calculations
Dim num1, num2, sum
num1 = 10
num2 = 5
sum = num1 + num2
WScript.Echo "Sum: " & sum

' Task 7: Display a message box
MsgBox "This is a message box!", vbInformation + vbOKOnly, "Message"

' Task 8: Sleep for a specified period
WScript.Sleep 3000  ' Sleep for 3 seconds

' Task 9: Terminate a running process
Dim processName
processName = "your_process.exe"

Dim process, processId
Set process = GetObject("winmgmts:").ExecQuery("SELECT * FROM Win32_Process WHERE Name='" & processName & "'")

For Each processId In process
    processId.Terminate()
Next

' Task 10: Perform regular expression matching
Dim regex, pattern, inputString, match
Set regex = New RegExp

pattern = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"
inputString = "Email: test@example.com"

regex.Pattern = pattern
regex.IgnoreCase = True
regex.Global = True

Set match = regex.Execute(inputString)

If match.Count > 0 Then
    WScript.Echo "Valid email found: " & match(0).Value
Else
    WScript.Echo "No valid email found."
End If