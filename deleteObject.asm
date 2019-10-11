;push array
deleteObject:
push bp
mov bp,sp
push bx

 
  mov bx,[bp+4]
  mov cx,[bx]
  add bx,2
  deleteObject_loop:
  push cx
  push bx
    mov bx,[bx]     
    cmp word [bx+8],0
    jne deleteObject_next1
        
        mov dx,bx
        mov bx,[bp+4]
        mov ax,[bx]
        dec word [bx]
        shl ax,1
        add bx,ax
            ;-----------
        mov cx,[OBJ_SIGNATURE_SIZE]
        shr cx,1
        mov bx,[bx]
      
        deleteObject_loop1:
        push word [bx]
        add bx,2
        loop deleteObject_loop1
            ;------------------
        mov bx,dx
        add bx,[OBJ_SIGNATURE_SIZE]        
        mov cx,[OBJ_SIGNATURE_SIZE]
        shr cx,1
      
        deleteObject_loop2:
        sub bx,2
        pop word [bx]
        loop deleteObject_loop2
  ;---------------
      
      pop bx
      pop cx
      jmp deleteObject_end
    deleteObject_next1:
  pop bx
  pop cx
  add bx,2
  loop deleteObject_loop  

deleteObject_end:


pop bx
mov sp,bp
pop bp
retn 2