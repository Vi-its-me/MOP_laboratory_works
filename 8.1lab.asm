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

out 199, ax ; set zero value to display 
; Index addresing (DI + offset)
; Filling array by fifty numbers
jmp Begin
Array db 10 dup(0, 1, 2, 3, 4)
Begin:
lea bp, Array
mov cx, 50
Filling:
in al, 125
mov [bp + di], al 
inc di
loop Filling

; Calculating minimum value of created array
mov cx, 10  
mov di, 0
mov al, [bp + di]
cmp al, [bp + di]
jmp First_iteration
Cycle:
add di, 5
cmp al, [bp + di]
First_iteration:
jz Skip_variable_assignment; if zero
je Skip_variable_assignment; if equals
jb Skip_variable_assignment; if 1st operand smaller 
                           ; than 2nd
; jg if 1st operand bigger than 2nd
mov al, [bp + di]
Skip_variable_assignment:
loop Cycle
out 199, al; displaying result

HLT           ; halt!


