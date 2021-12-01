default rel

global main: function
global _start: function

extern exit                                             ; near
extern fwrite                                           ; near
extern fclose                                           ; near
extern fopen                                            ; near
extern atoi                                             ; near
extern strcmp                                           ; near
extern srand                                            ; near
extern time                                             ; near
extern rand                                             ; near
extern fprintf                                          ; near
extern puts                                             ; near
extern __isoc99_fscanf                                  ; near
extern printf                                           ; near
extern _GLOBAL_OFFSET_TABLE_                            ; byte
extern malloc                                           ; near


%include "container.asm"


SECTION .text                                           ; code

main:   ; Function begin
        endbr64                                         ; 0A40 _ F3: 0F 1E. FA
        push    rbp                                     ; 0A44 _ 55
        mov     rbp, rsp                                ; 0A45 _ 48: 89. E5
        sub     rsp, 64                                 ; 0A48 _ 48: 83. EC, 40
        mov     dword [rbp-34H], edi                    ; 0A4C _ 89. 7D, CC
        mov     qword [rbp-40H], rsi                    ; 0A4F _ 48: 89. 75, C0
        cmp     dword [rbp-34H], 4                      ; 0A53 _ 83. 7D, CC, 04
        jz      ?_032                                   ; 0A57 _ 74, 1B
        lea     rdi, [rel ?_051]                        ; 0A59 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0A60 _ B8, 00000000
        call    printf                                  ; 0A65 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0A6A _ B8, 00000000
        jmp     ?_037                                   ; 0A6F _ E9, 0000019D

?_032:  mov     eax, 0                                  ; 0A74 _ B8, 00000000
        call    init                                    ; 0A79 _ E8, 00000000(PLT r)
        mov     qword [rbp-30H], rax                    ; 0A7E _ 48: 89. 45, D0
        mov     qword [rbp-28H], rdx                    ; 0A82 _ 48: 89. 55, D8
        mov     edi, 0                                  ; 0A86 _ BF, 00000000
        call    time                                    ; 0A8B _ E8, 00000000(PLT r)
        mov     edi, eax                                ; 0A90 _ 89. C7
        call    srand                                   ; 0A92 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-40H]                    ; 0A97 _ 48: 8B. 45, C0
        add     rax, 8                                  ; 0A9B _ 48: 83. C0, 08
        mov     rax, qword [rax]                        ; 0A9F _ 48: 8B. 00
        lea     rsi, [rel ?_052]                        ; 0AA2 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0AA9 _ 48: 89. C7
        call    strcmp                                  ; 0AAC _ E8, 00000000(PLT r)
        test    eax, eax                                ; 0AB1 _ 85. C0
        jnz     ?_033                                   ; 0AB3 _ 75, 2C
        mov     rax, qword [rbp-40H]                    ; 0AB5 _ 48: 8B. 45, C0
        add     rax, 16                                 ; 0AB9 _ 48: 83. C0, 10
        mov     rax, qword [rax]                        ; 0ABD _ 48: 8B. 00
        mov     rdi, rax                                ; 0AC0 _ 48: 89. C7
        call    atoi                                    ; 0AC3 _ E8, 00000000(PLT r)
        mov     dword [rbp-0CH], eax                    ; 0AC8 _ 89. 45, F4
        mov     edx, dword [rbp-0CH]                    ; 0ACB _ 8B. 55, F4
        lea     rax, [rbp-30H]                          ; 0ACE _ 48: 8D. 45, D0
        mov     esi, edx                                ; 0AD2 _ 89. D6
        mov     rdi, rax                                ; 0AD4 _ 48: 89. C7
        call    randomInput                             ; 0AD7 _ E8, 00000000(PLT r)
        jmp     ?_036                                   ; 0ADC _ E9, 0000009A

