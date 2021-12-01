global init: function
global clear: function
global fileInput: function
global randomInput: function
global fileOutput: function
global swap: function
global shakerSort: function


%include "figure.asm"


SECTION .text                                           ; code

init:   ; Function begin
        endbr64                                         ; 0000 _ F3: 0F 1E. FA
        push    rbp                                     ; 0004 _ 55
        mov     rbp, rsp                                ; 0005 _ 48: 89. E5
        sub     rsp, 16                                 ; 0008 _ 48: 83. EC, 10
        mov     qword [rbp-10H], 0                      ; 000C _ 48: C7. 45, F0, 00000000
        mov     qword [rbp-8H], 0                       ; 0014 _ 48: C7. 45, F8, 00000000
        mov     dword [rbp-10H], 10000                  ; 001C _ C7. 45, F0, 00002710
        mov     eax, dword [rbp-10H]                    ; 0023 _ 8B. 45, F0
        movsxd  rdx, eax                                ; 0026 _ 48: 63. D0
        mov     rax, rdx                                ; 0029 _ 48: 89. D0
        shl     rax, 2                                  ; 002C _ 48: C1. E0, 02
        add     rax, rdx                                ; 0030 _ 48: 01. D0
        shl     rax, 2                                  ; 0033 _ 48: C1. E0, 02
        mov     rdi, rax                                ; 0037 _ 48: 89. C7
        call    malloc                                  ; 003A _ E8, 00000000(PLT r)
        mov     qword [rbp-8H], rax                     ; 003F _ 48: 89. 45, F8
        mov     rax, qword [rbp-10H]                    ; 0043 _ 48: 8B. 45, F0
        mov     rdx, qword [rbp-8H]                     ; 0047 _ 48: 8B. 55, F8
        leave                                           ; 004B _ C9
        ret                                             ; 004C _ C3
; init End of function

clear:  ; Function begin
        endbr64                                         ; 004D _ F3: 0F 1E. FA
        push    rbp                                     ; 0051 _ 55
        mov     rbp, rsp                                ; 0052 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 0055 _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 0059 _ 48: 8B. 45, F8
        mov     dword [rax+4H], 0                       ; 005D _ C7. 40, 04, 00000000
        mov     rax, qword [rbp-8H]                     ; 0064 _ 48: 8B. 45, F8
        mov     qword [rax+8H], 0                       ; 0068 _ 48: C7. 40, 08, 00000000
        nop                                             ; 0070 _ 90
        pop     rbp                                     ; 0071 _ 5D
        ret                                             ; 0072 _ C3
; clear End of function

fileInput:; Function begin
        endbr64                                         ; 0073 _ F3: 0F 1E. FA
        push    rbp                                     ; 0077 _ 55
        mov     rbp, rsp                                ; 0078 _ 48: 89. E5
        sub     rsp, 64                                 ; 007B _ 48: 83. EC, 40
        mov     qword [rbp-38H], rdi                    ; 007F _ 48: 89. 7D, C8
        mov     qword [rbp-40H], rsi                    ; 0083 _ 48: 89. 75, C0
        mov     dword [rbp-24H], 0                      ; 0087 _ C7. 45, DC, 00000000
        jmp     ?_c4                                   ; 008E _ E9, 000000A2

?_c1:  mov     byte [rbp-1H], 1                        ; 0093 _ C6. 45, FF, 01
        mov     rax, qword [rbp-38H]                    ; 0097 _ 48: 8B. 45, C8
        mov     edx, dword [rax+4H]                     ; 009B _ 8B. 50, 04
        mov     rax, qword [rbp-38H]                    ; 009E _ 48: 8B. 45, C8
        mov     eax, dword [rax]                        ; 00A2 _ 8B. 00
        cmp     edx, eax                                ; 00A4 _ 39. C2
        jnz     ?_c2                                   ; 00A6 _ 75, 04
        mov     byte [rbp-1H], 0                        ; 00A8 _ C6. 45, FF, 00
