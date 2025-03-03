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

; add your code here
;SF
MOV AX, 00000001B
MOV BX, 00000010B
SUB AX, BX
;AF
MOV AX, 11111110B
ADD AX, 00000010B

;comparison ADD ADC
MOV AX, 00000000B
MOV AL, 254
ADD AL, 2

MOV AX, 00000000B
MOV AL, 254
ADD AL, 2
ADC AL, 3

; COND
MOV AX, 0 
MOV BX, 0
MOV AH, 00000010B
MOV BL, 00000001B
MOV DH, 150

CMP DH, 130
JLE COMPLETED
; ELSE  
SUB AH, BL
JMP MARK
; IF COND
COMPLETED:
ADD AH, BL
MARK:

HLT           ; halt!


