tell application id "com.figure53.QLab.5" to tell front workspace
	-- get the list of all cue lists in the workspace
	set mylists to (every cue whose (q type is "Cue List"))
	
	-- prompt user for cue list number
	set listCount to (count mylists)
	set chosenIndex to 3
	
	-- convert input to integer
	set chosenIndex to chosenIndex as integer
	
	-- validate the index is within range
	if chosenIndex is less than 1 or chosenIndex is greater than listCount then
		display dialog "Invalid Cue List Number" buttons {"OK"} default button "OK"
		return
	end if
	
	-- set the chosen cue list based on the index
	set chosenList to item chosenIndex of mylists
	set current cue list to chosenList
	
	-- find the first cue in the chosen cue list and make it selected
	--set firstCue to second cue whose parent list is chosenList
	--set selected to firstCue
end tell

