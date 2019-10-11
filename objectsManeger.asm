;push objects_array
objectsManeger:
  push bp
  mov bp,sp
  push bx

  mov bx,[bp+4]
  mov cx,[bx]
  add bx,2
  objectsManeger_loop:
  push bx
  push cx
  mov bx,[bx]


  push objects_array
  push objects
  push bx
  call enemyShoot


  push bx
  call phisTest

  cmp ax,1
  jne objectsManeger_next1
    mov word [bx+8],0
  objectsManeger_next1:

  push word [bx]
  push word [bx+2]
  push word [bx+10]
  call modelPainter

  pop cx
  pop bx
  add bx,2
  loop objectsManeger_loop

  pop bx
  mov sp,bp
  pop bp
  retn 2
