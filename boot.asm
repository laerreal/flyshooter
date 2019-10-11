format binary
;org 100h
org 7c00h

; под точку входа даётся всего 2 байта, поэтому единственное, что можно сделать - прыгнуть дальше
jmp start

; пустая таблица разделов
times(59) db 0ffh

; осмысленный код начинается здесь
start:

; запретить прерывания

cli
push 138fh
pop es
MOV  DL,80h ;Диск (C)
read_again:
MOV  DH,00  ; Сторона (головка)
MOV  CH,00    ;Дорожка

MOV  AH,02     ;Запрос на чтение
MOV  AL,08    ; кол-во секторов
mov  BX,0 ;Буфер ввода в ES:BX

MOV  CL,02     ;Сектор 
int 13h

jnc normal_continue
; Ошибка чтения, пробуем с дискеты
mov DL, 00h ; Дискета (A)
jmp read_again

normal_continue:

mov ax,138fh
mov ds,ax

xor ax,ax
mov gs,ax
mov word [gs:4*9],key
mov word [gs:4*9+2],138fh

sti

jmp 138fh:0000h ;7c6b



; оставшееся место
times(7c00h+510-$) db 00h



; сигнатура загрузочной записи
db 055h,0aah

org 0h
include 'main.asm'
include 'key.asm'
include 'graphic.inc'
include 'phisTest.asm'
include 'objectsManeger.asm'
include 'playerMovie.asm'
include 'playerShoot.asm'
include 'deleteObject.asm'
include 'trace.asm'
include 'collision.asm'
include 'collisionTest.asm'
include 'min.asm'
include 'rnd.asm'
include 'skyInicialize.asm'
include 'enemyShoot.asm'


_a dw 2
_speed_shoot dw 3
_shoot_timer dw 0
_first_arrow_speed dw -10
_first_arrow_demage dw 1
_speed_limit dw 10
_sky_speed dw 8
_enemy_timer dw 0
_enemy_rate dw 40
_score dw 0

OBJ_SIGNATURE_SIZE dw 20

;keys
KEY_UP db 0
KEY_DOWN db 0
KEY_LEFT db 0
KEY_RIGHT db 0
KEY_FIRE1 db 0
KEY_ESC db 0
;end keys   
   
objects_array dw 1,player
rb 150
    
sky1 dw 10,7,16 ;count,speed,size
    rd 10

sky2 dw 20,4,3 ;count,speed,size
    rd 20
    
sky3 dw 30,1,1
    rd 30



	 
    
model2 dw 23
  dw 42,0,20,5,15
  dw 42,5,15,4,-5
  dw 42,4,-5,10,7
  dw 42,10,7,15,-5
  dw 42,15,-5,12,-10
  dw 42,0,20,-5,15
  dw 42,-5,15,-4,-5
  dw 42,-4,-5,-10,7
  dw 42,-10,7,-15,-5
  dw 42,-15,-5,-12,-10
  dw 42,14,-3,20,2
  dw 42,20,2,19,9
  dw 42,19,9,11,3
  dw 42,-14,-3,-20,2
  dw 42,-20,2,-19,9
  dw 42,-19,9,-11,3
  dw 42,12,-10,-12,-10 
  dw 20h,0,10,3,8
  dw 20h,3,8,3,3
  dw 20h,3,3,0,3
  dw 20h,0,10,-3,8
  dw 20h,-3,8,-3,3
  dw 20h,-3,3,0,3
  dw 20,15
   
model1 dw 19
  dw 55,1,-12,-1,-12
  dw 55,1,-12,5,10
  dw 40,5,10,5,0
  dw 40,5,0,10,-5
  dw 40,10,-5,10,-15
  dw 42,10,-15,15,0
  dw 40,15,0,0,5  
  dw 55,-1,-12,-5,10
  dw 40,-5,10,-5,0
  dw 40,-5,0,-10,-5
  dw 40,-10,-5,-10,-15
  dw 42,-10,-15,-15,0
  dw 40,-15,0,0,5
  dw 41,6,7,11,9
  dw 41,11,9,11,12
  dw 41,11,12,6,10
  dw 41,-6,7,-11,9
  dw 41,-11,9,-11,12
  dw 41,-11,12,-6,10
  dw 12,10

arrow_model_1 dw 4
  dw 23h,0,-2,0,1
  dw 22h,0,1,0,4
  dw 21h,-1,-1,-1,2
  dw 21h,1,-1,1,2
  dw 3,3
  

arrow_model_2 dw 3
  dw 40,0,1,3,-2
  dw 40,0,1,-3,-2
  dw 42,0,0,0,-5
  dw 3,1
  
demage_model_1 dw 21
  dw 40,8,-3,4,-3
  dw 40,4,-3,-2,-8
  dw 40,-2,-8,-8,-4
  dw 40,-8,-4,-6,-2
  dw 40,-6,-2,-9,3
  dw 40,-9,3,-6,6
  dw 40,-6,6,-1,4
  dw 40,-1,4,3,6
  dw 40,3,6,6,4
  dw 40,6,4,8,-3
  
  dw 42,5,2,2,-3
  dw 42,2,-3,-3,-4
  dw 42,-3,-4,-7,-1
  dw 42,-7,-1,-2,7
  dw 42,-2,7,5,2
  
  dw 44,0,0,10,4
  dw 44,0,0,9,-5
  dw 44,0,0,5,10
  dw 44,0,0,4,-9
  dw 44,0,0,-10,4
  dw 44,0,0,-9,-5
  dw 44,0,0,-5,10
  dw 44,0,0,-4,-9
  
interface_model_1 dw 4
  dw 20h,0,0,15,0
  dw 20h,15,0,10,6
  dw 20h,10,6,0,6
  dw 20h,0,6,0,0 

model_t_LOST dw 13
  dw 40,-20,0,-20,10
  dw 40,-20,10,-15,10

  dw 40,-10,0,-10,10
  dw 40,-10,10,-5,10
  dw 40,-5,10,-5,0
  dw 40,-5,0,-11,0

  dw 40,5,0,0,0
  dw 40,0,0,0,5
  dw 40,0,5,5,5
  dw 40,5,5,5,10
  dw 40,5,10,0,10

  dw 40,10,0,16,0
  dw 40,13,0,13,11
  
player  dw 150,150, 0, 0,10,model1, 0  ,  0,  0,   0
;           x,  y, vx,vy,hp,model, flag, shT, shR, type
;type: 0-ship, 1-arrow
objects db 0

times(6608-$) db 0



