; Disassembly of file: src/gcc.o
; Wed Dec  1 02:32:59 2021
; Type: ELF64
; Syntax: NASM
; Instruction set: SSE2, x64

default rel

global init: function
global clear: function
global fileInput: function
global randomInput: function
global fileOutput: function
global swap: function
global shakerSort: function
global fileInputFigure: function
global randomInputFigure: function
global fileOutputFigure: function
global volume: function
global sphereFileInput: function
global sphereRandomInput: function
global sphereFileOutput: function
global sphereVolume: function
global parallelepipedFileInput: function
global parallelepipedRandomInput: function
global parallelepipedFileOutput: function
global parallelepipedVolume: function
global tetrahedronFileInput: function
global tetrahedronRandomInput: function
global tetrahedronFileOutput: function
global tetrahedronVolume: function
global randomInt: function
global randomFloat: function
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


SECTION .text   align=1 execute                         ; section number 1, code

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
        jmp     ?_004                                   ; 008E _ E9, 000000A2

?_001:  mov     byte [rbp-1H], 1                        ; 0093 _ C6. 45, FF, 01
        mov     rax, qword [rbp-38H]                    ; 0097 _ 48: 8B. 45, C8
        mov     edx, dword [rax+4H]                     ; 009B _ 8B. 50, 04
        mov     rax, qword [rbp-38H]                    ; 009E _ 48: 8B. 45, C8
        mov     eax, dword [rax]                        ; 00A2 _ 8B. 00
        cmp     edx, eax                                ; 00A4 _ 39. C2
        jnz     ?_002                                   ; 00A6 _ 75, 04
        mov     byte [rbp-1H], 0                        ; 00A8 _ C6. 45, FF, 00
?_002:  mov     edx, dword [rbp-24H]                    ; 00AC _ 8B. 55, DC
        mov     rcx, qword [rbp-40H]                    ; 00AF _ 48: 8B. 4D, C0
        lea     rax, [rbp-20H]                          ; 00B3 _ 48: 8D. 45, E0
        mov     rsi, rcx                                ; 00B7 _ 48: 89. CE
        mov     rdi, rax                                ; 00BA _ 48: 89. C7
        call    fileInputFigure                         ; 00BD _ E8, 00000000(PLT r)
        mov     byte [rbp-1H], al                       ; 00C2 _ 88. 45, FF
        movzx   eax, byte [rbp-1H]                      ; 00C5 _ 0F B6. 45, FF
        xor     eax, 01H                                ; 00C9 _ 83. F0, 01
        test    al, al                                  ; 00CC _ 84. C0
        jz      ?_003                                   ; 00CE _ 74, 1C
        mov     rax, qword [rbp-38H]                    ; 00D0 _ 48: 8B. 45, C8
        mov     eax, dword [rax+4H]                     ; 00D4 _ 8B. 40, 04
        mov     esi, eax                                ; 00D7 _ 89. C6
        lea     rdi, [rel ?_038]                        ; 00D9 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 00E0 _ B8, 00000000
        call    printf                                  ; 00E5 _ E8, 00000000(PLT r)
        jmp     ?_005                                   ; 00EA _ EB, 6F

?_003:  mov     rax, qword [rbp-38H]                    ; 00EC _ 48: 8B. 45, C8
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
?_004:  lea     rdx, [rbp-24H]                          ; 0135 _ 48: 8D. 55, DC
        mov     rax, qword [rbp-40H]                    ; 0139 _ 48: 8B. 45, C0
        lea     rsi, [rel ?_039]                        ; 013D _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0144 _ 48: 89. C7
        mov     eax, 0                                  ; 0147 _ B8, 00000000
        call    __isoc99_fscanf                         ; 014C _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 0151 _ 83. F8, FF
        jne     ?_001                                   ; 0154 _ 0F 85, FFFFFF39
        nop                                             ; 015A _ 90
?_005:  nop                                             ; 015B _ 90
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
        jns     ?_007                                   ; 0175 _ 79, 76
        lea     rdi, [rel ?_040]                        ; 0177 _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 017E _ E8, 00000000(PLT r)
        jmp     ?_008                                   ; 0183 _ EB, 74

?_006:  mov     rax, qword [rbp-8H]                     ; 0185 _ 48: 8B. 45, F8
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
        jnz     ?_007                                   ; 01D0 _ 75, 1B
        mov     rax, qword [rbp-8H]                     ; 01D2 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 01D6 _ 8B. 00
        mov     esi, eax                                ; 01D8 _ 89. C6
        lea     rdi, [rel ?_041]                        ; 01DA _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 01E1 _ B8, 00000000
        call    printf                                  ; 01E6 _ E8, 00000000(PLT r)
        jmp     ?_008                                   ; 01EB _ EB, 0C

?_007:  mov     rax, qword [rbp-8H]                     ; 01ED _ 48: 8B. 45, F8
        mov     eax, dword [rax+4H]                     ; 01F1 _ 8B. 40, 04
        cmp     dword [rbp-0CH], eax                    ; 01F4 _ 39. 45, F4
        jg      ?_006                                   ; 01F7 _ 7F, 8C
?_008:  leave                                           ; 01F9 _ C9
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
        lea     rsi, [rel ?_042]                        ; 021A _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0221 _ 48: 89. C7
        mov     eax, 0                                  ; 0224 _ B8, 00000000
        call    fprintf                                 ; 0229 _ E8, 00000000(PLT r)
        mov     dword [rbp-4H], 0                       ; 022E _ C7. 45, FC, 00000000
        jmp     ?_010                                   ; 0235 _ EB, 51

?_009:  mov     eax, dword [rbp-4H]                     ; 0237 _ 8B. 45, FC
        lea     edx, [rax+1H]                           ; 023A _ 8D. 50, 01
        mov     rax, qword [rbp-20H]                    ; 023D _ 48: 8B. 45, E0
        lea     rsi, [rel ?_043]                        ; 0241 _ 48: 8D. 35, 00000000(rel)
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
?_010:  mov     rax, qword [rbp-18H]                    ; 0288 _ 48: 8B. 45, E8
        mov     eax, dword [rax+4H]                     ; 028C _ 8B. 40, 04
        cmp     dword [rbp-4H], eax                     ; 028F _ 39. 45, FC
        jl      ?_009                                   ; 0292 _ 7C, A3
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
        jmp     ?_018                                   ; 038A _ E9, 00000114

?_011:  mov     eax, dword [rbp-8H]                     ; 038F _ 8B. 45, F8
        mov     dword [rbp-0CH], eax                    ; 0392 _ 89. 45, F4
        jmp     ?_014                                   ; 0395 _ EB, 76

?_012:  mov     rax, qword [rbp-18H]                    ; 0397 _ 48: 8B. 45, E8
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
        jbe     ?_013                                   ; 03F2 _ 76, 15
        mov     rax, qword [rbp-18H]                    ; 03F4 _ 48: 8B. 45, E8
        mov     rax, qword [rax+8H]                     ; 03F8 _ 48: 8B. 40, 08
        mov     edx, dword [rbp-0CH]                    ; 03FC _ 8B. 55, F4
        mov     esi, edx                                ; 03FF _ 89. D6
        mov     rdi, rax                                ; 0401 _ 48: 89. C7
        call    swap                                    ; 0404 _ E8, 00000000(PLT r)
