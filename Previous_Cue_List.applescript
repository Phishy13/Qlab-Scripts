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
	
	-- get the previous cue list (wrap around if at the beginning of the list)
	if currentIndex > 1 then
		set previousCueList to item (currentIndex - 1) of mylists
	else
		set previousCueList to last item of mylists -- wrap to last if at the beginning
	end if
	
	-- set the previous cue list as the current cue list
	set current cue list to previousCueList
	
	-- find the first cue in the previous cue list and make it selected
	--set firstCue to second cue whose parent list is previousCueList
	--set selected to firstCue
end tell

