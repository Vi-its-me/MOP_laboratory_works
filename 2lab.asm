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

MOV AX, 23D6H
MOV BX, 23E5H
PUSH AX
PUSH DS
PUSH word [BX]
POP ES
POP DX
POP CX 
;Invert compare result
CMP AH, BL
PUSHF
POP DX
XOR DX, 8000H;0000000001000000b
PUSH DX
POPF                                 
; Compare
JLE COMPLETED
; ELSE  
SUB AH, BL
JMP MARK
; IF COND
COMPLETED:
ADD AH, BL
MARK:

;exchange R3 n R4
MOV CX, 10d
MOV DX, 20d
PUSH CX
PUSH DX
POP CX
POP DX

HLT
;function for compute average number
    ;push AX
    ;push BX
    ;call Avg
;Avgproc
    ;push BP
    ;MOV BP, SP
    ;MOV AX, [BP + 4]
    ;show stack, return address

HLT           ; halt!