?_013:  sub     dword [rbp-0CH], 1                      ; 0409 _ 83. 6D, F4, 01
?_014:  mov     eax, dword [rbp-0CH]                    ; 040D _ 8B. 45, F4
        cmp     eax, dword [rbp-4H]                     ; 0410 _ 3B. 45, FC
        jge     ?_012                                   ; 0413 _ 7D, 82
        add     dword [rbp-4H], 1                       ; 0415 _ 83. 45, FC, 01
        mov     eax, dword [rbp-4H]                     ; 0419 _ 8B. 45, FC
        mov     dword [rbp-10H], eax                    ; 041C _ 89. 45, F0
        jmp     ?_017                                   ; 041F _ EB, 76

?_015:  mov     rax, qword [rbp-18H]                    ; 0421 _ 48: 8B. 45, E8
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
        jbe     ?_016                                   ; 047C _ 76, 15
        mov     rax, qword [rbp-18H]                    ; 047E _ 48: 8B. 45, E8
        mov     rax, qword [rax+8H]                     ; 0482 _ 48: 8B. 40, 08
        mov     edx, dword [rbp-10H]                    ; 0486 _ 8B. 55, F0
        mov     esi, edx                                ; 0489 _ 89. D6
        mov     rdi, rax                                ; 048B _ 48: 89. C7
        call    swap                                    ; 048E _ E8, 00000000(PLT r)
?_016:  add     dword [rbp-10H], 1                      ; 0493 _ 83. 45, F0, 01
?_017:  mov     eax, dword [rbp-10H]                    ; 0497 _ 8B. 45, F0
        cmp     eax, dword [rbp-8H]                     ; 049A _ 3B. 45, F8
        jle     ?_015                                   ; 049D _ 7E, 82
        sub     dword [rbp-8H], 1                       ; 049F _ 83. 6D, F8, 01
?_018:  mov     eax, dword [rbp-4H]                     ; 04A3 _ 8B. 45, FC
        cmp     eax, dword [rbp-8H]                     ; 04A6 _ 3B. 45, F8
        jle     ?_011                                   ; 04A9 _ 0F 8E, FFFFFEE0
        nop                                             ; 04AF _ 90
        nop                                             ; 04B0 _ 90
        leave                                           ; 04B1 _ C9
        ret                                             ; 04B2 _ C3
; shakerSort End of function

fileInputFigure:; Function begin
        endbr64                                         ; 04B3 _ F3: 0F 1E. FA
        push    rbp                                     ; 04B7 _ 55
        mov     rbp, rsp                                ; 04B8 _ 48: 89. E5
        sub     rsp, 32                                 ; 04BB _ 48: 83. EC, 20
        mov     qword [rbp-8H], rdi                     ; 04BF _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 04C3 _ 48: 89. 75, F0
        mov     dword [rbp-14H], edx                    ; 04C7 _ 89. 55, EC
        cmp     dword [rbp-14H], 1                      ; 04CA _ 83. 7D, EC, 01
        jnz     ?_019                                   ; 04CE _ 75, 2B
        mov     rax, qword [rbp-8H]                     ; 04D0 _ 48: 8B. 45, F8
        mov     dword [rax], 0                          ; 04D4 _ C7. 00, 00000000
        mov     rax, qword [rbp-8H]                     ; 04DA _ 48: 8B. 45, F8
        lea     rdx, [rax+4H]                           ; 04DE _ 48: 8D. 50, 04
        mov     rax, qword [rbp-8H]                     ; 04E2 _ 48: 8B. 45, F8
        lea     rcx, [rax+8H]                           ; 04E6 _ 48: 8D. 48, 08
        mov     rax, qword [rbp-10H]                    ; 04EA _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 04EE _ 48: 89. C6
        mov     rdi, rcx                                ; 04F1 _ 48: 89. CF
        call    sphereFileInput                         ; 04F4 _ E8, 00000000(PLT r)
        jmp     ?_022                                   ; 04F9 _ EB, 73

?_019:  cmp     dword [rbp-14H], 2                      ; 04FB _ 83. 7D, EC, 02
        jnz     ?_020                                   ; 04FF _ 75, 2B
        mov     rax, qword [rbp-8H]                     ; 0501 _ 48: 8B. 45, F8
        mov     dword [rax], 1                          ; 0505 _ C7. 00, 00000001
        mov     rax, qword [rbp-8H]                     ; 050B _ 48: 8B. 45, F8
        lea     rdx, [rax+4H]                           ; 050F _ 48: 8D. 50, 04
        mov     rax, qword [rbp-8H]                     ; 0513 _ 48: 8B. 45, F8
        lea     rcx, [rax+8H]                           ; 0517 _ 48: 8D. 48, 08
        mov     rax, qword [rbp-10H]                    ; 051B _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 051F _ 48: 89. C6
        mov     rdi, rcx                                ; 0522 _ 48: 89. CF
        call    parallelepipedFileInput                 ; 0525 _ E8, 00000000(PLT r)
        jmp     ?_022                                   ; 052A _ EB, 42

?_020:  cmp     dword [rbp-14H], 3                      ; 052C _ 83. 7D, EC, 03
        jnz     ?_021                                   ; 0530 _ 75, 2B
        mov     rax, qword [rbp-8H]                     ; 0532 _ 48: 8B. 45, F8
        mov     dword [rax], 2                          ; 0536 _ C7. 00, 00000002
        mov     rax, qword [rbp-8H]                     ; 053C _ 48: 8B. 45, F8
        lea     rdx, [rax+4H]                           ; 0540 _ 48: 8D. 50, 04
        mov     rax, qword [rbp-8H]                     ; 0544 _ 48: 8B. 45, F8
        lea     rcx, [rax+8H]                           ; 0548 _ 48: 8D. 48, 08
        mov     rax, qword [rbp-10H]                    ; 054C _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 0550 _ 48: 89. C6
        mov     rdi, rcx                                ; 0553 _ 48: 89. CF
        call    tetrahedronFileInput                    ; 0556 _ E8, 00000000(PLT r)
        jmp     ?_022                                   ; 055B _ EB, 11

?_021:  lea     rdi, [rel ?_044]                        ; 055D _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 0564 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0569 _ B8, 00000000
?_022:  leave                                           ; 056E _ C9
        ret                                             ; 056F _ C3
; fileInputFigure End of function

