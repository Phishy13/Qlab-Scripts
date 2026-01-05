(*
tell application id "com.figure53.QLab.5"
	set cueInfo to {}
	
	tell front workspace
		set activeCues to active cues
		
		if (count of activeCues) is 0 then
			set NoCueRunning to "No cues are currently active."
			display dialog NoCueRunning with icon caution
			--display dialog "No cues are currently active."
			
		else
			repeat with eachCue in activeCues
				set cueName to q name of eachCue
				set cueID to uniqueID of eachCue
				
				-- Calculate Elapsed time
				set elapsedTimer to ((round (action elapsed of eachCue) * 10) / 10)
				set elapsedHours to text -2 thru -1 of ("00" & (elapsedTimer div 3600))
				set remainderSeconds to (elapsedTimer mod 3600)
				set elapsedMinutes to text -2 thru -1 of ("00" & (remainderSeconds div 60))
				set elapsedRemainderSeconds to text -4 thru -1 of ("0000" & (remainderSeconds mod 60))
				set elapsedSeconds to (elapsedHours & ":" & elapsedMinutes & ":" & elapsedRemainderSeconds)
				
				-- Calculate Remaining time
				set remainingTimer to ((round (((duration of eachCue) - (action elapsed of eachCue)) * 10)) / 10)
				set remainingHours to text -2 thru -1 of ("00" & (remainingTimer div 3600))
				set remainingRemainderSeconds to (remainingTimer mod 3600)
				set remainingMinutes to text -2 thru -1 of ("00" & (remainingRemainderSeconds div 60))
				set remainingRemainderSeconds to text -4 thru -1 of ("0000" & (remainingRemainderSeconds mod 60))
				set remainingTime to (remainingHours & ":" & remainingMinutes & ":" & remainingRemainderSeconds)
				
				-- Create a dictionary for each cue
				set end of cueInfo to {q number:cueName, uniqueID:cueID, elapsed:elapsedSeconds, remaining:remainingTime}
			end repeat
			
			repeat with info in cueInfo
				set nameString to q number of info
				set idString to uniqueID of info
				set elapsedString to elapsed of info
				set remainingString to remaining of info
				
				display dialog "Cue Name: " & nameString & ", Cue ID: " & idString & ", Elapsed Time: " & elapsedString & ", Remaining Time: " & remainingString
			end repeat
			
			return cueInfo
		end if
	end tell
end tell
*)

set refreshInterval to 5 -- seconds

tell application id "com.figure53.QLab.5"
	
	repeat
		set cueInfo to {}
		tell front workspace
			set activeCues to active cues
			
			if (count of activeCues) is 0 then
				display dialog "No cues are currently active."
				exit repeat
			else
				repeat with eachCue in activeCues
					set cueName to q name of eachCue
					set cueID to uniqueID of eachCue
					
					-- Calculate elapsed time
					set elapsedTimer to ((round (action elapsed of eachCue) * 10) / 10)
					set elapsedHours to text -2 thru -1 of ("00" & (elapsedTimer div 3600))
					set remainderSeconds to (elapsedTimer mod 3600)
					set elapsedMinutes to text -2 thru -1 of ("00" & (remainderSeconds div 60))
					set elapsedRemainderSeconds to text -4 thru -1 of ("0000" & (remainderSeconds mod 60))
					set elapsedSeconds to (elapsedHours & ":" & elapsedMinutes & ":" & elapsedRemainderSeconds)
					
					-- Create a dictionary for each cue
					set end of cueInfo to {q number:cueName, uniqueID:cueID, elapsed:elapsedSeconds}
				end repeat
				
				-- Prepare display output
				set displayText to ""
				repeat with info in cueInfo
					set displayText to displayText & "Cue Name: " & q number of info & ", Cue ID: " & uniqueID of info & ", Elapsed Time: " & elapsed of info & return
				end repeat
				
				-- Display the updated dialog
				display dialog displayText giving up after refreshInterval
			end if
		end tell
		
		delay refreshInterval -- Wait before refreshing
	end repeat
end tell

