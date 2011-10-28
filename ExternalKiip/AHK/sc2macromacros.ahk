;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Starcraft II SCV Build Macro              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Assumes all of the following:
; 5 -> all command centers
; 6 -> all barracks
; 7 -> all factories
; 8 -> all starports
; 0 -> nothing hotkeyed

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Variable Declaraion                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Macro mode flags
m_worker_flag := false


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Actual Macro Declaration                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Timer events section
#Persistent
	SetTimer, SpamAPM , 5000
return

SpamAPM:
	EnterMacroMode( )
	ccc := 0
	while( ccc < 5 )
	{
		MouseClickDrag , Left , 244, 229, 1467, 723, 0
		ccc := ccc + 1
	}
	ExitMacroMode( )
return

MacroMode:
	if( m_worker_flag = true )
	{
		EnterMacroMode( )
		BuildWorkers( )
		ExitMacroMode( )
	}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Macro UI Processes                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Numpad0::
	if(m_worker_flag = false)
		m_worker_flag := true
	else
		m_worker_flag := false
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Function Section                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Function checks your CCs and builds workers if they aren't already 
BuildWorkers( )
{
	; First, select the CCs
	SendInput , {5}
	
	; We check how many CCs we have
	cc_count := CalculateUnitCount( )
	
	;Next we build an SCV on any that doesn't have an SCV building
	counter := 0
	while( counter < cc_count )
	{
		free_flag := CheckFreeBuilding( counter )
		if( free_flag = true )
		{
			SendInput , {S}
		}
		counter := counter + 1
	}
}

; If you call this, you have to call the next function
EnterMacroMode( )
{
	; Turning on blocking
	BlockInput , On
	
	; First we capture the screen area we are current on
	Send , {RCtrl down}{F2 down}
	Send , {RCtrl up}{F2 up}
	
	; We then capture the current unit group to 0
	Send , {RCtrl down}{0 down}
	Send , {RCtrl up}{0 up}
}

ExitMacroMode( )
{
	; We refocus on where we were
	Send , {Alt down}{F2 down}
	Send , {Alt up}{F2 up}
	
	; we reselect our group
	Send , {0 down}
	Send , {0 up}
	
	; Turning off blocking
	BlockInput , Off
}

CheckFreeBuilding( counter )
{
	b_x := 669
	b_y := 937
	
	dx := 58
	dy := 58
	
	nx := Mod( counter,8 )
	ny := Floor( counter/8 )
	
	x := b_x + nx*dx
	y := b_y + ny*dy
	
	PixelGetColor , OutputColor, x, y
	
	if(OutputColor = 0xFEFEFE)
		return false
	return true
}

CalculateUnitCount( )
{
	b_x := 688
	b_y := 888
	
	dx := 58
	dy := 58
	
	count_x := 0
	count_y := 0
	
	while( count_y < 3 )
	{
		while( count_x < 8 )
		{
			PixelGetColor , OutputColor, b_x, b_y
			if( OutputColor = 0x000000 )
			{
				return count_y * 8 + count_x
			}
			count_x := count_x + 1
			b_x := b_x + dx
		}
		count_x := 0
		b_x := 688
		count_y := count_y + 1
		b_y := b_y + dy
	}
	return 24
}