randomInputFigure:; Function begin
        endbr64                                         ; 0570 _ F3: 0F 1E. FA
        push    rbp                                     ; 0574 _ 55
        mov     rbp, rsp                                ; 0575 _ 48: 89. E5
        sub     rsp, 32                                 ; 0578 _ 48: 83. EC, 20
        mov     qword [rbp-18H], rdi                    ; 057C _ 48: 89. 7D, E8
        mov     eax, 0                                  ; 0580 _ B8, 00000000
        call    randomFloat                             ; 0585 _ E8, 00000000(PLT r)
        movd    eax, xmm0                               ; 058A _ 66: 0F 7E. C0
        mov     rdx, qword [rbp-18H]                    ; 058E _ 48: 8B. 55, E8
        mov     dword [rdx+4H], eax                     ; 0592 _ 89. 42, 04
        mov     esi, 3                                  ; 0595 _ BE, 00000003
        mov     edi, 1                                  ; 059A _ BF, 00000001
        call    randomInt                               ; 059F _ E8, 00000000(PLT r)
        mov     dword [rbp-4H], eax                     ; 05A4 _ 89. 45, FC
        cmp     dword [rbp-4H], 1                       ; 05A7 _ 83. 7D, FC, 01
        jnz     ?_023                                   ; 05AB _ 75, 1C
        mov     rax, qword [rbp-18H]                    ; 05AD _ 48: 8B. 45, E8
        mov     dword [rax], 0                          ; 05B1 _ C7. 00, 00000000
        mov     rax, qword [rbp-18H]                    ; 05B7 _ 48: 8B. 45, E8
        add     rax, 8                                  ; 05BB _ 48: 83. C0, 08
        mov     rdi, rax                                ; 05BF _ 48: 89. C7
        call    sphereRandomInput                       ; 05C2 _ E8, 00000000(PLT r)
        jmp     ?_025                                   ; 05C7 _ EB, 3C

?_023:  cmp     dword [rbp-4H], 2                       ; 05C9 _ 83. 7D, FC, 02
        jnz     ?_024                                   ; 05CD _ 75, 1C
        mov     rax, qword [rbp-18H]                    ; 05CF _ 48: 8B. 45, E8
        mov     dword [rax], 1                          ; 05D3 _ C7. 00, 00000001
        mov     rax, qword [rbp-18H]                    ; 05D9 _ 48: 8B. 45, E8
        add     rax, 8                                  ; 05DD _ 48: 83. C0, 08
        mov     rdi, rax                                ; 05E1 _ 48: 89. C7
        call    parallelepipedRandomInput               ; 05E4 _ E8, 00000000(PLT r)
        jmp     ?_025                                   ; 05E9 _ EB, 1A

?_024:  mov     rax, qword [rbp-18H]                    ; 05EB _ 48: 8B. 45, E8
        mov     dword [rax], 2                          ; 05EF _ C7. 00, 00000002
        mov     rax, qword [rbp-18H]                    ; 05F5 _ 48: 8B. 45, E8
        add     rax, 8                                  ; 05F9 _ 48: 83. C0, 08
        mov     rdi, rax                                ; 05FD _ 48: 89. C7
        call    tetrahedronRandomInput                  ; 0600 _ E8, 00000000(PLT r)
?_025:  nop                                             ; 0605 _ 90
        leave                                           ; 0606 _ C9
        ret                                             ; 0607 _ C3
; randomInputFigure End of function

fileOutputFigure:; Function begin
        endbr64                                         ; 0608 _ F3: 0F 1E. FA
        push    rbp                                     ; 060C _ 55
        mov     rbp, rsp                                ; 060D _ 48: 89. E5
        sub     rsp, 16                                 ; 0610 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 0614 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0618 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 061C _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 0620 _ 8B. 00
        test    eax, eax                                ; 0622 _ 85. C0
        jnz     ?_026                                   ; 0624 _ 75, 19
        mov     rax, qword [rbp-8H]                     ; 0626 _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 062A _ 48: 8D. 50, 08
        mov     rax, qword [rbp-10H]                    ; 062E _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 0632 _ 48: 89. C6
        mov     rdi, rdx                                ; 0635 _ 48: 89. D7
        call    sphereFileOutput                        ; 0638 _ E8, 00000000(PLT r)
        jmp     ?_028                                   ; 063D _ EB, 3B

?_026:  mov     rax, qword [rbp-8H]                     ; 063F _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 0643 _ 8B. 00
        cmp     eax, 1                                  ; 0645 _ 83. F8, 01
        jnz     ?_027                                   ; 0648 _ 75, 19
        mov     rax, qword [rbp-8H]                     ; 064A _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 064E _ 48: 8D. 50, 08
        mov     rax, qword [rbp-10H]                    ; 0652 _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 0656 _ 48: 89. C6
        mov     rdi, rdx                                ; 0659 _ 48: 89. D7
        call    parallelepipedFileOutput                ; 065C _ E8, 00000000(PLT r)
        jmp     ?_028                                   ; 0661 _ EB, 17

?_027:  mov     rax, qword [rbp-8H]                     ; 0663 _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 0667 _ 48: 8D. 50, 08
        mov     rax, qword [rbp-10H]                    ; 066B _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 066F _ 48: 89. C6
        mov     rdi, rdx                                ; 0672 _ 48: 89. D7
        call    tetrahedronFileOutput                   ; 0675 _ E8, 00000000(PLT r)
?_028:  mov     rax, qword [rbp-8H]                     ; 067A _ 48: 8B. 45, F8
        movss   xmm0, dword [rax+4H]                    ; 067E _ F3: 0F 10. 40, 04
        cvtss2sd xmm0, xmm0                             ; 0683 _ F3: 0F 5A. C0
        mov     rax, qword [rbp-10H]                    ; 0687 _ 48: 8B. 45, F0
        lea     rsi, [rel ?_045]                        ; 068B _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0692 _ 48: 89. C7
        mov     eax, 1                                  ; 0695 _ B8, 00000001
        call    fprintf                                 ; 069A _ E8, 00000000(PLT r)
        nop                                             ; 069F _ 90
        leave                                           ; 06A0 _ C9
        ret                                             ; 06A1 _ C3
; fileOutputFigure End of function

volume: ; Function begin
        endbr64                                         ; 06A2 _ F3: 0F 1E. FA
        push    rbp                                     ; 06A6 _ 55
        mov     rbp, rsp                                ; 06A7 _ 48: 89. E5
        sub     rsp, 16                                 ; 06AA _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 06AE _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 06B2 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 06B6 _ 8B. 00
        test    eax, eax                                ; 06B8 _ 85. C0
        jnz     ?_029                                   ; 06BA _ 75, 12
        mov     rax, qword [rbp-8H]                     ; 06BC _ 48: 8B. 45, F8
        add     rax, 8                                  ; 06C0 _ 48: 83. C0, 08
        mov     rdi, rax                                ; 06C4 _ 48: 89. C7
        call    sphereVolume                            ; 06C7 _ E8, 00000000(PLT r)
        jmp     ?_031                                   ; 06CC _ EB, 2D

