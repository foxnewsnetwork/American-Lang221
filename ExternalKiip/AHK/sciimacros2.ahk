;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Marine Macro Powerhouse                 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Version 2
click_1_x := 0
click_1_y := 0
click_2_x := 0
click_2_y := 0

unit_count := 0

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

~LButton::
	click_2_x := click_1_x
	click_2_y := click_1_y
	MouseGetPos click_1_x, click_1_y
	
return

~Alt & 1::

	unit_count := CalculateUnitCount( )
	LineClicker(click_1_x, click_1_y, click_2_x, click_2_y, unit_count, 1)

return
	
F12::
	Suspend
return

=::
	MsgBox , %click_2_x% and %click_2_y% versus %click_1_x% and %click_1_y%
return

RefreshStimFlag:
	stim_flag := false
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Private Function Section               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

; Clicks on a given unit on the board
BoardClicker( x_count, y_count )
{
	SetMouseDelay , -1
	x_base := 689
	y_base := 915
	dx := 58
	dy := 58
	
	x := x_base + (x_count) * dx
	y := y_base + (y_count) * dy
	SendInput , {Click %x% , %y%}
}

; Given two points, and an integer n, clicks an evenly
; spaced n times between the two points
LineClicker(x_1, y_1, x_2, y_2, n, ctrl_group)
{
	SetMouseDelay , -1
	base_x := x_1
	base_y := y_1
	if( n = 0 )
		return
	if( n > 24 )
	{
		max_n := 24
	}
	else
	{
		max_n := n
	}
	
	x_diff := x_2 - x_1
	y_diff := y_2 - y_1
	
	c_diff2 := x_diff*x_diff + y_diff*y_diff
	c_diff := Sqrt(c_diff2)
	dc := c_diff / n
	
	dxf := (x_diff * dc) / Sqrt(x_diff*x_diff + y_diff*y_diff)
	dyf := (y_diff * dc) / Sqrt(x_diff*x_diff + y_diff*y_diff)
	
	dx := floor(dxf)
	dy := floor(dyf)
	
	counter := 0
	while(counter < max_n)
	{
		; Clicks the unit board
		cx := mod(counter,8)
		cy := floor(counter/8)
		BoardClicker(cx, cy)

		; Clicks the screen
		SendInput , {a}
		SendInput , {Click, %base_x%, %base_y% }
		base_x := base_x + dx
		base_y := base_y + dy
		counter := counter + 1
		
		; reselects control group
		SendInput , {%ctrl_group%}
	}
}

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