?_c2:  mov     edx, dword [rbp-24H]                    ; 00AC _ 8B. 55, DC
        mov     rcx, qword [rbp-40H]                    ; 00AF _ 48: 8B. 4D, C0
        lea     rax, [rbp-20H]                          ; 00B3 _ 48: 8D. 45, E0
        mov     rsi, rcx                                ; 00B7 _ 48: 89. CE
        mov     rdi, rax                                ; 00BA _ 48: 89. C7
        call    fileInputFigure                         ; 00BD _ E8, 00000000(PLT r)
        mov     byte [rbp-1H], al                       ; 00C2 _ 88. 45, FF
        movzx   eax, byte [rbp-1H]                      ; 00C5 _ 0F B6. 45, FF
        xor     eax, 01H                                ; 00C9 _ 83. F0, 01
        test    al, al                                  ; 00CC _ 84. C0
        jz      ?_c3                                   ; 00CE _ 74, 1C
        mov     rax, qword [rbp-38H]                    ; 00D0 _ 48: 8B. 45, C8
        mov     eax, dword [rax+4H]                     ; 00D4 _ 8B. 40, 04
        mov     esi, eax                                ; 00D7 _ 89. C6
        lea     rdi, [rel ?_c19]                        ; 00D9 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 00E0 _ B8, 00000000
        call    printf                                  ; 00E5 _ E8, 00000000(PLT r)
        jmp     ?_c5                                   ; 00EA _ EB, 6F

?_c3:  mov     rax, qword [rbp-38H]                    ; 00EC _ 48: 8B. 45, C8
        mov     rcx, qword [rax+8H]                     ; 00F0 _ 48: 8B. 48, 08
        mov     rax, qword [rbp-38H]                    ; 00F4 _ 48: 8B. 45, C8
        mov     eax, dword [rax+4H]                     ; 00F8 _ 8B. 40, 04
        movsxd  rdx, eax                                ; 00FB _ 48: 63. D0
        mov     rax, rdx                                ; 00FE _ 48: 89. D0
        shl     rax, 2                                  ; 0101 _ 48: C1. E0, 02
        add     rax, rdx                                ; 0105 _ 48: 01. D0
        shl     rax, 2                                  ; 0108 _ 48: C1. E0, 02
        add     rcx, rax                                ; 010C _ 48: 01. C1
        mov     rax, qword [rbp-20H]                    ; 010F _ 48: 8B. 45, E0
        mov     rdx, qword [rbp-18H]                    ; 0113 _ 48: 8B. 55, E8
        mov     qword [rcx], rax                        ; 0117 _ 48: 89. 01
        mov     qword [rcx+8H], rdx                     ; 011A _ 48: 89. 51, 08
        mov     eax, dword [rbp-10H]                    ; 011E _ 8B. 45, F0
        mov     dword [rcx+10H], eax                    ; 0121 _ 89. 41, 10
        mov     rax, qword [rbp-38H]                    ; 0124 _ 48: 8B. 45, C8
        mov     eax, dword [rax+4H]                     ; 0128 _ 8B. 40, 04
        lea     edx, [rax+1H]                           ; 012B _ 8D. 50, 01
        mov     rax, qword [rbp-38H]                    ; 012E _ 48: 8B. 45, C8
        mov     dword [rax+4H], edx                     ; 0132 _ 89. 50, 04
?_c4:  lea     rdx, [rbp-24H]                          ; 0135 _ 48: 8D. 55, DC
        mov     rax, qword [rbp-40H]                    ; 0139 _ 48: 8B. 45, C0
        lea     rsi, [rel ?_c20]                        ; 013D _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0144 _ 48: 89. C7
        mov     eax, 0                                  ; 0147 _ B8, 00000000
        call    __isoc99_fscanf                         ; 014C _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 0151 _ 83. F8, FF
        jne     ?_c1                                   ; 0154 _ 0F 85, FFFFFF39
        nop                                             ; 015A _ 90
?_c5:  nop                                             ; 015B _ 90
        leave                                           ; 015C _ C9
        ret                                             ; 015D _ C3
; fileInput End of function

randomInput:; Function begin
        endbr64                                         ; 015E _ F3: 0F 1E. FA
        push    rbp                                     ; 0162 _ 55
        mov     rbp, rsp                                ; 0163 _ 48: 89. E5
        sub     rsp, 16                                 ; 0166 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 016A _ 48: 89. 7D, F8
        mov     dword [rbp-0CH], esi                    ; 016E _ 89. 75, F4
        cmp     dword [rbp-0CH], 0                      ; 0171 _ 83. 7D, F4, 00
        jns     ?_c7                                   ; 0175 _ 79, 76
        lea     rdi, [rel ?_c21]                        ; 0177 _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 017E _ E8, 00000000(PLT r)
        jmp     ?_c8                                   ; 0183 _ EB, 74