?_029:  mov     rax, qword [rbp-8H]                     ; 06CE _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 06D2 _ 8B. 00
        cmp     eax, 1                                  ; 06D4 _ 83. F8, 01
        jnz     ?_030                                   ; 06D7 _ 75, 12
        mov     rax, qword [rbp-8H]                     ; 06D9 _ 48: 8B. 45, F8
        add     rax, 8                                  ; 06DD _ 48: 83. C0, 08
        mov     rdi, rax                                ; 06E1 _ 48: 89. C7
        call    parallelepipedVolume                    ; 06E4 _ E8, 00000000(PLT r)
        jmp     ?_031                                   ; 06E9 _ EB, 10

?_030:  mov     rax, qword [rbp-8H]                     ; 06EB _ 48: 8B. 45, F8
        add     rax, 8                                  ; 06EF _ 48: 83. C0, 08
        mov     rdi, rax                                ; 06F3 _ 48: 89. C7
        call    tetrahedronVolume                       ; 06F6 _ E8, 00000000(PLT r)
?_031:  leave                                           ; 06FB _ C9
        ret                                             ; 06FC _ C3
; volume End of function

sphereFileInput:; Function begin
        endbr64                                         ; 06FD _ F3: 0F 1E. FA
        push    rbp                                     ; 0701 _ 55
        mov     rbp, rsp                                ; 0702 _ 48: 89. E5
        sub     rsp, 32                                 ; 0705 _ 48: 83. EC, 20
        mov     qword [rbp-8H], rdi                     ; 0709 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 070D _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 0711 _ 48: 89. 55, E8
        mov     rcx, qword [rbp-8H]                     ; 0715 _ 48: 8B. 4D, F8
        mov     rdx, qword [rbp-18H]                    ; 0719 _ 48: 8B. 55, E8
        mov     rax, qword [rbp-10H]                    ; 071D _ 48: 8B. 45, F0
        lea     rsi, [rel ?_046]                        ; 0721 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0728 _ 48: 89. C7
        mov     eax, 0                                  ; 072B _ B8, 00000000
        call    __isoc99_fscanf                         ; 0730 _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 0735 _ 83. F8, FF
        setne   al                                      ; 0738 _ 0F 95. C0
        leave                                           ; 073B _ C9
        ret                                             ; 073C _ C3
; sphereFileInput End of function

sphereRandomInput:; Function begin
        endbr64                                         ; 073D _ F3: 0F 1E. FA
        push    rbp                                     ; 0741 _ 55
        mov     rbp, rsp                                ; 0742 _ 48: 89. E5
        sub     rsp, 16                                 ; 0745 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 0749 _ 48: 89. 7D, F8
        mov     esi, 10000                              ; 074D _ BE, 00002710
        mov     edi, 1                                  ; 0752 _ BF, 00000001
        call    randomInt                               ; 0757 _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 075C _ 48: 8B. 55, F8
        mov     dword [rdx], eax                        ; 0760 _ 89. 02
        nop                                             ; 0762 _ 90
        leave                                           ; 0763 _ C9
        ret                                             ; 0764 _ C3
; sphereRandomInput End of function

sphereFileOutput:; Function begin
        endbr64                                         ; 0765 _ F3: 0F 1E. FA
        push    rbp                                     ; 0769 _ 55
        mov     rbp, rsp                                ; 076A _ 48: 89. E5
        sub     rsp, 16                                 ; 076D _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 0771 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0775 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 0779 _ 48: 8B. 45, F8
        mov     edx, dword [rax]                        ; 077D _ 8B. 10
        mov     rax, qword [rbp-10H]                    ; 077F _ 48: 8B. 45, F0
        lea     rsi, [rel ?_047]                        ; 0783 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 078A _ 48: 89. C7
        mov     eax, 0                                  ; 078D _ B8, 00000000
        call    fprintf                                 ; 0792 _ E8, 00000000(PLT r)
        nop                                             ; 0797 _ 90
        leave                                           ; 0798 _ C9
        ret                                             ; 0799 _ C3
; sphereFileOutput End of function

sphereVolume:; Function begin
        endbr64                                         ; 079A _ F3: 0F 1E. FA
        push    rbp                                     ; 079E _ 55
        mov     rbp, rsp                                ; 079F _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 07A2 _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 07A6 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 07AA _ 8B. 00
        cvtsi2sd xmm1, eax                              ; 07AC _ F2: 0F 2A. C8
        movsd   xmm0, qword [rel ?_060]                 ; 07B0 _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm1, xmm0                              ; 07B8 _ F2: 0F 59. C8
        mov     rax, qword [rbp-8H]                     ; 07BC _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 07C0 _ 8B. 00
        cvtsi2sd xmm0, eax                              ; 07C2 _ F2: 0F 2A. C0
        mulsd   xmm1, xmm0                              ; 07C6 _ F2: 0F 59. C8
        mov     rax, qword [rbp-8H]                     ; 07CA _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 07CE _ 8B. 00
        cvtsi2sd xmm0, eax                              ; 07D0 _ F2: 0F 2A. C0
        mulsd   xmm1, xmm0                              ; 07D4 _ F2: 0F 59. C8
        movsd   xmm0, qword [rel ?_061]                 ; 07D8 _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm0, xmm1                              ; 07E0 _ F2: 0F 59. C1
        movsd   xmm1, qword [rel ?_062]                 ; 07E4 _ F2: 0F 10. 0D, 00000000(rel)
        divsd   xmm0, xmm1                              ; 07EC _ F2: 0F 5E. C1
        cvtsd2ss xmm0, xmm0                             ; 07F0 _ F2: 0F 5A. C0
        pop     rbp                                     ; 07F4 _ 5D
        ret                                             ; 07F5 _ C3
; sphereVolume End of function

parallelepipedFileInput:; Function begin
        endbr64                                         ; 07F6 _ F3: 0F 1E. FA
        push    rbp                                     ; 07FA _ 55
        mov     rbp, rsp                                ; 07FB _ 48: 89. E5
        sub     rsp, 32                                 ; 07FE _ 48: 83. EC, 20
        mov     qword [rbp-8H], rdi                     ; 0802 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0806 _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 080A _ 48: 89. 55, E8
        mov     rax, qword [rbp-8H]                     ; 080E _ 48: 8B. 45, F8
        lea     rdi, [rax+8H]                           ; 0812 _ 48: 8D. 78, 08
        mov     rax, qword [rbp-8H]                     ; 0816 _ 48: 8B. 45, F8
        lea     rsi, [rax+4H]                           ; 081A _ 48: 8D. 70, 04
        mov     rcx, qword [rbp-8H]                     ; 081E _ 48: 8B. 4D, F8
        mov     rdx, qword [rbp-18H]                    ; 0822 _ 48: 8B. 55, E8
        mov     rax, qword [rbp-10H]                    ; 0826 _ 48: 8B. 45, F0
        mov     r9, rdi                                 ; 082A _ 49: 89. F9
        mov     r8, rsi                                 ; 082D _ 49: 89. F0
        lea     rsi, [rel ?_048]                        ; 0830 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0837 _ 48: 89. C7
        mov     eax, 0                                  ; 083A _ B8, 00000000
        call    __isoc99_fscanf                         ; 083F _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 0844 _ 83. F8, FF
        setne   al                                      ; 0847 _ 0F 95. C0
        leave                                           ; 084A _ C9
        ret                                             ; 084B _ C3
