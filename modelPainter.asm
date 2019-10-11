; push x
; push y
; push model

modelPainter:
  push bp
  mov bp,sp
  push bx

  mov bx,[bp+4]
  mov cx,[bx]
  add bx,2

  modelPainter_loop:
  push cx
    push word [bx]
    mov ax,[bp+8]
    mov dx,[bp+6]
    add ax,[bx+2]
    add dx,[bx+4]
    push ax
    push dx

    mov ax,[bp+8]
    mov dx,[bp+6]
    add ax,[bx+6]
    add dx,[bx+8]
    push ax
    push dx

    call lineFromTo

    add bx,10
  pop cx
  loop modelPainter_loop

  pop bx
  mov sp,bp
  pop bp
  retn 6
