tell application id "com.figure53.QLab.5"
	tell overrides
		set msc input enabled to msc input enabled
		if msc input enabled then
			set msc input enabled to false
		else
			set msc input enabled to true
		end if
	end tell
end tell