; parallelepipedFileInput End of function

parallelepipedRandomInput:; Function begin
        endbr64                                         ; 084C _ F3: 0F 1E. FA
        push    rbp                                     ; 0850 _ 55
        mov     rbp, rsp                                ; 0851 _ 48: 89. E5
        sub     rsp, 16                                 ; 0854 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 0858 _ 48: 89. 7D, F8
        mov     esi, 10000                              ; 085C _ BE, 00002710
        mov     edi, 1                                  ; 0861 _ BF, 00000001
        call    randomInt                               ; 0866 _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 086B _ 48: 8B. 55, F8
        mov     dword [rdx], eax                        ; 086F _ 89. 02
        mov     esi, 10000                              ; 0871 _ BE, 00002710
        mov     edi, 1                                  ; 0876 _ BF, 00000001
        call    randomInt                               ; 087B _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 0880 _ 48: 8B. 55, F8
        mov     dword [rdx+4H], eax                     ; 0884 _ 89. 42, 04
        mov     esi, 10000                              ; 0887 _ BE, 00002710
        mov     edi, 1                                  ; 088C _ BF, 00000001
        call    randomInt                               ; 0891 _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 0896 _ 48: 8B. 55, F8
        mov     dword [rdx+8H], eax                     ; 089A _ 89. 42, 08
        nop                                             ; 089D _ 90
        leave                                           ; 089E _ C9
        ret                                             ; 089F _ C3
; parallelepipedRandomInput End of function

parallelepipedFileOutput:; Function begin
        endbr64                                         ; 08A0 _ F3: 0F 1E. FA
        push    rbp                                     ; 08A4 _ 55
        mov     rbp, rsp                                ; 08A5 _ 48: 89. E5
        sub     rsp, 16                                 ; 08A8 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 08AC _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 08B0 _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 08B4 _ 48: 8B. 45, F8
        mov     esi, dword [rax+8H]                     ; 08B8 _ 8B. 70, 08
        mov     rax, qword [rbp-8H]                     ; 08BB _ 48: 8B. 45, F8
        mov     ecx, dword [rax+4H]                     ; 08BF _ 8B. 48, 04
        mov     rax, qword [rbp-8H]                     ; 08C2 _ 48: 8B. 45, F8
        mov     edx, dword [rax]                        ; 08C6 _ 8B. 10
        mov     rax, qword [rbp-10H]                    ; 08C8 _ 48: 8B. 45, F0
        mov     r8d, esi                                ; 08CC _ 41: 89. F0
        lea     rsi, [rel ?_049]                        ; 08CF _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 08D6 _ 48: 89. C7
        mov     eax, 0                                  ; 08D9 _ B8, 00000000
        call    fprintf                                 ; 08DE _ E8, 00000000(PLT r)
        nop                                             ; 08E3 _ 90
        leave                                           ; 08E4 _ C9
        ret                                             ; 08E5 _ C3
; parallelepipedFileOutput End of function

parallelepipedVolume:; Function begin
        endbr64                                         ; 08E6 _ F3: 0F 1E. FA
        push    rbp                                     ; 08EA _ 55
        mov     rbp, rsp                                ; 08EB _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 08EE _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 08F2 _ 48: 8B. 45, F8
        mov     edx, dword [rax]                        ; 08F6 _ 8B. 10
        mov     rax, qword [rbp-8H]                     ; 08F8 _ 48: 8B. 45, F8
        mov     eax, dword [rax+4H]                     ; 08FC _ 8B. 40, 04
        imul    edx, eax                                ; 08FF _ 0F AF. D0
        mov     rax, qword [rbp-8H]                     ; 0902 _ 48: 8B. 45, F8
        mov     eax, dword [rax+8H]                     ; 0906 _ 8B. 40, 08
        imul    eax, edx                                ; 0909 _ 0F AF. C2
        cvtsi2ss xmm0, eax                              ; 090C _ F3: 0F 2A. C0
        pop     rbp                                     ; 0910 _ 5D
        ret                                             ; 0911 _ C3
; parallelepipedVolume End of function

tetrahedronFileInput:; Function begin
        endbr64                                         ; 0912 _ F3: 0F 1E. FA
        push    rbp                                     ; 0916 _ 55
        mov     rbp, rsp                                ; 0917 _ 48: 89. E5
        sub     rsp, 32                                 ; 091A _ 48: 83. EC, 20
        mov     qword [rbp-8H], rdi                     ; 091E _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 0922 _ 48: 89. 75, F0
        mov     qword [rbp-18H], rdx                    ; 0926 _ 48: 89. 55, E8
        mov     rcx, qword [rbp-8H]                     ; 092A _ 48: 8B. 4D, F8
        mov     rdx, qword [rbp-18H]                    ; 092E _ 48: 8B. 55, E8
        mov     rax, qword [rbp-10H]                    ; 0932 _ 48: 8B. 45, F0
        lea     rsi, [rel ?_046]                        ; 0936 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 093D _ 48: 89. C7
        mov     eax, 0                                  ; 0940 _ B8, 00000000
        call    __isoc99_fscanf                         ; 0945 _ E8, 00000000(PLT r)
        cmp     eax, -1                                 ; 094A _ 83. F8, FF
        setne   al                                      ; 094D _ 0F 95. C0
        leave                                           ; 0950 _ C9
        ret                                             ; 0951 _ C3
; tetrahedronFileInput End of function

tetrahedronRandomInput:; Function begin
        endbr64                                         ; 0952 _ F3: 0F 1E. FA
        push    rbp                                     ; 0956 _ 55
        mov     rbp, rsp                                ; 0957 _ 48: 89. E5
        sub     rsp, 16                                 ; 095A _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 095E _ 48: 89. 7D, F8
        mov     esi, 10000                              ; 0962 _ BE, 00002710
        mov     edi, 1                                  ; 0967 _ BF, 00000001
        call    randomInt                               ; 096C _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 0971 _ 48: 8B. 55, F8
        mov     dword [rdx], eax                        ; 0975 _ 89. 02
        nop                                             ; 0977 _ 90
        leave                                           ; 0978 _ C9
        ret                                             ; 0979 _ C3
; tetrahedronRandomInput End of function

tetrahedronFileOutput:; Function begin
        endbr64                                         ; 097A _ F3: 0F 1E. FA
        push    rbp                                     ; 097E _ 55
        mov     rbp, rsp                                ; 097F _ 48: 89. E5
        sub     rsp, 16                                 ; 0982 _ 48: 83. EC, 10
        mov     qword [rbp-8H], rdi                     ; 0986 _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 098A _ 48: 89. 75, F0
        mov     rax, qword [rbp-8H]                     ; 098E _ 48: 8B. 45, F8
        mov     edx, dword [rax]                        ; 0992 _ 8B. 10
        mov     rax, qword [rbp-10H]                    ; 0994 _ 48: 8B. 45, F0
        lea     rsi, [rel ?_050]                        ; 0998 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 099F _ 48: 89. C7
        mov     eax, 0                                  ; 09A2 _ B8, 00000000
        call    fprintf                                 ; 09A7 _ E8, 00000000(PLT r)
        nop                                             ; 09AC _ 90
        leave                                           ; 09AD _ C9
        ret                                             ; 09AE _ C3
