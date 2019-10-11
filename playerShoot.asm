;push адрес массива [bp+6]
;  dw count,element_1,element_2,...,element_count
;push адрес буфера  [bp+4]
;  dw x,y,vx,vy,hp,model

playerShoot:
  push bp
  mov bp,sp
  push bx
  
  mov bx,[bp+6]
  mov ax,[bx]
  inc ax
  mov [bx],ax
  
  shl ax,1
  push ax
  shr ax,1
    mov dx,[OBJ_SIGNATURE_SIZE]
    mul dl
    
    add ax,[bp+4]
    mov bx,ax
      
    mov dx,[player]
    mov cx,[player+2]
    sub cx,11
    mov [bx],dx
    mov [bx+2],cx
   ; mov dx,[player+4]
    mov word [bx+4],0
    mov dx,[_first_arrow_speed]
    ;add dx,[player+6]
    mov word [bx+6],dx
    mov dx,[_first_arrow_demage]
    mov word [bx+8],dx
    mov word [bx+10],arrow_model_1
    mov word [bx+12],0
    mov word [bx+14],0
    mov word [bx+16],0
    mov word [bx+18],1
  
  pop bx
  add bx,[bp+6]
  mov [bx],ax
  
   
  
  pop bx
  mov sp,bp
  pop bp
retn 4