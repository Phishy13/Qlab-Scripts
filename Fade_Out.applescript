tell application id "com.figure53.QLab.5"
	display dialog "Fade Down Time:" default answer "3" with title "Fade Time" with icon 1 buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
	
	set fadeTime to text returned of result
	
	repeat with originalCue in (selected of front workspace as list)
		if q type of originalCue is "Audio" then
			make front workspace type "Fade"
			set newCue to last item of (selected of front workspace as list)
			set cue target of newCue to originalCue
			newCue setLevel row 0 column 0 db -120
			set duration of newCue to fadeTime
			set stop target when done of newCue to true
		end if
		if q type of originalCue is "Group" then
			make front workspace type "Fade"
			set newCue to last item of (selected of front workspace as list)
			set cue target of newCue to originalCue
			newCue setLevel row 0 column 0 db -120
			set duration of newCue to fadeTime
			set stop target when done of newCue to true
		end if
	end repeat
end tell
