clearScreen:
  push es
  push di

  mov ax,9000h
  mov es,ax
  xor di,di
  xor eax,eax
  mov cx,320*50
  rep stosd

  pop di
  pop es
  ret