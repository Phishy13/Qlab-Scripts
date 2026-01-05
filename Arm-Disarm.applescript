tell application id "com.figure53.QLab.5" to tell front workspace
	try
		set theSelection to (selected as list)
		repeat with eachCue in theSelection
			set armed of eachCue to not armed of eachCue
		end repeat
	end try
end tell
