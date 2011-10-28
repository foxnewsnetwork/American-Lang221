;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SC II Autoclicker              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

go_flag := false
loop_finished := true


#Persistent

	
	

TestRoutine()
{
	Click 511 , 917
	Sleep , 1000
	Click 957, 351
}

SelfAttackRoutine( )
{
	MouseClickDrag , Left , 244, 229, 1467, 723, 20
	Sleep , 100
	MouseClickDrag , Left , 244, 229, 1467, 723, 20
	Sleep , 100
	MouseClickDrag , Left , 244, 229, 1467, 723, 20
	Sleep , 100
	Click 1853, 886
	Sleep, 150
	Click 998 , 407
}

ActualRoutine()
{
	; Find match
	Click 511 , 917
	Sleep , 80
	Click 511 , 917
	Sleep , 80
	Click 511 , 917
	Sleep , 1000*20
	
	; Attack my own shit
	SelfAttackRoutine( )
	Sleep , 1000*5
	
	; Quit after loss
	Click 957 , 351
	Sleep , 80
	Click 957 , 351
	Sleep , 80
	Click 957 , 351
	Sleep , 1000*20
	
	; Go back to find match page
	Click 472 , 951
	Sleep , 80
	Click 472 , 951
	Sleep , 80
	Click 472 , 951
	Sleep , 1000*20
	
	; Get rid of possible disturbances
	Click 1065 , 626
	Sleep , 80
	Click 1065 , 626
	Sleep , 80
	Click 1065 , 626
	Sleep , 1000*5
}

F12::
	if go_flag = false
		go_flag := true
	else
		go_flag := false
	
	while(go_flag := true)
	{
		ActualRoutine()
	}
return

F11::
	SelfAttackRoutine()
return

F10::
	Suspend
return