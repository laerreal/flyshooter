;push x
;push y
;push num (2B)
;push color
trace:
  push bp
  mov bp,sp
  push bx


    mov ax,[bp+6]
    mov bx,10
    xor dx,dx
    div bx
    mov bl,dl
    test ax,ax
    jz trace_next1
      mov cx,[bp+10]
      sub cx,4
      push cx
      push word [bp+8]
      push ax
      push word [bp+4]
      call trace
    trace_next1:
    xor bh,bh
    shl bx,1
    add bx,numbers
    mov bx,[bx]
    mov cx,[bx]
    add bx,2
    trace_loop2:
    push cx
      mov ax,[bp+10]
      add ax,[bx]

      mov cx,[bp+8]
      add cx,[bx+2]
       push ax
       push cx
       push word [bp+4]
       call point
      add bx,4
    pop cx
    loop trace_loop2


  pop bx
  mov sp,bp
  pop bp
  retn 8


numbers dw n0,n1,n2,n3,n4,n5,n6,n7,n8,n9

n0 dw 12, 1,0, 2,0, 3,0, 1,1, 1,2, 1,3, 1,4, 2,4, 3,4, 3,3, 3,2, 3,1
n1 dw 9, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 2,1, 2,2 ,2,3
n2 dw 11, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 1,2, 2,2, 3,2, 3,1, 1,3
n3 dw 11, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 1,2, 2,2, 3,2, 3,1, 3,3
n4 dw 9, 1,0, 1,1, 1,2, 3,0, 3,1, 3,2, 3,3, 3,4, 2,2
n5 dw 11, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 1,2, 2,2, 3,2, 3,3, 1,1
n6 dw 12, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 1,2, 2,2, 3,2, 3,3, 1,1, 1,3
n7 dw 7, 1,0, 2,0, 3,0, 3,1, 3,2, 3,3, 3,4
n8 dw 13, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 1,2, 2,2, 3,2, 3,3, 1,1, 1,3, 3,1
n9 dw 12, 1,0, 2,0, 3,0, 1,4, 2,4, 3,4, 1,2, 2,2, 3,2, 3,3, 1,1, 3,1

