; push plane

phisTest:
  push bp
  mov bp,sp
  push bx

  mov bx,[bp+4]

    ;--------------------------------
  mov ax,[bx+4]
  add [bx],ax
  mov ax,[bx+6]
  add [bx+2],ax

  xor ax,ax
  cmp word [bx+2],-20
  jge phisTest_next1
    inc ax
  phisTest_next1:

  cmp word [bx+2],220
  jle phisTest_next2
    inc ax
    push ax
     push word [bx+8]
     mov word [bx+8],0
     push word [player+8]
     call min
       cmp word [bx+18],1
       je phisTest_next3
       sub [player+8],ax ;вычтем hp за прропуск не пули
       phisTest_next3:
    pop ax
  phisTest_next2:


  pop bx
  mov sp,bp
  pop bp
  retn 2
