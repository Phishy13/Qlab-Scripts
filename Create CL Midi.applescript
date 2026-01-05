tell application id "com.figure53.QLab.5" to tell front workspace
	
	--Trying to promt for db 
	
	--setting theval so it's happy
	set theval to 127
	
	--create array
	set myArray to {{"0", 102}, {"-1", 100}, {"-1.5", 98}, {"-2", 97}, {"-2.5", 96}, {"-3", 94}, {"-3.5", 93}, {"-4", 92}, {"-4.5", 91}, {"-5", 90}, {"-5.5", 88}, {"-6", 87}, {"-7", 84}, {"-8", 82}, {"-9", 79}, {"-10", 77}}
	set dbs to choose from list {"0", "-1", "-1.5", "-2", "-2.5", "-3", "-3.5", "-4", "-4.5", "-5", "-5.5", "-6", "-7", "-8", "-9", "-10", "-inf"} with prompt "What db value?"
	
	if dbs is false then
		display dialog "No selection made."
	else
		set db to item 1 of dbs
		set correspondingPair to missing value
		
		repeat with values in myArray
			if item 1 of values is db then
				set correspondingPair to values
				exit repeat
			end if
		end repeat
		
		set dbvalue to item 1 of correspondingPair
		set theval to item 2 of correspondingPair
		
		--testing displays
		--display dialog midival as string
		--display dialog dbvalue as string
		--display dialog "You selected " & dbvalue & " with a count of " & midival as string
		
		--set user values
		set userMIDIControlNumber to display dialog "Control Number?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		set theControlNumber to text returned of userMIDIControlNumber
		
		--Create Midi cue
		set newCue to make type "MIDI"
		set newCue to last item of (selected as list)
		
		--Set Cue Properties
		tell newCue
			set q name of newCue to "CL Midi Cue (Channel " & theControlNumber & " @ " & dbvalue & ")"
			set q color to "Orange"
			set midi patch number to 1
			set deviceID to 1
			set command to control_change
			set byte one to theControlNumber
			set byte two to theval
		end tell
	end if
end tell
