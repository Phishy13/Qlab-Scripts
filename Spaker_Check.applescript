tell application id "com.figure53.QLab.5" to tell front workspace
	-- get list of all cuelists in workspace
	set mylists to q name of (every cue whose (q type is "Cue List"))
	-- prompt the user to make a choice of cue list name
	--set chosenListName to choose from list mylists with prompt "Choose Cue List " default items {first item of mylists} with title "Change current cue list"
	-- convert the name into cue list object
	set chosenList to (first cue list whose q name is "Spaker Check")
	-- set the current cue list
	set current cue list to chosenList
	-- find the first cue in the list and make it selected
	set firstCue to second cue whose parent list is chosenList
	set selected to firstCue
end tell
