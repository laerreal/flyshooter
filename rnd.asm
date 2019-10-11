rnd:
push bx
push di
push es
  in ax,40h
  
  mov bx,[rndt1]
  xor ax,[bx]
  mov di,ax
  push [rndt2]
  pop es
  xor ax,[es:di]
  push word [rndt1]
  pop word [rndt2]
  mov [rndt1],ax
pop es
pop di
pop bx
ret

rndt1 dw 0
rndt2 dw 0
