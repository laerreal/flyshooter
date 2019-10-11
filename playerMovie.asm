playerMovie:
  push ax
  mov ax,[_speed_limit]
  cmp word [player+4],ax
    jl playerTest_v1
      mov word [player+4],ax
      jmp playerTest_v2
    playerTest_v1:
    cmp word [player+6],ax
    jl playerTest_v2
      mov word [player+6],ax
    playerTest_v2:
    
    neg ax
    
    cmp word [player+4],ax
    jg playerTest_v3
      mov word [player+4],ax
      jmp playerTest_v4
    playerTest_v3:
    cmp word [player+6],ax
    jg playerTest_v4
      mov word [player+6],ax
    playerTest_v4:

      
      cmp word [player],30
    jge playerTest_x1
      mov word [player],30
      jmp playerTest_x2
    playerTest_x1:
    cmp word [player],290
    jle playerTest_x2
      mov word [player],290
    playerTest_x2:
    
    cmp word [player+2],20
    jge playerTest_y1
      mov word [player+2],20
      jmp playerTest_y2
    playerTest_y1:
    cmp word [player+2],180
    jle playerTest_y2
      mov word [player+2],180
    playerTest_y2:
    
    cmp word [player+6],0
    je playerTest_v8
    jl playerTest_v7
      dec word [player+6]
      jmp playerTest_v8
    playerTest_v7:
    jg playerTest_v8
      inc word [player+6]
    playerTest_v8:

        cmp word [player+4],0
    je playerTest_v6
    jl playerTest_v5
      dec word [player+4]
      jmp playerTest_v6
    playerTest_v5:
      inc word [player+4]
    playerTest_v6:
    pop ax
ret