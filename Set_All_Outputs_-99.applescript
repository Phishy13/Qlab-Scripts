tell application id "com.figure53.QLab.5"
	tell front workspace
		set userLevel to -999 -- Change this to whatever adjustment you want
		
		-- Set a fixed number of rows and columns if QLab doesn’t provide them dynamically
		set totalRows to 1 -- Usually, this would be 1 if you only have one row of outputs
		set totalColumns to 32 -- The number of audio outputs (e.g., 16 channels)
		
		repeat with eachCue in (selected as list)
			try
				-- Ensure that eachCue is treated as a valid cue object, not text
				set currentCue to eachCue -- This helps clarify the type
				
				-- Loop through the fixed number of rows and columns (outputs)
				repeat with rowIndex from 0 to (totalRows - 1)
					repeat with colIndex from 1 to (totalColumns - 1)
						-- Get the current level for this row and column
						set currentLevel to getLevel of currentCue row rowIndex column colIndex
						-- Calculate new level
						set newLevel to currentLevel + userLevel
						-- Set the new level
						setLevel of currentCue row rowIndex column colIndex db newLevel
					end repeat
				end repeat
				
				-- Optional: Display the first level for debugging
				--display dialog "Cue " & (q number of currentCue) & ": Current level (Row 0, Col 0) is " & currentLevel
				
			on error errMsg
				-- Optional: Error handling for debugging
				display dialog "Error: " & errMsg
			end try
		end repeat
	end tell
end tell

