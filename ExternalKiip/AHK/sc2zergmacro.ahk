;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Starcraft II Zerg Macros                  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
	SetTimer, MacroMode, 5000
return

MacroMode:
	if( macro_flag = true)
	{
		EnterMacroMode( )
		EnumerateHatcheryMacro( )
		VomitLarvaMacro( )
		ExitMacroMode( )
	}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Vomit Larvae Macro                        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The function

VomitLarvaMacro( )
{
	queen_count := CheckQueenCount( )
	
	Send , {6 Down}{6 up}
	while( queen_count != 0 )
	{
		Send , {BackSpace Down}{BackSpace Up}
		Send , {6 Down}{6 up}
		Send , {V Down}{V up}
		Click , 800 , 500
		queen_count := queen_count - 1
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Utility Functions                         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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