; tetrahedronFileOutput End of function

tetrahedronVolume:; Function begin
        endbr64                                         ; 09AF _ F3: 0F 1E. FA
        push    rbp                                     ; 09B3 _ 55
        mov     rbp, rsp                                ; 09B4 _ 48: 89. E5
        mov     qword [rbp-8H], rdi                     ; 09B7 _ 48: 89. 7D, F8
        mov     rax, qword [rbp-8H]                     ; 09BB _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 09BF _ 8B. 00
        cvtsi2sd xmm1, eax                              ; 09C1 _ F2: 0F 2A. C8
        movsd   xmm0, qword [rel ?_063]                 ; 09C5 _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm1, xmm0                              ; 09CD _ F2: 0F 59. C8
        mov     rax, qword [rbp-8H]                     ; 09D1 _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 09D5 _ 8B. 00
        cvtsi2sd xmm0, eax                              ; 09D7 _ F2: 0F 2A. C0
        mulsd   xmm1, xmm0                              ; 09DB _ F2: 0F 59. C8
        mov     rax, qword [rbp-8H]                     ; 09DF _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 09E3 _ 8B. 00
        cvtsi2sd xmm0, eax                              ; 09E5 _ F2: 0F 2A. C0
        mulsd   xmm0, xmm1                              ; 09E9 _ F2: 0F 59. C1
        cvtsd2ss xmm0, xmm0                             ; 09ED _ F2: 0F 5A. C0
        pop     rbp                                     ; 09F1 _ 5D
        ret                                             ; 09F2 _ C3
; tetrahedronVolume End of function

randomInt:; Function begin
        endbr64                                         ; 09F3 _ F3: 0F 1E. FA
        push    rbp                                     ; 09F7 _ 55
        mov     rbp, rsp                                ; 09F8 _ 48: 89. E5
        sub     rsp, 16                                 ; 09FB _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 09FF _ 89. 7D, FC
        mov     dword [rbp-8H], esi                     ; 0A02 _ 89. 75, F8
        call    rand                                    ; 0A05 _ E8, 00000000(PLT r)
        mov     edx, dword [rbp-8H]                     ; 0A0A _ 8B. 55, F8
        sub     edx, dword [rbp-4H]                     ; 0A0D _ 2B. 55, FC
        lea     ecx, [rdx+1H]                           ; 0A10 _ 8D. 4A, 01
        cdq                                             ; 0A13 _ 99
        idiv    ecx                                     ; 0A14 _ F7. F9
        mov     eax, dword [rbp-4H]                     ; 0A16 _ 8B. 45, FC
        add     eax, edx                                ; 0A19 _ 01. D0
        leave                                           ; 0A1B _ C9
        ret                                             ; 0A1C _ C3
; randomInt End of function

randomFloat:; Function begin
        endbr64                                         ; 0A1D _ F3: 0F 1E. FA
        push    rbp                                     ; 0A21 _ 55
        mov     rbp, rsp                                ; 0A22 _ 48: 89. E5
        call    rand                                    ; 0A25 _ E8, 00000000(PLT r)
        cvtsi2sd xmm0, eax                              ; 0A2A _ F2: 0F 2A. C0
        movsd   xmm1, qword [rel ?_064]                 ; 0A2E _ F2: 0F 10. 0D, 00000000(rel)
        divsd   xmm0, xmm1                              ; 0A36 _ F2: 0F 5E. C1
        cvtsd2ss xmm0, xmm0                             ; 0A3A _ F2: 0F 5A. C0
        pop     rbp                                     ; 0A3E _ 5D
        ret                                             ; 0A3F _ C3
; randomFloat End of function

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
        jmp     ?_037                                   ; 0A6F _ E9, 000001B8

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
        jnz     ?_033                                   ; 0AB3 _ 75, 4A
        mov     rax, qword [rbp-40H]                    ; 0AB5 _ 48: 8B. 45, C0
        add     rax, 16                                 ; 0AB9 _ 48: 83. C0, 10
        mov     rax, qword [rax]                        ; 0ABD _ 48: 8B. 00
        mov     rdi, rax                                ; 0AC0 _ 48: 89. C7
        call    atoi                                    ; 0AC3 _ E8, 00000000(PLT r)
        mov     dword [rbp-14H], eax                    ; 0AC8 _ 89. 45, EC
        mov     edx, dword [rbp-14H]                    ; 0ACB _ 8B. 55, EC
        lea     rax, [rbp-30H]                          ; 0ACE _ 48: 8D. 45, D0
        mov     esi, edx                                ; 0AD2 _ 89. D6
        mov     rdi, rax                                ; 0AD4 _ 48: 89. C7
        call    randomInput                             ; 0AD7 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-40H]                    ; 0ADC _ 48: 8B. 45, C0
        add     rax, 24                                 ; 0AE0 _ 48: 83. C0, 18
        mov     rax, qword [rax]                        ; 0AE4 _ 48: 8B. 00
        lea     rsi, [rel ?_053]                        ; 0AE7 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0AEE _ 48: 89. C7
        call    fopen                                   ; 0AF1 _ E8, 00000000(PLT r)
        mov     qword [rbp-8H], rax                     ; 0AF6 _ 48: 89. 45, F8
        jmp     ?_036                                   ; 0AFA _ E9, 000000B5

?_033:  mov     rax, qword [rbp-40H]                    ; 0AFF _ 48: 8B. 45, C0
        add     rax, 8                                  ; 0B03 _ 48: 83. C0, 08
        mov     rax, qword [rax]                        ; 0B07 _ 48: 8B. 00
        lea     rsi, [rel ?_054]                        ; 0B0A _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0B11 _ 48: 89. C7
        call    strcmp                                  ; 0B14 _ E8, 00000000(PLT r)
        test    eax, eax                                ; 0B19 _ 85. C0
        jnz     ?_035                                   ; 0B1B _ 75, 7F
        mov     rax, qword [rbp-40H]                    ; 0B1D _ 48: 8B. 45, C0
        add     rax, 16                                 ; 0B21 _ 48: 83. C0, 10
        mov     rax, qword [rax]                        ; 0B25 _ 48: 8B. 00
        lea     rsi, [rel ?_055]                        ; 0B28 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0B2F _ 48: 89. C7
        call    fopen                                   ; 0B32 _ E8, 00000000(PLT r)
        mov     qword [rbp-10H], rax                    ; 0B37 _ 48: 89. 45, F0
        cmp     qword [rbp-10H], 0                      ; 0B3B _ 48: 83. 7D, F0, 00
        jnz     ?_034                                   ; 0B40 _ 75, 1B
        lea     rdi, [rel ?_056]                        ; 0B42 _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0B49 _ B8, 00000000
        call    printf                                  ; 0B4E _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0B53 _ B8, 00000000
        jmp     ?_037                                   ; 0B58 _ E9, 000000CF