?_033:  mov     rax, qword [rbp-40H]                    ; 0AE1 _ 48: 8B. 45, C0
        add     rax, 8                                  ; 0AE5 _ 48: 83. C0, 08
        mov     rax, qword [rax]                        ; 0AE9 _ 48: 8B. 00
        lea     rsi, [rel ?_053]                        ; 0AEC _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0AF3 _ 48: 89. C7
        call    strcmp                                  ; 0AF6 _ E8, 00000000(PLT r)
        test    eax, eax                                ; 0AFB _ 85. C0
        jnz     ?_035                                   ; 0AFD _ 75, 61
        mov     rax, qword [rbp-40H]                    ; 0AFF _ 48: 8B. 45, C0
        add     rax, 16                                 ; 0B03 _ 48: 83. C0, 10
        mov     rax, qword [rax]                        ; 0B07 _ 48: 8B. 00
        lea     rsi, [rel ?_054]                        ; 0B0A _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0B11 _ 48: 89. C7
        call    fopen                                   ; 0B14 _ E8, 00000000(PLT r)
        mov     qword [rbp-8H], rax                     ; 0B19 _ 48: 89. 45, F8
        cmp     qword [rbp-8H], 0                       ; 0B1D _ 48: 83. 7D, F8, 00
        jnz     ?_034                                   ; 0B22 _ 75, 1B
        lea     rdi, [rel ?_055]                        ; 0B24 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0B2B _ B8, 00000000
        call    printf                                  ; 0B30 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0B35 _ B8, 00000000
        jmp     ?_037                                   ; 0B3A _ E9, 000000D2

?_034:  mov     rdx, qword [rbp-8H]                     ; 0B3F _ 48: 8B. 55, F8
        lea     rax, [rbp-30H]                          ; 0B43 _ 48: 8D. 45, D0
        mov     rsi, rdx                                ; 0B47 _ 48: 89. D6
        mov     rdi, rax                                ; 0B4A _ 48: 89. C7
        call    fileInput                               ; 0B4D _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-8H]                     ; 0B52 _ 48: 8B. 45, F8
        mov     rdi, rax                                ; 0B56 _ 48: 89. C7
        call    fclose                                  ; 0B59 _ E8, 00000000(PLT r)
        jmp     ?_036                                   ; 0B5E _ EB, 1B

?_035:  lea     rdi, [rel ?_056]                        ; 0B60 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0B67 _ B8, 00000000
        call    printf                                  ; 0B6C _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0B71 _ B8, 00000000
        jmp     ?_037                                   ; 0B76 _ E9, 00000096

?_036:  mov     rax, qword [rbp-40H]                    ; 0B7B _ 48: 8B. 45, C0
        add     rax, 24                                 ; 0B7F _ 48: 83. C0, 18
        mov     rax, qword [rax]                        ; 0B83 _ 48: 8B. 00
        lea     rsi, [rel ?_057]                        ; 0B86 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0B8D _ 48: 89. C7
        call    fopen                                   ; 0B90 _ E8, 00000000(PLT r)
        mov     qword [rbp-18H], rax                    ; 0B95 _ 48: 89. 45, E8
        mov     rdx, qword [rbp-18H]                    ; 0B99 _ 48: 8B. 55, E8
        lea     rax, [rbp-30H]                          ; 0B9D _ 48: 8D. 45, D0
        mov     rsi, rdx                                ; 0BA1 _ 48: 89. D6
        mov     rdi, rax                                ; 0BA4 _ 48: 89. C7
        call    fileOutput                              ; 0BA7 _ E8, 00000000(PLT r)
        lea     rax, [rbp-30H]                          ; 0BAC _ 48: 8D. 45, D0
        mov     rdi, rax                                ; 0BB0 _ 48: 89. C7
        call    shakerSort                              ; 0BB3 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-18H]                    ; 0BB8 _ 48: 8B. 45, E8
        mov     rcx, rax                                ; 0BBC _ 48: 89. C1
        mov     edx, 24                                 ; 0BBF _ BA, 00000018
        mov     esi, 1                                  ; 0BC4 _ BE, 00000001
        lea     rdi, [rel ?_058]                        ; 0BC9 _ 48: 8D. 3D, 00000000(rel)
        call    fwrite                                  ; 0BD0 _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-18H]                    ; 0BD5 _ 48: 8B. 55, E8
        lea     rax, [rbp-30H]                          ; 0BD9 _ 48: 8D. 45, D0
        mov     rsi, rdx                                ; 0BDD _ 48: 89. D6
        mov     rdi, rax                                ; 0BE0 _ 48: 89. C7
        call    fileOutput                              ; 0BE3 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-18H]                    ; 0BE8 _ 48: 8B. 45, E8
        mov     rdi, rax                                ; 0BEC _ 48: 89. C7
        call    fclose                                  ; 0BEF _ E8, 00000000(PLT r)
        lea     rax, [rbp-30H]                          ; 0BF4 _ 48: 8D. 45, D0
        mov     rdi, rax                                ; 0BF8 _ 48: 89. C7
        call    clear                                   ; 0BFB _ E8, 00000000(PLT r)
        lea     rdi, [rel ?_059]                        ; 0C00 _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 0C07 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0C0C _ B8, 00000000
