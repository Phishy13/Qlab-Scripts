tell application id "com.figure53.QLab.5" to tell front workspace
	-- get the list of all cue lists in the workspace
	set mylists to (every cue whose (q type is "Cue List"))
	
	-- find the currently selected cue list
	set currentCueList to current cue list
	
	-- initialize index for current cue list
	set currentIndex to 0
	
	-- find the index of the current cue list by comparing names
	repeat with i from 1 to (count mylists)
		if currentCueList is item i of mylists then
			set currentIndex to i
			exit repeat
		end if
	end repeat
	
	-- get the next cue list (wrap around if at the end of the list)
	if currentIndex < (count mylists) then
		set nextCueList to item (currentIndex + 1) of mylists
	else
		set nextCueList to first item of mylists -- wrap to first if at the end
	end if
	
	-- set the next cue list as the current cue list
	set current cue list to nextCueList
	
	-- find the first cue in the next cue list and make it selected
	--set firstCue to second cue whose parent list is nextCueList
	--set selected to firstCue
end tell

