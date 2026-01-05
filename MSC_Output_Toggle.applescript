tell application id "com.figure53.QLab.5"
	tell overrides
		set msc output enabled to msc output enabled
		if msc output enabled then
			set msc output enabled to false
		else
			set msc output enabled to true
		end if
	end tell
end tell

