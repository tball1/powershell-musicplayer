#INSTALL TUTORIAL:
#1 Open a powershell an type "$profile"
#2 Then try an open that file path it shows you in notepad
#3 If the file doesnt exist you can just create it
#4 Afterwards just copy an paste this code into that file an save
#5 Re-open powershell
#Got an Error? read the note below

#NOTE: you might have too set your ExecutionPolicy to "Unrestricted"

#1 Open powershell as an admin an run "Set-ExecutionPolicy Unrestricted"
#2 It will ask if you're sure just say yes
#3 re-open powershell again

#USAGE:
	#NOTE: This searches your users music folder
	#only put the file name an extension

	#songControl [-Mode play/pause/resume] [-Song song]


Add-Type -AssemblyName presentationCore

$media = New-Object system.windows.media.mediaplayer

function songControl{
	param($Song,$Mode,$Search)

	$cpath = ($home+"\Music\"+$Song)
	$mpath = ($home+"\Music")

	if ($Mode -eq "play"){
        $media.open($cpath)
		Start-Sleep -Seconds 2
        $media.Play()
	}

	if ($Mode -eq "pause"){
		$media.Pause()
	}

	if ($Mode -eq "resume"){
		$media.Play()
	}

	if ($Mode -eq "search"){
		ls $mpath | Where-Object {$_.Name.Contains($Search)}
	}

	if ($Mode -eq "list-songs"){
		ls $mpath | Select-Object Name
	}


}