?_c6:  mov     rax, qword [rbp-8H]                     ; 0185 _ 48: 8B. 45, F8
        mov     rcx, qword [rax+8H]                     ; 0189 _ 48: 8B. 48, 08
        mov     rax, qword [rbp-8H]                     ; 018D _ 48: 8B. 45, F8
        mov     eax, dword [rax+4H]                     ; 0191 _ 8B. 40, 04
        movsxd  rdx, eax                                ; 0194 _ 48: 63. D0
        mov     rax, rdx                                ; 0197 _ 48: 89. D0
        shl     rax, 2                                  ; 019A _ 48: C1. E0, 02
        add     rax, rdx                                ; 019E _ 48: 01. D0
        shl     rax, 2                                  ; 01A1 _ 48: C1. E0, 02
        add     rax, rcx                                ; 01A5 _ 48: 01. C8
        mov     rdi, rax                                ; 01A8 _ 48: 89. C7
        call    randomInputFigure                       ; 01AB _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-8H]                     ; 01B0 _ 48: 8B. 45, F8
        mov     eax, dword [rax+4H]                     ; 01B4 _ 8B. 40, 04
        lea     edx, [rax+1H]                           ; 01B7 _ 8D. 50, 01
        mov     rax, qword [rbp-8H]                     ; 01BA _ 48: 8B. 45, F8
        mov     dword [rax+4H], edx                     ; 01BE _ 89. 50, 04
        mov     rax, qword [rbp-8H]                     ; 01C1 _ 48: 8B. 45, F8
        mov     edx, dword [rax+4H]                     ; 01C5 _ 8B. 50, 04
        mov     rax, qword [rbp-8H]                     ; 01C8 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 01CC _ 8B. 00
        cmp     edx, eax                                ; 01CE _ 39. C2
        jnz     ?_c7                                   ; 01D0 _ 75, 1B
        mov     rax, qword [rbp-8H]                     ; 01D2 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 01D6 _ 8B. 00
        mov     esi, eax                                ; 01D8 _ 89. C6
        lea     rdi, [rel ?_c22]                        ; 01DA _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 01E1 _ B8, 00000000
        call    printf                                  ; 01E6 _ E8, 00000000(PLT r)
        jmp     ?_c8                                   ; 01EB _ EB, 0C

?_c7:  mov     rax, qword [rbp-8H]                     ; 01ED _ 48: 8B. 45, F8
        mov     eax, dword [rax+4H]                     ; 01F1 _ 8B. 40, 04
        cmp     dword [rbp-0CH], eax                    ; 01F4 _ 39. 45, F4
        jg      ?_c6                                   ; 01F7 _ 7F, 8C
?_c8:  leave                                           ; 01F9 _ C9
        ret                                             ; 01FA _ C3
; randomInput End of function

fileOutput:; Function begin
        endbr64                                         ; 01FB _ F3: 0F 1E. FA
        push    rbp                                     ; 01FF _ 55
        mov     rbp, rsp                                ; 0200 _ 48: 89. E5
        sub     rsp, 32                                 ; 0203 _ 48: 83. EC, 20
        mov     qword [rbp-18H], rdi                    ; 0207 _ 48: 89. 7D, E8
        mov     qword [rbp-20H], rsi                    ; 020B _ 48: 89. 75, E0
        mov     rax, qword [rbp-18H]                    ; 020F _ 48: 8B. 45, E8
        mov     edx, dword [rax+4H]                     ; 0213 _ 8B. 50, 04
        mov     rax, qword [rbp-20H]                    ; 0216 _ 48: 8B. 45, E0
        lea     rsi, [rel ?_c23]                        ; 021A _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0221 _ 48: 89. C7
        mov     eax, 0                                  ; 0224 _ B8, 00000000
        call    fprintf                                 ; 0229 _ E8, 00000000(PLT r)
        mov     dword [rbp-4H], 0                       ; 022E _ C7. 45, FC, 00000000
        jmp     ?_c10                                   ; 0235 _ EB, 51

