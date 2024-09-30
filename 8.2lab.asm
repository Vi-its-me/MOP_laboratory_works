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

out 199, ax

jmp Begin
Array db 25 dup(0)
Array2 db 5 dup(0)
Begin:
lea bp, Array
mov cx, 25
Filling:
in al, 125
mov [bp + di], al 
inc di
loop Filling
mov di, 0
mov cx, 5
jmp Cycle
New_cycle:
lea bp,  Array
add di, 5
mov cx, 5
Cycle:
mov al, 0
cmp al, [bp + di]
jz Skip_variable_assignment; if zero
je Skip_variable_assignment; if equals                            
jg Skip_variable_assignment;if1st operand bigger than2
;jb if 1st operand smaller than 2nd 
mov al, [bp + di]
Skip_variable_assignment:
loop Cycle

lea bp, Array2 
mov [bp + si], al ; strings maximum value
cmp si, 5
je Next
inc si
jmp New_cycle    

Next:
mov si, 0

Again:
cmp al, [bp + si]
;jz Skip if zero
je Skip; if equals
jb Skip; if 1st operand smaller than 2nd
; jg if 1st operand bigger than 2nd
mov al, [bp + si]
Skip:
inc si
cmp si, 5
je End
loop Again

End:
out 199, al
HLT