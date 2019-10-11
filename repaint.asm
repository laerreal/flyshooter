repaint:
  push es
  push ds
  push di
  push si

  mov ax,9000h
  mov ds,ax
  xor si,si

  mov ax,0a000h
  mov es,ax
  xor di,di

  mov cx,320*50
  rep movsd

  pop si
  pop di
  pop ds
  pop es
  ret
