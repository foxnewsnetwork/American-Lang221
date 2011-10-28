;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Starcraft II Micro Macros        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
macro_state := 0
base_x := 692
base_y := 914
max_x := 1095
max_y := 1031
dy := 40
dx := 50

click_counter := 0
click_1_x := 0
click_1_y := 0
click_2_x := 0
click_2_y := 0

unit_x_step := 0
unit_y_step := 0
x_pos := 0
y_pos := 0

black_color := 0x000000
end_flag := false
group_count_x := 1
group_count_y := 1
total_count := 1
F10::
	Suspend
return

F11::
	my_color := Sample_Block(1234, 12)
	MsgBox , , %my_color%
return

Test_Function()
{
	global
	Click %base_x% %base_y%
}

; Here I will use the tilde (grave) key for macro usage
~LAlt & 1::
if(macro_state = 0)
{
	macro_state := 1
	; Engage in a macro
	cx := 0
	cy := 0
	end_flag := false
	while( cy < 3 && end_flag = false)
	{
		while( cx < 8 && end_flag = false)
		{
			MouseX := base_x + cx*dx
			MouseY := base_y + cy*dy
			my_color := Sample_Block(MouseX, MouseY)
			if(my_color = black_color)
			{
				end_flag := true
				break
			}
			Click_Board(cx, cy)
			
			Click_Screen(cx, cy)
			Send , 1
			cx := cx + 1
		}
		if(my_color = black_color)
		{
			end_flag := true
			break
		}
		cx := 0
		cy := cy + 1
	}
	macro_state := 0
}
return

=::
	count_x := 0
	count_y := 0
	group_count_x := 1
	group_count_y := 1
	while( cy < 3 && end_flag = false)
	{
		while( cx < 8 && end_flag = false)
		{
			MouseX := base_x + cx*dx
			MouseY := base_y + cy*dy
			my_color := Sample_Block(MouseX, MouseY)
			if(my_color = black_color)
			{
				end_flag := true
				break
			}
			group_count_x := group_count_x + 1
			count_x := count_x + 1
		}
		if(my_color = black_color)
		{
			end_flag := true
			break
		}
		count_x := 0
		count_y := count_y + 1
		group_count_y := group_count_y + 1
	}
	total_count := group_count_y * group_count_x
	
return

; xval goes from 0->7, yval goes from 0-2
Click_Board( xval, yval )
{
	global
	x_pos := base_x + xval*dx
	y_pos := base_y + yval*dy
	Click %x_pos%, %y_pos%
}

Sample_Block( coord_x, coord_y)
{
	count_x := 0
	count_y := 0
	b_x := coord_x - 3
	b_y := coord_y - 3
	color_base := 0x000000
	while( count_y < 3 )
	{
		while( count_x < 3 )
		{
			PixelGetColor color_sample, b_x, b_y
			color_base := color_base + color_sample
			count_x := count_x + 1
			
		}
		count_x := 0
		count_y := count_y + 1
	}
	return color_base
}

Click_Screen( xval, yval )
{
	global

	xpos := click_1_x - xval*unit_x_step
	ypos := click_1_y - yval*unit_y_step
	
	Click Right %xpos%, %ypos%

}

~LButton::
	click_2_x := click_1_x
	click_2_y := click_1_y
	MouseGetPos click_1_x, click_1_y
	unit_x_step := (click_1_x - click_2_x) / 10
	unit_y_step := (click_1_y - click_2_y) / 10
return
	