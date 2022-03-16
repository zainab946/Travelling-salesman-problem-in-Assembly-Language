[org 0x0100]
mov bx,2
mov cx,4

jmp start

innerloop:
mov ax,[array+bx]
mov dx,[array+bx+2]
cmp ax,dx
jl next
add bx,2
sub cx,1
cmp cx,4
jne innerloop
next:
mov ax,2
call printnode 



array: dw 0 ,1,9,4,6,3
;array dw A,B,C,D,E,F;
;A-B-D-E-F-C-A

printnode
push bp
mov bp,sp
push ax
push es
push di

mov ax,0xb800
mov es,ax
mov di,0
      
      char1:
mov word[es:di],0x0441  ;A ascii
add di,2
cmp di,162
jne char1
jmp line

      line:
mov word[es:di],0x082D   ;- ascii
add di,2
cmp di,178
jne line
jmp char2

      char2:
mov word[es:di],0x0442   ;B ascii
add di,2
cmp di,180
jne char2
jmp line2

line2:
mov word[es:di],0x062D
add di,2
cmp di,196
jne line2
jmp char3

char3:
mov word[es:di],0x0444  ;C ascii
add di,2
cmp di,198
jne char3
jmp line3

line3:
mov word[es:di],0x052D
add di,2
cmp di,212
jne line3
jmp char4

char4:
mov word[es:di],0x0445  ;D ascii
add di,2
cmp di,214
jne char4
jmp line4

line4:
mov word[es:di],0x012D
add di,2
cmp di,230
jne line4
jmp char5

char5:
mov word[es:di],0x0446   ;E ascii
add di,2
cmp di,232
jne char5
jmp line5

line5:
mov word[es:di],0x022D
add di,2
cmp di,246
jne line5
jmp char6

char6:
mov word[es:di],0x0443  ;F ascii
add di,2
cmp di,248
jne char6
jmp line6

line6:
mov word[es:di],0x032D
add di,2
cmp di,262
jne line6
jmp back


      back:
mov word[es:di],0x0441  ;A ascii
add di,2
cmp di,264
jne back
jmp else



else:
mov ax,0x4c00
int 21h

 pop di
pop es
pop ax
pop bp
ret 

start:

call innerloop

