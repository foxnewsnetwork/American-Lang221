;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Line-CLicker                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Given two points, and an integer n, clicks an evenly
; spaced n times between the two points

Line_Clicker(x_1, y_1, x_2, y_2, n)
{
	base_x := x_1
	base_y := y_1
	max_n := n
	
	x_diff := x_2 - x_1
	y_diff := y_2 - y_1
	
	c_diff2 := x_diff*x_diff + y_diff*y_diff
	c_diff := Sqrt(c_diff2)
	dc := c_diff / n
	
	dxf := (x_diff * dc) / Sqrt(x_diff*x_diff + y_diff*x_diff)
	dyf := (y_diff * dc) / Sqrt(x_diff*x_diff + y_diff*x_diff)
	
	dx := floor(dxf)
	dy := floor(dyf)
	counter := 0
	while(counter < max_n)
	{
		Click Right %base_x%, %base_y%
		base_x := base_x + dx
		base_y := base_y + dy
		counter := counter + 1
	}
}

Numpad0::
	Line_Clicker(23, 412, 654, 500, 24)
return