?_037:  leave                                           ; 0C11 _ C9
        ret                                             ; 0C12 _ C3
; main End of function

_start: ; Function begin
        endbr64                                         ; 0C13 _ F3: 0F 1E. FA
        mov     rdi, qword [rsp]                        ; 0C17 _ 48: 8B. 3C 24
        mov     rsi, rsp                                ; 0C1B _ 48: 89. E6
        add     rsi, 8                                  ; 0C1E _ 48: 83. C6, 08
        call    main                                    ; 0C22 _ E8, 00000000(PLT r)
        xor     rdi, rdi                                ; 0C27 _ 48: 31. FF
        call    exit                                    ; 0C2A _ E8, 00000000(PLT r)
        nop                                             ; 0C2F _ 90
        ud2                                             ; 0C30 _ 0F 0B
; _start End of function


SECTION .data                                           ; data


SECTION .bss                                            ; bss


SECTION .rodata                                         ; const

?_051:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 34H, 20H, 61H       ; Only 4 a
        db 72H, 67H, 75H, 6DH, 65H, 6EH, 74H, 73H       ; rguments
        db 20H, 63H, 61H, 6EH, 20H, 62H, 65H, 20H       ;  can be 
        db 65H, 6EH, 74H, 65H, 72H, 65H, 64H, 21H       ; entered!
        db 00H                                          ; .

?_052:                                                  ; byte
        db 72H, 61H, 6EH, 64H, 6FH, 6DH, 00H            ; random.

?_053:                                                  ; byte
        db 66H, 69H, 6CH, 65H, 00H                      ; file.

?_054:                                                  ; byte
        db 72H, 00H                                     ; r.

?_055:                                                  ; byte
        db 54H, 68H, 69H, 73H, 20H, 66H, 69H, 6CH       ; This fil
        db 65H, 20H, 64H, 6FH, 65H, 73H, 20H, 6EH       ; e does n
        db 6FH, 74H, 20H, 65H, 78H, 69H, 73H, 74H       ; ot exist
        db 73H, 21H, 00H, 00H, 00H, 00H, 00H, 00H       ; s!......
        db 00H                                          ; .

?_056:                                                  ; byte
        db 54H, 68H, 69H, 73H, 20H, 63H, 6FH, 6DH       ; This com
        db 6DH, 61H, 6EH, 64H, 20H, 69H, 73H, 20H       ; mand is 
        db 6EH, 6FH, 74H, 20H, 61H, 76H, 61H, 69H       ; not avai
        db 6CH, 61H, 62H, 6CH, 65H, 21H, 00H            ; lable!.

?_057:                                                  ; byte
        db 77H, 00H                                     ; w.

?_058:                                                  ; byte
        db 0AH, 20H, 41H, 66H, 74H, 65H, 72H, 20H       ; . After 
        db 73H, 68H, 61H, 6BH, 65H, 72H, 20H, 73H       ; shaker s
        db 6FH, 72H, 74H, 2EH, 2EH, 2EH, 20H, 0AH       ; ort... .
        db 00H                                          ; .

?_059:                                                  ; byte
        db 0AH, 20H, 50H, 72H, 6FH, 67H, 72H, 61H       ; . Progra
        db 6DH, 20H, 68H, 61H, 73H, 20H, 74H, 65H       ; m has te
        db 72H, 6DH, 69H, 6EH, 61H, 74H, 65H, 64H       ; rminated
        db 20H, 3AH, 29H, 20H, 00H, 00H                 ;  :) ..
