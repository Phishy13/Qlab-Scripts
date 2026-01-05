set newDate to "0522020025" -- Change this to your desired date and time
set pswrd to "masque'" -- Replace with your actual password
set terminalCommand to "sudo date -u " & quoted form of newDate

tell application "Terminal"
	activate
	do script terminalCommand
	delay 1 -- Wait for the Terminal to prompt for the password
	tell application "System Events"
		keystroke pswrd
		keystroke return
	end tell
end tell

