;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Starcraft Unit Counter              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Here I write a sequence of functions and protocols which
; will hopefully count the number of units I have selected
lolcat := 0
c_x := 688
c_y := 888

F12::
	Suspend
return

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



Temp()
{
	global
	MouseMove , c_x, c_y
	c_x := c_x + 58
}
F10::
	Temp()
return

F11::
	my_count := CalculateUnitCount( )
	MsgBox , %my_count%
return