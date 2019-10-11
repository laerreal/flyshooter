; push 1 - адрес
; push 2 - адрес
collision:
push bp
mov bp,sp
push bx

  mov bx,[bp+4]
  mov ax,[bx+12]

  mov bx,[bp+6]
  cmp ax,[bx+12]
  pushf
  xor ax,ax
  popf
  je collision_end


  mov ax,[bx]
    mov [_xp],ax
    mov [_xm],ax
  mov ax,[bx+2]
    mov [_yp],ax
    mov [_ym],ax
  mov bx,[bx+10]
  mov ax,[bx]

  shl ax,2
  add ax,[bx]
  shl ax,1
  add ax,2
  add bx,ax

  mov ax,[bx]
  add [_xp],ax
  sub [_xm],ax
  mov ax,[bx+2]
  add [_yp],ax
  sub [_ym],ax

  mov bx,[bp+4]
  mov bx,[bx+10]
  mov ax,[bx]

  shl ax,2
  add ax,[bx]
  shl ax,1
  add ax,2
  add bx,ax

  mov ax,[bx]
  add [_xp],ax
  sub [_xm],ax
  mov ax,[bx+2]
  add [_yp],ax
  sub [_ym],ax

  xor ax,ax

  mov bx,[bp+4]
  mov cx,[bx]

  cmp cx,[_xm]
  jl collision_end
  cmp cx,[_xp]
  jg collision_end

  mov cx,[bx+2]
  cmp cx,[_ym]
  jl collision_end
  cmp cx,[_yp]
  jg collision_end

  inc ax

collision_end:

pop bx
mov sp,bp
pop bp
retn 4

_xp dw 12
_xm dw 14
_yp dw 3
_ym dw 8
