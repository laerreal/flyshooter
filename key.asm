key:
cli
cli
pusha
push ds

mov ax,138fh
mov ds,ax

in al,60h

cmp al,11h;139c5
jne key_next1
  mov byte [KEY_UP],1
  mov byte [KEY_DOWN],0
  jmp key_end
key_next1:

cmp al,91h
jne key_next2
  mov byte [KEY_UP],0
  jmp key_end
key_next2:

cmp al,1fh
jne key_next3
  mov byte [KEY_UP],0
  mov byte [KEY_DOWN],1
  jmp key_end
key_next3:

cmp al,9fh
jne key_next4
  mov byte [KEY_DOWN],0
  jmp key_end
key_next4:

cmp al,20h
jne key_next5
  mov byte [KEY_LEFT],0
  mov byte [KEY_RIGHT],1
  jmp key_end
key_next5:

cmp al,0a0h
jne key_next6
  mov byte [KEY_RIGHT],0
  jmp key_end
key_next6:

cmp al,1eh
jne key_next7
  mov byte [KEY_LEFT],1
  mov byte [KEY_RIGHT],0
  jmp key_end
key_next7:

cmp al,9eh
jne key_next8
  mov byte [KEY_LEFT],0
  jmp key_end
key_next8:

cmp al,39h
jne key_next9
  mov byte [KEY_FIRE1],1
  jmp key_end
key_next9:

cmp al,0b9h
jne key_next10
  mov byte [KEY_FIRE1],0
  jmp key_end
key_next10:

cmp al,1h
jne key_next11
  mov byte [KEY_ESC],1
  jmp key_end
key_next11:

cmp al,81h
jne key_next12
  mov byte [KEY_ESC],0
  jmp key_end
key_next12:

key_end:

in al,61h
push ax
or al,80h
out 61h,al
pop ax
out 61h,al

mov al,20h
out 20h,al

pop ds
popa
sti
iret
;jmp 0f000h:0e987h