# email_lister
Take a text file with emails and generate another txt with the unique domains or usernames

# Description
         Program: Email lister txt.vbs 
         Purpose: Take a text file with emails and generate another txt with the unique domains or usernames
           input: txt file with emails
          output: txt file with email domains unique ordered
         Created: 19-Junio-2020
         version: 1.0
          author: Edd (edcruces99@gmail.com)
         example: cscript.exe email_lister.vbs input.txt output.txt
                  input.txt
                           john@yahoo.com
                            edd@gmail.com
                         sophie@gmail.com
                          bob@hotmail.com
                   output.txt (with -d parameter)
                                gmail.com
                              hotmail.com
                                yahoo.com
                   output.txt (with -u parameter)
                                bob
                                edd
                                john
                                sophie
------------------------------------------------------------------------------------------------------
##     Updated: 2020-Jun-24
       -Comments were included for understanding

##     Updated: 2020-Jul-02
       -More comments were included and the BETA folder was added for previous version
       -Arguments added on command line (line 31)
