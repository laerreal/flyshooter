;push массив обьектов

collisionTest:
push bp
mov bp,sp
push bx
push di
  mov bx,[bp+4]
  mov cx,[bx]
  add bx,2
 
  collisionTest_loop1:
  cmp cx,1
  je collisionTest_end
  dec cx
  push cx
    mov dx,bx
    add dx,2
    
    collisionTest_loop2:
    push cx
    push dx
    push bx
    
    
      push word [bx]
      mov ax,bx
      mov bx,dx     
      push word [bx]
      mov bx,ax
      call collision
  
      test ax,ax
      jz collisionTest_next1
      mov bx,[bx]
      push word [bx+8]
      ;mov ax,bx
      mov di,dx
      mov di,[ds:di]
      push word [ds:di+8]
      ;mov bx,ax
      call min
          cmp bx,player
          je collisionTest_next2
          cmp di,player
          je collisionTest_next2
          add [_score],ax ; <-- очки
          collisionTest_next2:
      sub [bx+8],ax
       push word [bx]
       push word [bx+2]     
      mov bx,dx
      mov bx,[bx]
      sub [bx+8],ax
       pop cx
       pop ax
       add ax,[bx]
       add cx,[bx+2]
       shr ax,1
       shr cx,1
       
       push ax
       push cx
       push demage_model_1
       call modelPainter
      
    	collisionTest_next1:
    
    pop bx
    pop dx
    add dx,2
    pop cx
    dec cx
    jnz collisionTest_loop2 
    
  add bx,2
  pop cx
  jmp collisionTest_loop1

collisionTest_end:

pop di
pop bx
mov sp,bp
pop bp
retn 2