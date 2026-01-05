tell application id "com.figure53.QLab.5"
	tell overrides
		set midi output enabled to midi output enabled
		if midi output enabled then
			set midi output enabled to false
		else
			set midi output enabled to true
		end if
	end tell
end tell
