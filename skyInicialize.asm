;push sky
skyInicialize:
push bp
mov bp,sp
push bx

mov bx,[bp+4]
mov cx,[bx]
add bx,4

add bx,2
skyInicialize_loop1:
push cx

  call rnd
  xor dx,dx
  mov cx,340
  div cx
  mov [bx],dx
  add bx,2
  
  call rnd
  xor dx,dx
  mov cx,200
  div cx
  mov [bx],dx
  add bx,2
  
pop cx
loop skyInicialize_loop1

pop bx
mov sp,bp
pop bp
retn 2