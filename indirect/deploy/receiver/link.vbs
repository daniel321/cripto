Set WshShell = WScript.CreateObject("WScript.Shell")
sLinkFile = WshShell.ExpandEnvironmentStrings(WScript.Arguments(0))
Set oLink = WshShell.CreateShortcut(sLinkFile)
oLink.TargetPath = WshShell.ExpandEnvironmentStrings(WScript.Arguments(1))
oLink.Save
