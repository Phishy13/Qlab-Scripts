
tell application id "com.figure53.QLab.5" to tell front workspace
	
	--Trying to promt for db 
	
	--setting theval so it's happy
	set theval to 127
	
	-- Define the hash table
	set faderTable to {zero:{fader:"0", Midi:102}, neg_one:{fader:"-1", Midi:100}, neg_one_five:{fader:"-1.5", Midi:98}, neg_two:{fader:"-2", Midi:97}, neg_two_five:{fader:"-2.5", Midi:96}, neg_three:{fader:"-3", Midi:94}, neg_three_five:{fader:"-3.5", Midi:93}, neg_four:{fader:"-4", Midi:92}, neg_four_five:{fader:"-4.5", Midi:91}, neg_five:{fader:"-5", Midi:90}, neg_five_five:{fader:"-5.5", Midi:88}, neg_six:{fader:"-6", Midi:87}, neg_seven:{fader:"-7", Midi:84}, neg_eight:{fader:"-8", Midi:82}, neg_nine:{fader:"-9", Midi:79}, neg_ten:{fader:"-10", Midi:77}}
	
	-- Create a list of fader values for the dialog
	set faderList to {"0", "-1", "-1.5", "-2", "-2.5", "-3", "-3.5", "-4", "-4.5", "-5", "-5.5", "-6", "-7", "-8", "-9", "-10"}
	
	-- Prompt the user to select a fader value
	set selectedFader to choose from list faderList with prompt "Select a fader value:" without multiple selections allowed and empty selection allowed
	
	if selectedFader is false then
		display dialog "No selection made."
	else
		-- Find the corresponding MIDI value
		set db to item 2 of faderTable
		set correspondingPair to missing value
		
		repeat with values in faderTable
			if item 1 of values is db then
				set correspondingPair to values
				exit repeat
			end if
		end repeat
		
		set dbvalue to item 1 of correspondingPair
		set theval to item 2 of correspondingPair
		
		-- Display the selected MIDI value
		display dialog "The MIDI value for fader " & selectedFader & " is " & midiValue
		
		
		(*
--Set Hash Table (Fader)
	set zero to {fader:"0", Midi:102}
	set neg_one to {fader:"-1", Midi:100}
	set neg_one_five to {fader:"-1.5", Midi:98}
	set neg_two to {fader:"-2", Midi:97}
	set neg_two_five to {fader:"-2.5", Midi:96}
	set neg_three to {fader:"-3", Midi:94}
	set neg_three_five to {fader:"-3.5", Midi:93}
	set neg_four to {fader:"-4", Midi:92}
	set neg_four_five to {fader:"-4.5", Midi:91}
	set neg_five to {fader:"-5", Midi:90}
	set neg_five_five to {fader:"-5.5", Midi:88}
	set neg_six to {fader:"-6", Midi:87}
	set neg_seven to {fader:"-7", Midi:84}
	set neg_eight to {fader:"-8", Midi:82}
	set neg_nine to {fader:"-9", Midi:79}
	set neg_ten to {fader:"-10", Midi:77}
	
	--Set Hash Table Label
	set one to {ChName:"Diner OH", val:1}
	set two to {ChName:"OH L", val:2}
	set three to {ChName:"Hotel OH", val:3}
	set four to {ChName:"Bedroom OH", val:4}
	set five to {ChName:"Living Room OH", val:5}
	set six to {ChName:"Kitchen", val:6}
	set seven to {ChName:"Bathroom", val:7}
	set eight to {ChName:"DCA Diners", val:8}
	set nine to {ChName:"DCA Living Room", val:9}
	set ten to {ChName:"DCA Kitchens", val:10}
	set eleven to {ChName:"DCA Hotels", val:11}
	set twelve to {ChName:"Lampshade", val:12}
	set thirteen to {ChName:"Thermometer", val:13}
	set fourteen to {ChName:"Napkin", val:14}
	set fifteen to {ChName:"Couch", val:15}
	set sixteen to {ChName:"Caroline VOG", val:16}
	
	set dbs to choose from list {"0", "-1", "-1.5", "-2", "-2.5", "-3", "-3.5", "-4", "-4.5", "-5", "-5.5", "-6", "-7", "-8", "-9", "-10", "-inf"} with prompt "What db value?"
	
	set db_list to {zero, neg_one, neg_one_five, neg_two, neg_two_five, neg_three, neg_three_five, neg_four, neg_four_five, neg_five, neg_six, neg_seven, neg_eight, neg_nine, neg_ten}
	
	display dialog Midi of (item 2 of dbs)
	
	
	--create array
	--set myArray to {{"0", 102}, {"-1", 100}, {"-1.5", 98}, {"-2", 97}, {"-2.5", 96}, {"-3", 94}, {"-3.5", 93}, {"-4", 92}, {"-4.5", 91}, {"-5", 90}, {"-5.5", 88}, {"-6", 87}, {"-7", 84}, {"-8", 82}, {"-9", 79}, {"-10", 77}}
	-- -3:94, -1.5:98, 0:102
	--set dbvalues to {"-inf", "-6"} --, "-3", "0"}
	--set dbs to choose from list {"0", "-1", "-1.5", "-2", "-2.5", "-3", "-3.5", "-4", "-4.5", "-5", "-5.5", "-6", "-7", "-8", "-9", "-10", "-inf"} with prompt "What db value?"
	
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
		--set userMIDIVal to display dialog "MIDI Value?" default answer "" buttons {"Cancel", "Continue"} default button "Continue"
		--set theval to text returned of userMIDIVal
		
		--Create Midi cue
		set newCue to make type "MIDI"
		set newCue to last item of (selected as list)
		
		--set cue properties
		tell newCue
			set q name of newCue to "CL Midi Cue (Channel " & theControlNumber & " @ " & dbvalue & ")"
			set q color to "Orange"
			set midi patch number to 1
			set deviceID to 1
			set command to control_change
			set byte one to theControlNumber
			set byte two to theval
		end tell
*)
		
		
		--display dialog theval as string
		
	end if
end tell
