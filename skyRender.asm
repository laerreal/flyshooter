;push sky
skyRender:
push bp
mov bp,sp
pusha

  mov bx,[bp+4]
  mov cx,[bx]
  push word [bx+2]
  pop word [var_skyRender_speed]
  push word [bx+4]
  pop word [var_skyRender_length]
  add bx,6
  skyRender_loop1:
  push cx
    mov cx,[var_skyRender_length]
    skyRender_loop2:
    push cx
      push word [bx]
        mov ax,[bx+2]
        sub ax,cx
      push ax
        mov ax,20h
        sub ax,cx
      push ax
      call point
    pop cx
    loop skyRender_loop2

  mov ax,[var_skyRender_speed]
  add [bx+2],ax
  cmp word [bx+2],211
  jl skyRender_next1

  mov word [bx+2],-5
  call rnd
  xor dx,dx
  mov cx,320
  div cx
  mov word [bx],dx
  skyRender_next1:
  add bx,4
  pop cx
  loop skyRender_loop1

popa
mov sp,bp
pop bp
retn 2

var_skyRender_speed dw 0
var_skyRender_length dw 0