?_c9:  mov     eax, dword [rbp-4H]                     ; 0237 _ 8B. 45, FC
        lea     edx, [rax+1H]                           ; 023A _ 8D. 50, 01
        mov     rax, qword [rbp-20H]                    ; 023D _ 48: 8B. 45, E0
        lea     rsi, [rel ?_c24]                        ; 0241 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0248 _ 48: 89. C7
        mov     eax, 0                                  ; 024B _ B8, 00000000
        call    fprintf                                 ; 0250 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-18H]                    ; 0255 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 0259 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-4H]                     ; 025D _ 8B. 45, FC
        movsxd  rdx, eax                                ; 0260 _ 48: 63. D0
        mov     rax, rdx                                ; 0263 _ 48: 89. D0
        shl     rax, 2                                  ; 0266 _ 48: C1. E0, 02
        add     rax, rdx                                ; 026A _ 48: 01. D0
        shl     rax, 2                                  ; 026D _ 48: C1. E0, 02
        lea     rdx, [rcx+rax]                          ; 0271 _ 48: 8D. 14 01
        mov     rax, qword [rbp-20H]                    ; 0275 _ 48: 8B. 45, E0
        mov     rsi, rax                                ; 0279 _ 48: 89. C6
        mov     rdi, rdx                                ; 027C _ 48: 89. D7
        call    fileOutputFigure                        ; 027F _ E8, 00000000(PLT r)
        add     dword [rbp-4H], 1                       ; 0284 _ 83. 45, FC, 01
?_c10:  mov     rax, qword [rbp-18H]                    ; 0288 _ 48: 8B. 45, E8
        mov     eax, dword [rax+4H]                     ; 028C _ 8B. 40, 04
        cmp     dword [rbp-4H], eax                     ; 028F _ 39. 45, FC
        jl      ?_c9                                   ; 0292 _ 7C, A3
        nop                                             ; 0294 _ 90
        nop                                             ; 0295 _ 90
        leave                                           ; 0296 _ C9
        ret                                             ; 0297 _ C3
; fileOutput End of function

