#$language = "VBScript"
#$interface = "1.0"
' EnvironmentPersonalizer.vbs
' Opens a BASH shell, sets the PROMPT (PS1) and defines a few usefull aliases and functions
Sub Main()
    Set objTab = crt.GetScriptTab

    If objTab.Session.Connected <> True then
       Exit Sub
    end if
    
    ' Ensure that we don't "miss" data coming from the remote by setting
    ' our Screen's Synchronous flag to true.
    crt.Screen.Synchronous = true

    crt.Screen.WaitForString("$")
    
	' Common    
    crt.Screen.Send "bash" & vbcr
	crt.Screen.Send "export PS1=""\u@\h [\A] \w>""" & vbcr
	crt.Screen.Send "clear" & vbcr
	crt.Screen.Send "alias h='history'" & vbcr
	crt.Screen.Send "alias g='grep --color '" & vbcr
	crt.Screen.Send "alias gi='grep -i --color '" & vbcr
	crt.Screen.Send "alias ll='ls -lart'" & vbcr
	crt.Screen.Send "alias cdlog='cd ~/logs'" & vbcr	
	crt.Screen.Send "alias logs='log; ll -rt'" & vbcr
	crt.Screen.Send "alias mjps='jps -mlv | grep -v sun.tools.jps.Jps | grep --color ""^[0-9]*""'" & vbcr
	crt.Screen.Send "alias psu='ps -fu $USER'" & vbcr
	crt.Screen.Send "function fnf() { find . -type f | grep --color -i $1; }" & vbcr	
	
	' Modify the name of the tab	
	crt.window.caption = crt.Session.Config.GetOption("Username") & "@" & crt.Session.Config.GetOption("hostname") 
	
	crt.Screen.Synchronous = false
End Sub
