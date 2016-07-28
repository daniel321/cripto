Set WshShell = WScript.CreateObject("WScript.Shell")
sLinkFile = WshShell.ExpandEnvironmentStrings(WScript.Arguments(0))

Set oLink = WshShell.CreateShortcut(sLinkFile)
oLink.TargetPath = WshShell.ExpandEnvironmentStrings(WScript.Arguments(1))
If WScript.Arguments.Count > 2 Then
	oLink.Arguments = WshShell.ExpandEnvironmentStrings(WScript.Arguments(2))
End If
oLink.Save
