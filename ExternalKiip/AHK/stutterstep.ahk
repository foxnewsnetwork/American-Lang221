;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Stutter Step Marine Micro        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stim_flag := false


#Persistent
SetTimer, RefreshStimFlag, 10000
return


~Alt & RButton::
	MouseGetPos target_x, target_y
	StutterStep( target_x, target_y, 1)
return

~t::
	stim_flag := true
return

F11::
	GetKeyState rstate, shift
	asdf := 0
	if( rstate = "U")
		asdf := 10
	MsgBox , %target_x% and %target_y% and %rstate% and %asdf%
return

F12::
	Suspend
return

RefreshStimFlag:
	stim_flag := false
return

StutterStep( target_x, target_y, unit_type)
{
	cooldown := 5000
	startup := 500
	if( unit_type = 1 )
	{
		cooldown := 195
		startup := 195 
	}
	if( unit_type = 2 )
	{
		cooldown := 100
		startup := 85
	}
	
	counter := 0
	while(counter < 50)
	{
		GetKeyState , state, alt
		if (state = "U")
			break
		
		counter := counter + 1
		Send , a
		Click %target_x%, %target_y%
		
		GetKeyState , state, alt
		if (state = "U")
			break
		
		Sleep %startup%
		
		GetKeyState , state, alt
		if (state = "U")
			break
		
		Click Right , %target_x%, %target_y%
		
		GetKeyState , state, alt
		if (state = "U")
			break
		
		Sleep %cooldown%
		
		GetKeyState , state, alt
		if state = "U"
			break
		
	}
}