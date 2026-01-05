tell application id "com.figure53.QLab.5"
	tell overrides
		set timecode input enabled to timecode input enabled
		if timecode input enabled then
			set timecode input enabled to false
		else
			set timecode input enabled to true
		end if
	end tell
end tell