?_034:  mov     rdx, qword [rbp-10H]                    ; 0B5D _ 48: 8B. 55, F0
        lea     rax, [rbp-30H]                          ; 0B61 _ 48: 8D. 45, D0
        mov     rsi, rdx                                ; 0B65 _ 48: 89. D6
        mov     rdi, rax                                ; 0B68 _ 48: 89. C7
        call    fileInput                               ; 0B6B _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-10H]                    ; 0B70 _ 48: 8B. 45, F0
        mov     rdi, rax                                ; 0B74 _ 48: 89. C7
        call    fclose                                  ; 0B77 _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-40H]                    ; 0B7C _ 48: 8B. 45, C0
        add     rax, 24                                 ; 0B80 _ 48: 83. C0, 18
        mov     rax, qword [rax]                        ; 0B84 _ 48: 8B. 00
        lea     rsi, [rel ?_053]                        ; 0B87 _ 48: 8D. 35, 00000000(rel)
        mov     rdi, rax                                ; 0B8E _ 48: 89. C7
        call    fopen                                   ; 0B91 _ E8, 00000000(PLT r)
        mov     qword [rbp-8H], rax                     ; 0B96 _ 48: 89. 45, F8
        jmp     ?_036                                   ; 0B9A _ EB, 18

?_035:  lea     rdi, [rel ?_057]                        ; 0B9C _ 48: 8D. 3D, 00000000(rel)
        mov     eax, 0                                  ; 0BA3 _ B8, 00000000
        call    printf                                  ; 0BA8 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0BAD _ B8, 00000000
        jmp     ?_037                                   ; 0BB2 _ EB, 78

?_036:  mov     rdx, qword [rbp-8H]                     ; 0BB4 _ 48: 8B. 55, F8
        lea     rax, [rbp-30H]                          ; 0BB8 _ 48: 8D. 45, D0
        mov     rsi, rdx                                ; 0BBC _ 48: 89. D6
        mov     rdi, rax                                ; 0BBF _ 48: 89. C7
        call    fileOutput                              ; 0BC2 _ E8, 00000000(PLT r)
        lea     rax, [rbp-30H]                          ; 0BC7 _ 48: 8D. 45, D0
        mov     rdi, rax                                ; 0BCB _ 48: 89. C7
        call    shakerSort                              ; 0BCE _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-8H]                     ; 0BD3 _ 48: 8B. 45, F8
        mov     rcx, rax                                ; 0BD7 _ 48: 89. C1
        mov     edx, 24                                 ; 0BDA _ BA, 00000018
        mov     esi, 1                                  ; 0BDF _ BE, 00000001
        lea     rdi, [rel ?_058]                        ; 0BE4 _ 48: 8D. 3D, 00000000(rel)
        call    fwrite                                  ; 0BEB _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 0BF0 _ 48: 8B. 55, F8
        lea     rax, [rbp-30H]                          ; 0BF4 _ 48: 8D. 45, D0
        mov     rsi, rdx                                ; 0BF8 _ 48: 89. D6
        mov     rdi, rax                                ; 0BFB _ 48: 89. C7
        call    fileOutput                              ; 0BFE _ E8, 00000000(PLT r)
        mov     rax, qword [rbp-8H]                     ; 0C03 _ 48: 8B. 45, F8
        mov     rdi, rax                                ; 0C07 _ 48: 89. C7
        call    fclose                                  ; 0C0A _ E8, 00000000(PLT r)
        lea     rax, [rbp-30H]                          ; 0C0F _ 48: 8D. 45, D0
        mov     rdi, rax                                ; 0C13 _ 48: 89. C7
        call    clear                                   ; 0C16 _ E8, 00000000(PLT r)
        lea     rdi, [rel ?_059]                        ; 0C1B _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 0C22 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0C27 _ B8, 00000000
?_037:  leave                                           ; 0C2C _ C9
        ret                                             ; 0C2D _ C3
; main End of function

_start: ; Function begin
        endbr64                                         ; 0C2E _ F3: 0F 1E. FA
        mov     rdi, qword [rsp]                        ; 0C32 _ 48: 8B. 3C 24
        mov     rsi, rsp                                ; 0C36 _ 48: 89. E6
        add     rsi, 8                                  ; 0C39 _ 48: 83. C6, 08
        call    main                                    ; 0C3D _ E8, 00000000(PLT r)
        xor     rdi, rdi                                ; 0C42 _ 48: 31. FF
        call    exit                                    ; 0C45 _ E8, 00000000(PLT r)
        nop                                             ; 0C4A _ 90
        ud2                                             ; 0C4B _ 0F 0B
; _start End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


SECTION .rodata align=8 noexecute                       ; section number 4, const

?_038:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 74H, 68H, 65H       ; 0000 _ Only the
        db 20H, 66H, 69H, 72H, 73H, 74H, 20H, 25H       ; 0008 _  first %
        db 69H, 20H, 6FH, 62H, 6AH, 65H, 63H, 74H       ; 0010 _ i object
        db 73H, 20H, 61H, 72H, 65H, 20H, 6CH, 6FH       ; 0018 _ s are lo
        db 61H, 64H, 65H, 64H, 21H, 20H, 0AH, 00H       ; 0020 _ aded! ..

?_039:                                                  ; byte
        db 25H, 69H, 00H                                ; 0028 _ %i.

?_040:                                                  ; byte
        db 53H, 69H, 7AH, 65H, 20H, 6DH, 75H, 73H       ; 002B _ Size mus
        db 74H, 20H, 62H, 65H, 20H, 6DH, 6FH, 72H       ; 0033 _ t be mor
        db 65H, 20H, 74H, 68H, 61H, 6EH, 20H, 7AH       ; 003B _ e than z
        db 65H, 72H, 6FH, 21H, 20H, 00H, 00H, 00H       ; 0043 _ ero! ...
        db 00H, 00H, 00H, 00H, 00H                      ; 004B _ .....

?_041:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 25H, 69H, 20H       ; 0050 _ Only %i 
        db 6FH, 62H, 6AH, 65H, 63H, 74H, 73H, 20H       ; 0058 _ objects 
        db 63H, 61H, 6EH, 20H, 62H, 65H, 20H, 63H       ; 0060 _ can be c
        db 72H, 65H, 61H, 74H, 65H, 64H, 21H, 20H       ; 0068 _ reated! 
        db 0AH, 00H                                     ; 0070 _ ..

?_042:                                                  ; byte
        db 0AH, 20H, 43H, 6FH, 6EH, 74H, 61H, 69H       ; 0072 _ . Contai
        db 6EH, 65H, 72H, 27H, 73H, 20H, 73H, 69H       ; 007A _ ner's si
        db 7AH, 65H, 20H, 2DH, 20H, 25H, 69H, 20H       ; 0082 _ ze - %i 
        db 0AH, 00H                                     ; 008A _ ..

