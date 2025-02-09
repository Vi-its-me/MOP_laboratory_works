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

; Ps (not correct; is there data)
; send to


there_s_no_data: 
in al, 122
cmp al, 0
jz there_s_no_data

in al, 104
cmp al, 0; PF check to parity
jp paritet
;no parity 
;mov ah, 0
mov al, 0
out 122, ax; is not parity
jmp there_s_no_data

paritet:  
   and al, 127
out 199, ax
;mov ah, 1
mov al, 2
out 122, al  
jmp there_s_no_data
; DELET H BIT FROM PS 
;next:
... ; is not parity

HLT           ; halt!


