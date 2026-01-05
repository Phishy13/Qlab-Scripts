tell application id "com.figure53.QLab.5"
	tell front workspace
		-- Get the list of all cue lists in the workspace
		set mylists to (every cue whose q type is "Cue List")
		
		-- Prompt user for cue list index (you can adjust this as needed)
		set listCount to (count mylists)
		set chosenIndex to 1 -- Replace with dynamic input if necessary
		
		-- Set the chosen cue list based on the index
		set chosenList to item chosenIndex of mylists
		
		-- Disarm the chosen cue list
		set armed of chosenList to not armed of chosenList
		
	end tell
end tell

