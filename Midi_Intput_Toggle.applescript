tell application id "com.figure53.QLab.5"
	tell overrides
		set midi input enabled to midi input enabled
		if midi input enabled then
			set midi input enabled to false
		else
			set midi input enabled to true
		end if
	end tell
end tell