?_043:                                                  ; byte
        db 25H, 69H, 3AH, 20H, 00H, 00H, 00H, 00H       ; 008C _ %i: ....
        db 00H, 00H, 00H, 00H                           ; 0094 _ ....

?_044:                                                  ; byte
        db 41H, 6EH, 20H, 6FH, 62H, 6AH, 65H, 63H       ; 0098 _ An objec
        db 74H, 20H, 6FH, 66H, 20H, 74H, 68H, 69H       ; 00A0 _ t of thi
        db 73H, 20H, 74H, 79H, 70H, 65H, 20H, 64H       ; 00A8 _ s type d
        db 6FH, 65H, 73H, 20H, 6EH, 6FH, 74H, 20H       ; 00B0 _ oes not 
        db 65H, 78H, 69H, 73H, 74H, 21H, 20H, 00H       ; 00B8 _ exist! .

?_045:                                                  ; byte
        db 2CH, 20H, 64H, 65H, 6EH, 73H, 69H, 74H       ; 00C0 _ , densit
        db 79H, 20H, 2DH, 20H, 25H, 66H, 20H, 0AH       ; 00C8 _ y - %f .
        db 00H                                          ; 00D0 _ .

?_046:                                                  ; byte
        db 25H, 66H, 20H, 25H, 69H, 00H                 ; 00D1 _ %f %i.

?_047:                                                  ; byte
        db 53H, 70H, 68H, 65H, 72H, 65H, 2CH, 20H       ; 00D7 _ Sphere, 
        db 72H, 61H, 64H, 69H, 75H, 73H, 20H, 2DH       ; 00DF _ radius -
        db 20H, 25H, 69H, 00H                           ; 00E7 _  %i.

?_048:                                                  ; byte
        db 25H, 66H, 20H, 25H, 69H, 20H, 25H, 69H       ; 00EB _ %f %i %i
        db 20H, 25H, 69H, 00H, 00H                      ; 00F3 _  %i..

?_049:                                                  ; byte
        db 50H, 61H, 72H, 61H, 6CH, 6CH, 65H, 6CH       ; 00F8 _ Parallel
        db 65H, 70H, 69H, 70H, 65H, 64H, 2CH, 20H       ; 0100 _ epiped, 
        db 66H, 69H, 72H, 73H, 74H, 20H, 65H, 64H       ; 0108 _ first ed
        db 67H, 65H, 20H, 2DH, 20H, 25H, 69H, 2CH       ; 0110 _ ge - %i,
        db 20H, 73H, 65H, 63H, 6FH, 6EH, 64H, 20H       ; 0118 _  second 
        db 65H, 64H, 67H, 65H, 20H, 2DH, 20H, 25H       ; 0120 _ edge - %
        db 69H, 2CH, 20H, 74H, 68H, 69H, 72H, 64H       ; 0128 _ i, third
        db 20H, 65H, 64H, 67H, 65H, 20H, 2DH, 20H       ; 0130 _  edge - 
        db 25H, 69H, 00H                                ; 0138 _ %i.

?_050:                                                  ; byte
        db 54H, 65H, 74H, 72H, 61H, 68H, 65H, 64H       ; 013B _ Tetrahed
        db 72H, 6FH, 6EH, 2CH, 20H, 65H, 64H, 67H       ; 0143 _ ron, edg
        db 65H, 20H, 2DH, 20H, 25H, 69H, 00H, 00H       ; 014B _ e - %i..
        db 00H, 00H, 00H, 00H, 00H                      ; 0153 _ .....

?_051:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 34H, 20H, 61H       ; 0158 _ Only 4 a
        db 72H, 67H, 75H, 6DH, 65H, 6EH, 74H, 73H       ; 0160 _ rguments
        db 20H, 63H, 61H, 6EH, 20H, 62H, 65H, 20H       ; 0168 _  can be 
        db 65H, 6EH, 74H, 65H, 72H, 65H, 64H, 21H       ; 0170 _ entered!
        db 00H                                          ; 0178 _ .

?_052:                                                  ; byte
        db 72H, 61H, 6EH, 64H, 6FH, 6DH, 00H            ; 0179 _ random.

?_053:                                                  ; byte
        db 77H, 00H                                     ; 0180 _ w.

?_054:                                                  ; byte
        db 66H, 69H, 6CH, 65H, 00H                      ; 0182 _ file.

?_055:                                                  ; byte
        db 72H, 00H                                     ; 0187 _ r.

?_056:                                                  ; byte
        db 54H, 68H, 69H, 73H, 20H, 66H, 69H, 6CH       ; 0189 _ This fil
        db 65H, 20H, 64H, 6FH, 65H, 73H, 20H, 6EH       ; 0191 _ e does n
        db 6FH, 74H, 20H, 65H, 78H, 69H, 73H, 74H       ; 0199 _ ot exist
        db 73H, 21H, 00H, 00H, 00H, 00H, 00H            ; 01A1 _ s!.....

?_057:                                                  ; byte
        db 54H, 68H, 69H, 73H, 20H, 63H, 6FH, 6DH       ; 01A8 _ This com
        db 6DH, 61H, 6EH, 64H, 20H, 69H, 73H, 20H       ; 01B0 _ mand is 
        db 6EH, 6FH, 74H, 20H, 61H, 76H, 61H, 69H       ; 01B8 _ not avai
        db 6CH, 61H, 62H, 6CH, 65H, 21H, 00H            ; 01C0 _ lable!.

?_058:                                                  ; byte
        db 0AH, 20H, 41H, 66H, 74H, 65H, 72H, 20H       ; 01C7 _ . After 
        db 73H, 68H, 61H, 6BH, 65H, 72H, 20H, 73H       ; 01CF _ shaker s
        db 6FH, 72H, 74H, 2EH, 2EH, 2EH, 20H, 0AH       ; 01D7 _ ort... .
        db 00H                                          ; 01DF _ .

?_059:                                                  ; byte
        db 0AH, 20H, 50H, 72H, 6FH, 67H, 72H, 61H       ; 01E0 _ . Progra
        db 6DH, 20H, 68H, 61H, 73H, 20H, 74H, 65H       ; 01E8 _ m has te
        db 72H, 6DH, 69H, 6EH, 61H, 74H, 65H, 64H       ; 01F0 _ rminated
        db 20H, 3AH, 29H, 20H, 00H, 00H, 00H, 00H       ; 01F8 _  :) ....

?_060:  dq 400921FB54442D18H                            ; 0200 _ 3.141592653589793 

?_061:  dq 4010000000000000H                            ; 0208 _ 4.0 

?_062:  dq 4008000000000000H                            ; 0210 _ 3.0 

?_063:  dq 3FBE2B7DDDFEFA67H                            ; 0218 _ 0.1178511301977579 

?_064:  dq 41DFFFFFFFC00000H                            ; 0220 _ 2147483647.0 


