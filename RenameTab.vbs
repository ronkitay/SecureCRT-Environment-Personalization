#$language = "VBScript"
#$interface = "1.0"
' RenameTab.vbs
' Opens a dialog box with an input field to specify the new name for this tab. 
' The current name is the default value for tab.
Sub Main()
    Set objTab = crt.GetScriptTab

    If objTab.Session.Connected <> True then
        Exit Sub
    end if
	
	Dim result

	result = crt.Dialog.Prompt("Enter new Tab Name", "Rename Tab", crt.GetScriptTab.Caption , False)
	
	crt.window.caption = result
    
End Sub