swap:   ; Function begin
        endbr64                                         ; 0298 _ F3: 0F 1E. FA
        push    rbp                                     ; 029C _ 55
        mov     rbp, rsp                                ; 029D _ 48: 89. E5
        mov     qword [rbp-28H], rdi                    ; 02A0 _ 48: 89. 7D, D8
        mov     dword [rbp-2CH], esi                    ; 02A4 _ 89. 75, D4
        mov     eax, dword [rbp-2CH]                    ; 02A7 _ 8B. 45, D4
        movsxd  rdx, eax                                ; 02AA _ 48: 63. D0
        mov     rax, rdx                                ; 02AD _ 48: 89. D0
        shl     rax, 2                                  ; 02B0 _ 48: C1. E0, 02
        add     rax, rdx                                ; 02B4 _ 48: 01. D0
        shl     rax, 2                                  ; 02B7 _ 48: C1. E0, 02
        mov     rdx, rax                                ; 02BB _ 48: 89. C2
        mov     rax, qword [rbp-28H]                    ; 02BE _ 48: 8B. 45, D8
        lea     rcx, [rdx+rax]                          ; 02C2 _ 48: 8D. 0C 02
        mov     rax, qword [rcx]                        ; 02C6 _ 48: 8B. 01
        mov     rdx, qword [rcx+8H]                     ; 02C9 _ 48: 8B. 51, 08
        mov     qword [rbp-20H], rax                    ; 02CD _ 48: 89. 45, E0
        mov     qword [rbp-18H], rdx                    ; 02D1 _ 48: 89. 55, E8
        mov     eax, dword [rcx+10H]                    ; 02D5 _ 8B. 41, 10
        mov     dword [rbp-10H], eax                    ; 02D8 _ 89. 45, F0
        mov     eax, dword [rbp-2CH]                    ; 02DB _ 8B. 45, D4
        movsxd  rdx, eax                                ; 02DE _ 48: 63. D0
        mov     rax, rdx                                ; 02E1 _ 48: 89. D0
        shl     rax, 2                                  ; 02E4 _ 48: C1. E0, 02
        add     rax, rdx                                ; 02E8 _ 48: 01. D0
        shl     rax, 2                                  ; 02EB _ 48: C1. E0, 02
        lea     rdx, [rax-14H]                          ; 02EF _ 48: 8D. 50, EC
        mov     rax, qword [rbp-28H]                    ; 02F3 _ 48: 8B. 45, D8
        lea     rsi, [rdx+rax]                          ; 02F7 _ 48: 8D. 34 02
        mov     eax, dword [rbp-2CH]                    ; 02FB _ 8B. 45, D4
        movsxd  rdx, eax                                ; 02FE _ 48: 63. D0
        mov     rax, rdx                                ; 0301 _ 48: 89. D0
        shl     rax, 2                                  ; 0304 _ 48: C1. E0, 02
        add     rax, rdx                                ; 0308 _ 48: 01. D0
        shl     rax, 2                                  ; 030B _ 48: C1. E0, 02
        mov     rdx, rax                                ; 030F _ 48: 89. C2
        mov     rax, qword [rbp-28H]                    ; 0312 _ 48: 8B. 45, D8
        lea     rcx, [rdx+rax]                          ; 0316 _ 48: 8D. 0C 02
        mov     rax, qword [rsi]                        ; 031A _ 48: 8B. 06
        mov     rdx, qword [rsi+8H]                     ; 031D _ 48: 8B. 56, 08
        mov     qword [rcx], rax                        ; 0321 _ 48: 89. 01
        mov     qword [rcx+8H], rdx                     ; 0324 _ 48: 89. 51, 08
        mov     eax, dword [rsi+10H]                    ; 0328 _ 8B. 46, 10
        mov     dword [rcx+10H], eax                    ; 032B _ 89. 41, 10
        mov     eax, dword [rbp-2CH]                    ; 032E _ 8B. 45, D4
        movsxd  rdx, eax                                ; 0331 _ 48: 63. D0
        mov     rax, rdx                                ; 0334 _ 48: 89. D0
        shl     rax, 2                                  ; 0337 _ 48: C1. E0, 02
        add     rax, rdx                                ; 033B _ 48: 01. D0
        shl     rax, 2                                  ; 033E _ 48: C1. E0, 02
        lea     rdx, [rax-14H]                          ; 0342 _ 48: 8D. 50, EC
        mov     rax, qword [rbp-28H]                    ; 0346 _ 48: 8B. 45, D8
        lea     rcx, [rdx+rax]                          ; 034A _ 48: 8D. 0C 02
        mov     rax, qword [rbp-20H]                    ; 034E _ 48: 8B. 45, E0
        mov     rdx, qword [rbp-18H]                    ; 0352 _ 48: 8B. 55, E8
        mov     qword [rcx], rax                        ; 0356 _ 48: 89. 01
        mov     qword [rcx+8H], rdx                     ; 0359 _ 48: 89. 51, 08
        mov     eax, dword [rbp-10H]                    ; 035D _ 8B. 45, F0
        mov     dword [rcx+10H], eax                    ; 0360 _ 89. 41, 10
        nop                                             ; 0363 _ 90
        pop     rbp                                     ; 0364 _ 5D
        ret                                             ; 0365 _ C3
; swap End of function

shakerSort:; Function begin
        endbr64                                         ; 0366 _ F3: 0F 1E. FA
        push    rbp                                     ; 036A _ 55
        mov     rbp, rsp                                ; 036B _ 48: 89. E5
        sub     rsp, 32                                 ; 036E _ 48: 83. EC, 20
        mov     qword [rbp-18H], rdi                    ; 0372 _ 48: 89. 7D, E8
        mov     dword [rbp-4H], 1                       ; 0376 _ C7. 45, FC, 00000001
        mov     rax, qword [rbp-18H]                    ; 037D _ 48: 8B. 45, E8
        mov     eax, dword [rax+4H]                     ; 0381 _ 8B. 40, 04
        sub     eax, 1                                  ; 0384 _ 83. E8, 01
        mov     dword [rbp-8H], eax                     ; 0387 _ 89. 45, F8
        jmp     ?_c18                                   ; 038A _ E9, 00000114

?_c11:  mov     eax, dword [rbp-8H]                     ; 038F _ 8B. 45, F8
        mov     dword [rbp-0CH], eax                    ; 0392 _ 89. 45, F4
        jmp     ?_c14                                   ; 0395 _ EB, 76

