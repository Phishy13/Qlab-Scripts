tell application id "com.figure53.QLab.5"
	tell overrides
		set timecode output enabled to timecode output enabled
		if timecode output enabled then
			set timecode output enabled to false
		else
			set timecode output enabled to true
		end if
	end tell
end tell

