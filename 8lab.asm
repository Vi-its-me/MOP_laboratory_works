#make_bin#

; BIN is plain binary format similar to .com format, but not limited to 1 segment;
; All values between # are directives, these values are saved into a separate .binf file.
; Before loading .bin file emulator reads .binf file with the same file name.

; All directives are optional, if you don't need them, delete them.

; set loading address, .bin file will be loaded to this address:
#LOAD_SEGMENT=0500h#
#LOAD_OFFSET=0000h#

; set entry point:
#CS=0500h#	; same as loading segment
#IP=0000h#	; same as loading offset

; set segment registers
#DS=0500h#	; same as loading segment
#ES=0500h#	; same as loading segment

; set stack
#SS=0500h#	; same as loading segment
#SP=FFFEh#	; set to top of loading segment

; set general registers (optional)
#AX=0000h#
#BX=0000h#
#CX=0000h#
#DX=0000h#
#SI=0000h#
#DI=0000h#
#BP=0000h#


jmp Begin
Array db 10 dup(0)

 ; interation count
Begin:
out 199, ax ; set display to zero 
mov cx, 10
Start:      
lea bp, Array
in al, 125 ;get data from spirit lamp
;base-index addressing BP+SI
mov [bp + si], al
inc si
loop Start ; to cycle for 10 iteration
jmp Dividing
;divide sum on count o results
Overflow:
add ah, 1
loop Sum
jmp Next
Dividing:
mov ax, 0
mov cx, 10
mov bx, cx ; BX have a count of values
mov si, 0
Sum:
add al, [bp + si]
inc si 
jc Overflow ; take into account an overflow!
loop Sum

Next:
div bl 
out 199, al ; display integer part
; exchange al 'n ah values
mov bh, al
mov al, ah   
mov ah, bh
out 199, ax ; ! Displays wrong values



HLT           ; halt!


