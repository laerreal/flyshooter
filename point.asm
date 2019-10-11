;push x
;push y
;push color

point:
  push bp
  mov bp,sp
  push es
  push di


  cmp word [bp+6],0
  jl point_end
  cmp word [bp+6],200
  jg point_end
  cmp word [bp+8],0
  jl point_end
  cmp word [bp+8],319
  jg point_end



  mov ax,9000h
  mov es,ax

  mov ax,[bp+6]
  mov ah,5
  mul ah
  shl ax,6
  add ax,[bp+8]
  mov di,ax

  mov al,[bp+4]
  mov [es:di],al

  point_end:
  pop di
  pop es
  mov sp,bp
  pop bp
  retn 6
