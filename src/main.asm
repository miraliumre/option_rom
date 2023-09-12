[BITS 16]

%define ROM_SIZE_SECTORS (ROM_SIZE + 512) / 512

%include 'includes/header.asm'
%include 'includes/std.asm'

init:
    pusha
    pushf                         ; Preserve registers

    cld                           ; Clear direction flag
    mov ax, cs                    ; Move code segment address to AX
    mov ds, ax                    ; Move address from AX to DS

    call main                     ; Call the main function

    popf
    popa                          ; Restore registers

    retf

main:
    call set_video_mode           ; Set the video mode

    mov bl, 00000111b             ; Set color (gray text on black bg)
    mov si, str_hello             ; Point to string to be printed
    call print                    ; Call the print function

    mov cx, 0x004C
    mov dx, 0x4B40
    call delay                    ; Wait for 5 seconds

    mov ch, 0
    mov cl, 0
    mov dh, 25
    mov dl, 80                    ; 80x25 area starting from 0,0
    call clear_area               ; Clear the screen before returning

    ret


str_hello       db 'Hello from the Option ROM!', 0x00

ROM_SIZE        equ $-$$
ROM_SIZE_ROUND  equ ROM_SIZE_SECTORS * 512 - 1
times ROM_SIZE_ROUND-ROM_SIZE db 0