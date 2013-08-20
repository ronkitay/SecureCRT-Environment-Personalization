#$language = "VBScript"
#$interface = "1.0"
' SendEmail.vbs
' Opens a dialog box to specify the subject and recepient of an email and starts the "sendmail"
' utility to send that email.
' The user needs to put the actual message contents and finalize it win a line containing only a
' single period (.)
Sub Main()
	Dim toAddress
	toAddress = crt.Dialog.Prompt("TO?", "Send Email", "ron.kitay@rsa.com", False)
	
	Dim subject
	subject = crt.Dialog.Prompt("Subject?", "Send Email", "Logs", False)
	
	'Dim message
	'message = crt.Dialog.Prompt("Message", "Send Email", "Enter Message", False)
	
	crt.Screen.Send "sendmail -f $HOST@rsa.com -vt" & vbcr
	crt.Screen.Send "To:" & toAddress & vbcr
	crt.Screen.Send "Subject:" & subject & vbcr
	crt.Screen.Send vbcr
	'crt.Screen.Send message & vbcr & vbcr
	'crt.Screen.Send "." & vbcr
	'crt.Screen.Send vbcr
	   
End Sub