?_c12:  mov     rax, qword [rbp-18H]                    ; 0397 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 039B _ 48: 8B. 48, 08
        mov     eax, dword [rbp-0CH]                    ; 039F _ 8B. 45, F4
        movsxd  rdx, eax                                ; 03A2 _ 48: 63. D0
        mov     rax, rdx                                ; 03A5 _ 48: 89. D0
        shl     rax, 2                                  ; 03A8 _ 48: C1. E0, 02
        add     rax, rdx                                ; 03AC _ 48: 01. D0
        shl     rax, 2                                  ; 03AF _ 48: C1. E0, 02
        sub     rax, 20                                 ; 03B3 _ 48: 83. E8, 14
        add     rax, rcx                                ; 03B7 _ 48: 01. C8
        mov     rdi, rax                                ; 03BA _ 48: 89. C7
        call    volume                                  ; 03BD _ E8, 00000000(PLT r)
        movss   dword [rbp-1CH], xmm0                   ; 03C2 _ F3: 0F 11. 45, E4
        mov     rax, qword [rbp-18H]                    ; 03C7 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 03CB _ 48: 8B. 48, 08
        mov     eax, dword [rbp-0CH]                    ; 03CF _ 8B. 45, F4
        movsxd  rdx, eax                                ; 03D2 _ 48: 63. D0
        mov     rax, rdx                                ; 03D5 _ 48: 89. D0
        shl     rax, 2                                  ; 03D8 _ 48: C1. E0, 02
        add     rax, rdx                                ; 03DC _ 48: 01. D0
        shl     rax, 2                                  ; 03DF _ 48: C1. E0, 02
        add     rax, rcx                                ; 03E3 _ 48: 01. C8
        mov     rdi, rax                                ; 03E6 _ 48: 89. C7
        call    volume                                  ; 03E9 _ E8, 00000000(PLT r)
        comiss  xmm0, dword [rbp-1CH]                   ; 03EE _ 0F 2F. 45, E4
        jbe     ?_c13                                   ; 03F2 _ 76, 15
        mov     rax, qword [rbp-18H]                    ; 03F4 _ 48: 8B. 45, E8
        mov     rax, qword [rax+8H]                     ; 03F8 _ 48: 8B. 40, 08
        mov     edx, dword [rbp-0CH]                    ; 03FC _ 8B. 55, F4
        mov     esi, edx                                ; 03FF _ 89. D6
        mov     rdi, rax                                ; 0401 _ 48: 89. C7
        call    swap                                    ; 0404 _ E8, 00000000(PLT r)
?_c13:  sub     dword [rbp-0CH], 1                      ; 0409 _ 83. 6D, F4, 01
?_c14:  mov     eax, dword [rbp-0CH]                    ; 040D _ 8B. 45, F4
        cmp     eax, dword [rbp-4H]                     ; 0410 _ 3B. 45, FC
        jge     ?_c12                                   ; 0413 _ 7D, 82
        add     dword [rbp-4H], 1                       ; 0415 _ 83. 45, FC, 01
        mov     eax, dword [rbp-4H]                     ; 0419 _ 8B. 45, FC
        mov     dword [rbp-10H], eax                    ; 041C _ 89. 45, F0
        jmp     ?_c17                                   ; 041F _ EB, 76

?_c15:  mov     rax, qword [rbp-18H]                    ; 0421 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 0425 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-10H]                    ; 0429 _ 8B. 45, F0
        movsxd  rdx, eax                                ; 042C _ 48: 63. D0
        mov     rax, rdx                                ; 042F _ 48: 89. D0
        shl     rax, 2                                  ; 0432 _ 48: C1. E0, 02
        add     rax, rdx                                ; 0436 _ 48: 01. D0
        shl     rax, 2                                  ; 0439 _ 48: C1. E0, 02
        sub     rax, 20                                 ; 043D _ 48: 83. E8, 14
        add     rax, rcx                                ; 0441 _ 48: 01. C8
        mov     rdi, rax                                ; 0444 _ 48: 89. C7
        call    volume                                  ; 0447 _ E8, 00000000(PLT r)
        movss   dword [rbp-1CH], xmm0                   ; 044C _ F3: 0F 11. 45, E4
        mov     rax, qword [rbp-18H]                    ; 0451 _ 48: 8B. 45, E8
        mov     rcx, qword [rax+8H]                     ; 0455 _ 48: 8B. 48, 08
        mov     eax, dword [rbp-10H]                    ; 0459 _ 8B. 45, F0
        movsxd  rdx, eax                                ; 045C _ 48: 63. D0
        mov     rax, rdx                                ; 045F _ 48: 89. D0
        shl     rax, 2                                  ; 0462 _ 48: C1. E0, 02
        add     rax, rdx                                ; 0466 _ 48: 01. D0
        shl     rax, 2                                  ; 0469 _ 48: C1. E0, 02
        add     rax, rcx                                ; 046D _ 48: 01. C8
        mov     rdi, rax                                ; 0470 _ 48: 89. C7
        call    volume                                  ; 0473 _ E8, 00000000(PLT r)
        comiss  xmm0, dword [rbp-1CH]                   ; 0478 _ 0F 2F. 45, E4
        jbe     ?_c16                                   ; 047C _ 76, 15
        mov     rax, qword [rbp-18H]                    ; 047E _ 48: 8B. 45, E8
        mov     rax, qword [rax+8H]                     ; 0482 _ 48: 8B. 40, 08
        mov     edx, dword [rbp-10H]                    ; 0486 _ 8B. 55, F0
        mov     esi, edx                                ; 0489 _ 89. D6
        mov     rdi, rax                                ; 048B _ 48: 89. C7
        call    swap                                    ; 048E _ E8, 00000000(PLT r)
