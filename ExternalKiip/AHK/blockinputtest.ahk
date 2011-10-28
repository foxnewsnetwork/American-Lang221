;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Block input Test                ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
	SetTimer , Reenable, 5000
return

Reenable:
	BlockInput Off
return

F12::
	BlockInput On
return