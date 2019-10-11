mov ax,13h
int 10h

mov di,0

push sky1
call skyInicialize
push sky2
call skyInicialize
push sky3
call skyInicialize


main:

;-----------------
push bx

  in ax,60h
  mov bx,[_a]

   cmp byte [KEY_UP],1
   jne  _next1
    sub [player+6],bx
    jmp _next2

  _next1:
  cmp byte [KEY_DOWN],1
  jne _next2
   add [player+6],bx

  _next2:
  cmp byte [KEY_LEFT],1
  jne _next3
    sub [player+4],bx
    jmp _next4

  _next3:
  cmp byte [KEY_RIGHT],1
  jne _next4
    add [player+4],bx


  _next4:
;----shooting--------------
  mov cx,[_shoot_timer]
  inc word [_shoot_timer]
  cmp cx,[_speed_shoot]
    jl _end
    cmp byte [KEY_FIRE1],1
    jne _end
      push objects_array
      push objects
      call playerShoot
      mov word [_shoot_timer],0
;-----end_shooting------------



_end:
pop bx
;---------------------
    call playerMovie
    call clearScreen

inc word [_enemy_timer]
mov ax,[_enemy_rate]
cmp [_enemy_timer],ax
jb _next5
mov word [_enemy_timer],0
;---------------------------------------
push bx


 mov ax,[objects_array]
  inc ax
  mov [objects_array],ax

  shl ax,1
  push ax
  shr ax,1
    mov dx,[OBJ_SIGNATURE_SIZE]
    mul dl

    add ax,objects
    mov bx,ax

push ax

  call rnd
	xor dx,dx

	mov cx,200
	div cx
	add dx,50

    mov word [bx],dx
pop ax
    mov word [bx+2],-19
    mov word [bx+4],0
    mov word [bx+6],1
    mov word [bx+8],3
    mov word [bx+10],model2
    mov word [bx+12],1
  push ax
    call rnd
    xor dx,dx
    mov cx,40
    div cx
    mov word [bx+14],dx
  pop ax
    mov word [bx+16],40
    mov word [bx+18],0

  pop bx
  add bx,objects_array
  mov [bx],ax



  pop bx
;-----------------------------------

_next5:

    cmp word [player+8],0
    je _end_all


    push sky1
    call skyRender

    push sky2
    call skyRender

    push sky3
    call skyRender



    push objects_array
    call deleteObject

    push objects_array
    call objectsManeger

	  push objects_array
	  call collisionTest

    push 0
    push 0
    push interface_model_1
    call modelPainter

    push 7
    push 1
    push word [player+8]
    push 40
    call trace

    push 300
    push 1
   push word [_score]
    push 20h
	call trace


;---------------------

main_next1:


    xor ah,ah
    int 1Ah
    cmp dx,bx
    je main_next1
    mov bx,dx
    call repaint

jmp main


_end_all:

	 call clearScreen

  push sky3
  call skyRender

  push sky2
  call skyRender

	push sky1
  call skyRender

 	push 150
	push 100
	push word model_t_LOST
	call modelPainter

    main_next2:
    xor ah,ah
    int 1Ah
    cmp dx,bx
    je main_next2
    mov bx,dx
    call repaint

  cmp byte [KEY_ESC],1
  je start

jmp _end_all
