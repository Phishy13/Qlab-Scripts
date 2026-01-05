tell application id "com.figure53.QLab.5" to tell front workspace
	
	-- Prompt user for an integer for Cue Number
	try
		set userInput to display dialog "MSC cue number:" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set cueNum to text returned of userInput
		
	on error
		display dialog "Please enter a valid integer." buttons {"OK"} default button 1
		return
	end try
	
	-- Create a new MIDI cue
	set newCue to make type "MIDI"
	set newCue to last item of (selected as list)
	
	-- Set cue properties
	tell newCue
		set q name of newCue to "LX Go Cue " & cueNum
		set q color to "yellow"
		set midi patch number to 2
		set message type to msc
		set deviceID to 1
		set command format to 1
		set q_number to cueNum as string
	end tell
end tell

