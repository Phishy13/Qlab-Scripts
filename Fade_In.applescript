tell application id "com.figure53.QLab.5" to tell front workspace
	display dialog "Fade Up Time:" default answer "3" with title "Fade Time" with icon 1 buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
	
	set fadeTime to text returned of result
	
	repeat with originalCue in last item of (selected of front workspace as list)
		if q type of originalCue is "Audio" then
			set originalCueID to uniqueID of originalCue
			set originalCueLevel to originalCue getLevel row 0 column 0
			originalCue setLevel row 0 column 0 db -60
			make front workspace type "Fade"
			set newCue to last item of (selected of front workspace as list)
			set cue target of newCue to originalCue
			newCue setLevel row 0 column 0 db originalCueLevel
			set duration of newCue to fadeTime
			set newCueID to uniqueID of newCue
			make front workspace type "group"
			set groupCue to last item of (selected of front workspace as list)
			move cue id originalCueID of parent of originalCue to end of groupCue
			move cue id newCueID of parent of newCue to end of groupCue
			set q name of groupCue to (q name of originalCue) & " with fade in"
			
		end if
	end repeat
end tell
