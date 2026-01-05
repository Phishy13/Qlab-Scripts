tell application id "com.figure53.QLab.5" to tell front workspace
	
	display dialog "Galileo name:" default answer "" with title "Name" with icon 1 buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
	set name1 to text returned of result
	
	display dialog "First Patch Number:" default answer "" with title "Patch Number" with icon 1 buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
	set firstPatch to text returned of result
	
	display dialog "Last Patch Number:" default answer "" with title "Patch Number" with icon 1 buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
	set lastPatch to text returned of result
	
	display dialog "Number of Outputs:" default answer "" with title "Outputs" with icon 1 buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"
	set outputNum to text returned of result as integer
	
	--set outputNum to 16 as integer
	--set name1 to "MDS"
	set runner to 1 #unmute tracker
	set trailer to 0 #mute tracker
	set delayTime to 3 #can change to desired delay between mutes/unmutes. make 0 
	--set firstPatch to 1 #first galileo patch number
	--set lastPatch to 1 #last galileo patch number
	set patchNum to firstPatch
	
	
	
	if patchNum ≤ lastPatch then
		make type "network"
		set newCue to last item of (selected as list)
		set network patch number of newCue to patchNum
		set custom message of newCue to "/output/1-" & outputNum & "/mute 1.0"
		set q name of newCue to name1 & " " & (patchNum - firstPatch + 1) & " MUTE ALL"
		set continue mode of newCue to auto_continue
		
	end if
	
	repeat while patchNum ≤ lastPatch #can set to number of devices
		# make mute for previous output if it's not the first output
		if trailer > 0 then
			make type "network"
			set newCue to last item of (selected as list)
			set network patch number of newCue to patchNum
			set custom message of newCue to "/output/" & trailer & "/mute 1.0"
			set q name of newCue to name1 & " " & (patchNum - firstPatch + 1) & " - OUT " & trailer & ": MUTE"
			set continue mode of newCue to auto_continue
		end if
		
		#unmute the next output
		make type "network"
		set newCue to last item of (selected as list)
		set network patch number of newCue to patchNum
		set custom message of newCue to "/output/" & runner & "/mute 0"
		set q name of newCue to name1 & " " & (patchNum - firstPatch + 1) & " - OUT " & runner & ": UNMUTE"
		set continue mode of newCue to auto_continue
		set post wait of newCue to delayTime
		
		#if it's the last output, need to make a mute before we go to the next device
		if runner = outputNum then
			
			make type "network"
			set newCue to last item of (selected as list)
			set network patch number of newCue to patchNum
			set custom message of newCue to "/output/" & runner & "/mute 1.0"
			set q name of newCue to name1 & " " & (patchNum - firstPatch + 1) & " - OUT " & runner & ": MUTE"
			set continue mode of newCue to auto_continue
			
			make type "network"
			set newCue to last item of (selected as list)
			set network patch number of newCue to patchNum
			set custom message of newCue to "/output/1-" & outputNum & "/mute 0"
			set q name of newCue to name1 & " " & (patchNum - firstPatch + 1) & " UNMUTE ALL"
			set continue mode of newCue to do_not_continue
		end if
		
		#increment trackers
		set trailer to trailer + 1
		set runner to runner + 1
		
		#increase patch number if current is maxed
		if runner > outputNum then
			set runner to 1
			set trailer to 0
			set patchNum to patchNum + 1
		end if
		
	end repeat
end tell
