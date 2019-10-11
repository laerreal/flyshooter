;push color
;push x1
;push y1
;push x2
;push y2


lineFromTo:
  push bp
  mov bp,sp
  push bx
  
  mov ax,[bp+6]
  sub ax,[bp+10]  
  jnl lineFromTo_prev1
    neg ax  
  lineFromTo_prev1:
  
  mov cx,[bp+4]
  sub cx,[bp+8]
  jnl lineFromTo_prev2
    neg cx  
  lineFromTo_prev2:
    
  cmp cx,ax
  jle lineFromTo_y_less_x  
;--------------------------------
    shl ax,6
    xor dx,dx
    div cx
    mov [lineFromTo_temp],ax
    
    mov bx,[bp+8]
     mov word [lineFromTo_sign],1
    cmp bx,[bp+4]
    jl lineFromTo_x_less_y_loop
      mov word [lineFromTo_sign],-1
      
    lineFromTo_x_less_y_loop:
      mov ax,bx
      sub ax,[bp+8]
      jnl lineFromTo_x_less_y_loop_next1
         neg ax  
      lineFromTo_x_less_y_loop_next1:
      mul word [lineFromTo_temp]
      shr ax,6
      
      mov cx,[bp+10]
      cmp cx,[bp+6]
      jge lineFromTo_x_less_y_loop_next2
        add cx,ax
      jmp lineFromTo_x_less_y_loop_next3
      lineFromTo_x_less_y_loop_next2:
        sub cx,ax
      lineFromTo_x_less_y_loop_next3:
      
      push cx
      push bx
      push word [bp+12]
      call point
      
  
    add bx,[lineFromTo_sign]
    cmp bx,[bp+4]
    jne lineFromTo_x_less_y_loop
;--------------------------------        
  jmp lineFromTo_end
  lineFromTo_y_less_x:
;--------------------------------
    push ax
    push cx
    pop ax
    pop cx
    
    shl ax,6
    xor dx,dx
    div cx
    mov [lineFromTo_temp],ax
    
    mov bx,[bp+10]
     mov word [lineFromTo_sign],1
    cmp bx,[bp+6]
    jl lineFromTo_y_less_x_loop
      mov word [lineFromTo_sign],-1
      
    lineFromTo_y_less_x_loop:
      mov ax,bx
      sub ax,[bp+10]
      jnl lineFromTo_y_less_x_loop_next1
         neg ax  
      lineFromTo_y_less_x_loop_next1:
      mul word [lineFromTo_temp]
      shr ax,6
      
      mov cx,[bp+8]
      cmp cx,[bp+4]
      jge lineFromTo_y_less_x_loop_next2
        add cx,ax
      jmp lineFromTo_y_less_x_loop_next3
      lineFromTo_y_less_x_loop_next2:
        sub cx,ax
      lineFromTo_y_less_x_loop_next3:
      
      push bx
      push cx
      push word [bp+12]
      call point
      
  
    add bx,[lineFromTo_sign]
    cmp bx,[bp+6]
    jne lineFromTo_y_less_x_loop
;--------------------------------
  lineFromTo_end:           
  
  pop bx  
  mov sp,bp
  pop bp
  retn 10
  
lineFromTo_sign dw 1
lineFromTo_temp dw 0