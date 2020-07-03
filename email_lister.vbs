'-----------------------------------------------------------------------------------------------------------------
'         Program: Email lister txt.vbs 
'         Purpose: Take a text file with emails and generate another txt with the unique domains or usernames
'           input: txt file with emails
'          output: txt file with email domains unique ordered
'         Created: 19-Junio-2020
'         version: 1.0
'          author: Edd (edcruces99@gmail.com)
'         example: cscript.exe email_lister.vbs input.txt output.txt
'                  input.txt
'                           john@yahoo.com
'                            edd@gmail.com
'                         sophie@gmail.com
'                          bob@hotmail.com
'                   output.txt (with -d parameter)
'                             gmail.com
'                           hotmail.com
'                             yahoo.com
'                   output.txt (with -u parameter)
'                             bob
'                             edd
'                            john
'                          sophie
'------------------------------------------------------------------------------------------------------
'        Updated: 2020-Jun-24
'       -Comments were included for understanding
'
'        Updated: 2020-Jul-02
'       -More comments were included and the BETA folder was added for previous version
'       -Arguments added on command line (line 31)
'------------------------------------------------------------------------------------------------------

Dim domain,username,myArray
Set domain = CreateObject("System.Collections.ArrayList")
Set username = CreateObject("System.Collections.ArrayList")
Set myArray = CreateObject("System.Collections.ArrayList")

scriptDir = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

'Count Parameters
strTotalArgs = CInt(WScript.Arguments.Count)

strArg0 = WScript.Arguments.Item(0) 'input
strArg1 = WScript.Arguments.Item(1) 'output
strArg2 = "-d" 'Si no tiene parametro, por default -d

'If 3rd Parameter exists
If CInt(strTotalArgs) = 3 Then
   strArg2 = WScript.Arguments.Item(2) 'parameters
End If

'MsgBox strArg0
'MsgBox strArg1
'MsgBox strArg2

textFilePathIn = scriptDir & "\" & Trim(strArg0) 'input
textFilePathOut = scriptDir & "\" & Trim(strArg1) 'output
txtParam = Trim(strArg2) 'parameter -d:domain -u:user

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.opentextfile(textFilePathIn)

'Read the INPUT file line x line

Do Until objTextFile.AtEndOfStream
   txtLine=objTextFile.ReadLine
   
   'Split the string by @
   arr=Split(txtLine,"@")
   
   'If the username does not exist in the list, append it
   If Not username.contains(arr(0)) Then 
      username.Add arr(0)
   End If
   
   'If the domain does not exist in the list, append it
   If Not domain.contains(arr(1)) Then 
      domain.Add arr(1)
   End If   
Loop

objTextFile.Close

'Sort list
domain.sort
username.sort

'Write array
If txtParam = "-d" Then
   write_array domain
End If

If txtParam = "-u" Then
   write_array username
End If
'------------------------------------------------------------
Function write_array(myArray)

  Set fs = CreateObject("Scripting.FileSystemObject")
  Set a = fs.CreateTextFile(textFilePathOut, True)
  
   For i = 0 To CInt(myArray.Count) - 1
       a.WriteLine myArray(i)
   Next
   a.Close
  
End Function
'------------------------------------------------------------