?_c16:  add     dword [rbp-10H], 1                      ; 0493 _ 83. 45, F0, 01
?_c17:  mov     eax, dword [rbp-10H]                    ; 0497 _ 8B. 45, F0
        cmp     eax, dword [rbp-8H]                     ; 049A _ 3B. 45, F8
        jle     ?_c15                                   ; 049D _ 7E, 82
        sub     dword [rbp-8H], 1                       ; 049F _ 83. 6D, F8, 01
?_c18:  mov     eax, dword [rbp-4H]                     ; 04A3 _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 04A6 _ 3B. 45, F8
        jle     ?_c11                                   ; 04A9 _ 0F 8E, FFFFFEE0
        nop                                             ; 04AF _ 90
        nop                                             ; 04B0 _ 90
        leave                                           ; 04B1 _ C9
        ret                                             ; 04B2 _ C3
; shakerSort End of function


SECTION .rodata                                         ; const

?_c19:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 74H, 68H, 65H       ; Only the
        db 20H, 66H, 69H, 72H, 73H, 74H, 20H, 25H       ; first %
        db 69H, 20H, 6FH, 62H, 6AH, 65H, 63H, 74H       ; i object
        db 73H, 20H, 61H, 72H, 65H, 20H, 6CH, 6FH       ; s are lo
        db 61H, 64H, 65H, 64H, 21H, 20H, 0AH, 00H       ; aded! ..

?_c20:                                                  ; byte
        db 25H, 69H, 00H                                ; %i.

?_c21:                                                  ; byte
        db 53H, 69H, 7AH, 65H, 20H, 6DH, 75H, 73H       ; Size mus
        db 74H, 20H, 62H, 65H, 20H, 6DH, 6FH, 72H       ; t be mor
        db 65H, 20H, 74H, 68H, 61H, 6EH, 20H, 7AH       ; e than z
        db 65H, 72H, 6FH, 21H, 20H, 00H, 00H, 00H       ; ero! ...
        db 00H, 00H, 00H, 00H, 00H                      ; .....

?_c22:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 25H, 69H, 20H       ; Only %i 
        db 6FH, 62H, 6AH, 65H, 63H, 74H, 73H, 20H       ; objects 
        db 63H, 61H, 6EH, 20H, 62H, 65H, 20H, 63H       ; can be c
        db 72H, 65H, 61H, 74H, 65H, 64H, 21H, 20H       ; reated! 
        db 0AH, 00H                                     ; ..

?_c23:                                                  ; byte
        db 0AH, 20H, 43H, 6FH, 6EH, 74H, 61H, 69H       ; Contai
        db 6EH, 65H, 72H, 27H, 73H, 20H, 73H, 69H       ; ner's si
        db 7AH, 65H, 20H, 2DH, 20H, 25H, 69H, 20H       ; ze - %i 
        db 0AH, 00H                                     ; ..

?_c24:                                                  ; byte
        db 25H, 69H, 3AH, 20H, 00H, 00H, 00H, 00H       ; %i: ....
        db 00H, 00H, 00H, 00H                           ; ....
