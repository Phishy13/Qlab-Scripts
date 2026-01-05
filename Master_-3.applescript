tell application id "com.figure53.QLab.5"
	tell front workspace
		set userLevel to -3
		repeat with eachCue in (selected as list)
			try
				-- Assuming eachCue has a method 'getLevel' and 'setLevel'
				set currentLevel to getLevel of eachCue row 0 column 0
				set newLevel to currentLevel + userLevel
				setLevel of eachCue row 0 column 0 db newLevel
			end try
		end repeat
	end tell
end tell

