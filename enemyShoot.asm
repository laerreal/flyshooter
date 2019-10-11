;push адрес массива [bp+8]
;  dw count,element_1,element_2,...,element_count
;push адрес буфера  [bp+6]
;  dw x,y,vx,vy,hp,model
;push element adress

enemyShoot:
push bp
mov bp,sp
push bx
push di

mov bx,[bp+4]
cmp bx,player
je enemyShoot_end

cmp word [bx+16],0
je enemyShoot_end

inc word [bx+14]
mov ax,[bx+14]
cmp ax,[bx+16]
jl enemyShoot_end
mov word [bx+14],0
  
  
;jmp enemyShoot_end


mov di,[bp+8]
  mov ax,[di]
  inc ax
  mov [di],ax
   
   shl ax,1
   add di,ax
   shr ax,1
   
    mov dx,[OBJ_SIGNATURE_SIZE]
    mul dl
    
    add ax,[bp+6]
    mov [ds:di],ax
    mov di,ax
      
    mov dx,[bx]
    mov cx,[bx+2]
    add cx,11
    mov [di],dx
    mov [ds:di+2],cx
    mov word [ds:di+4],0
    mov dx,6;[_first_arrow_speed]
    mov word [ds:di+6],dx
    mov dx,1;[_first_arrow_demage]
    mov word [ds:di+8],dx
    mov word [ds:di+10],arrow_model_2
    mov dx,[bx+12]
    mov word [ds:di+12],dx
    mov word [ds:di+14],0
    mov word [ds:di+16],0
    mov word [ds:di+18],1

enemyShoot_end:
pop di
pop bx
mov sp,bp
pop bp
retn 6