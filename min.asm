;push arg1
;push arg2
min:
push bp
mov bp,sp
  mov ax,[bp+4]
  cmp ax,[bp+6]
  jbe min_end
  mov ax,[bp+6]
  min_end:
mov sp,bp
pop bp
retn 4
