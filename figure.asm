global fileInputFigure: function
global randomInputFigure: function
global fileOutputFigure: function
global volume: function


%include "random.asm"
%include "sphere.asm"
%include "parallelepiped.asm"
%include "tetrahedron.asm"


SECTION .text                                           ; code

fileInputFigure:; Function begin
        endbr64                                         ; 04B3 _ F3: 0F 1E. FA
        push    rbp                                     ; 04B7 _ 55
        mov     rbp, rsp                                ; 04B8 _ 48: 89. E5
        sub     rsp, 32                                 ; 04BB _ 48: 83. EC, 20
        mov     qword [rbp-8H], rdi                     ; 04BF _ 48: 89. 7D, F8
        mov     qword [rbp-10H], rsi                    ; 04C3 _ 48: 89. 75, F0
        mov     dword [rbp-14H], edx                    ; 04C7 _ 89. 55, EC
        cmp     dword [rbp-14H], 1                      ; 04CA _ 83. 7D, EC, 01
        jnz     ?_f1                                   ; 04CE _ 75, 2B
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
        jmp     ?_f4                                   ; 04F9 _ EB, 73

?_f1:  cmp     dword [rbp-14H], 2                      ; 04FB _ 83. 7D, EC, 02
        jnz     ?_f2                                   ; 04FF _ 75, 2B
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
        jmp     ?_f4                                   ; 052A _ EB, 42

?_f2:  cmp     dword [rbp-14H], 3                      ; 052C _ 83. 7D, EC, 03
        jnz     ?_f3                                   ; 0530 _ 75, 2B
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
        jmp     ?_f4                                   ; 055B _ EB, 11

?_f3:  lea     rdi, [rel ?_f14]                        ; 055D _ 48: 8D. 3D, 00000000(rel)
        call    puts                                    ; 0564 _ E8, 00000000(PLT r)
        mov     eax, 0                                  ; 0569 _ B8, 00000000
?_f4:  leave                                           ; 056E _ C9
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
        jnz     ?_f5                                   ; 05AB _ 75, 1C
        mov     rax, qword [rbp-18H]                    ; 05AD _ 48: 8B. 45, E8
        mov     dword [rax], 0                          ; 05B1 _ C7. 00, 00000000
        mov     rax, qword [rbp-18H]                    ; 05B7 _ 48: 8B. 45, E8
        add     rax, 8                                  ; 05BB _ 48: 83. C0, 08
        mov     rdi, rax                                ; 05BF _ 48: 89. C7
        call    sphereRandomInput                       ; 05C2 _ E8, 00000000(PLT r)
        jmp     ?_f7                                   ; 05C7 _ EB, 3C

?_f5:  cmp     dword [rbp-4H], 2                       ; 05C9 _ 83. 7D, FC, 02
        jnz     ?_f6                                   ; 05CD _ 75, 1C
        mov     rax, qword [rbp-18H]                    ; 05CF _ 48: 8B. 45, E8
        mov     dword [rax], 1                          ; 05D3 _ C7. 00, 00000001
        mov     rax, qword [rbp-18H]                    ; 05D9 _ 48: 8B. 45, E8
        add     rax, 8                                  ; 05DD _ 48: 83. C0, 08
        mov     rdi, rax                                ; 05E1 _ 48: 89. C7
        call    parallelepipedRandomInput               ; 05E4 _ E8, 00000000(PLT r)
        jmp     ?_f7                                   ; 05E9 _ EB, 1A

?_f6:  mov     rax, qword [rbp-18H]                    ; 05EB _ 48: 8B. 45, E8
        mov     dword [rax], 2                          ; 05EF _ C7. 00, 00000002
        mov     rax, qword [rbp-18H]                    ; 05F5 _ 48: 8B. 45, E8
        add     rax, 8                                  ; 05F9 _ 48: 83. C0, 08
        mov     rdi, rax                                ; 05FD _ 48: 89. C7
        call    tetrahedronRandomInput                  ; 0600 _ E8, 00000000(PLT r)
?_f7:  nop                                             ; 0605 _ 90
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
        jnz     ?_f8                                   ; 0624 _ 75, 19
        mov     rax, qword [rbp-8H]                     ; 0626 _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 062A _ 48: 8D. 50, 08
        mov     rax, qword [rbp-10H]                    ; 062E _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 0632 _ 48: 89. C6
        mov     rdi, rdx                                ; 0635 _ 48: 89. D7
        call    sphereFileOutput                        ; 0638 _ E8, 00000000(PLT r)
        jmp     ?_f10                                   ; 063D _ EB, 3B

?_f8:  mov     rax, qword [rbp-8H]                     ; 063F _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 0643 _ 8B. 00
        cmp     eax, 1                                  ; 0645 _ 83. F8, 01
        jnz     ?_f9                                   ; 0648 _ 75, 19
        mov     rax, qword [rbp-8H]                     ; 064A _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 064E _ 48: 8D. 50, 08
        mov     rax, qword [rbp-10H]                    ; 0652 _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 0656 _ 48: 89. C6
        mov     rdi, rdx                                ; 0659 _ 48: 89. D7
        call    parallelepipedFileOutput                ; 065C _ E8, 00000000(PLT r)
        jmp     ?_f10                                   ; 0661 _ EB, 17

?_f9:  mov     rax, qword [rbp-8H]                     ; 0663 _ 48: 8B. 45, F8
        lea     rdx, [rax+8H]                           ; 0667 _ 48: 8D. 50, 08
        mov     rax, qword [rbp-10H]                    ; 066B _ 48: 8B. 45, F0
        mov     rsi, rax                                ; 066F _ 48: 89. C6
        mov     rdi, rdx                                ; 0672 _ 48: 89. D7
        call    tetrahedronFileOutput                   ; 0675 _ E8, 00000000(PLT r)
?_f10:  mov     rax, qword [rbp-8H]                     ; 067A _ 48: 8B. 45, F8
        movss   xmm0, dword [rax+4H]                    ; 067E _ F3: 0F 10. 40, 04
        cvtss2sd xmm0, xmm0                             ; 0683 _ F3: 0F 5A. C0
        mov     rax, qword [rbp-10H]                    ; 0687 _ 48: 8B. 45, F0
        lea     rsi, [rel ?_f15]                        ; 068B _ 48: 8D. 35, 00000000(rel)
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
        jnz     ?_f11                                   ; 06BA _ 75, 12
        mov     rax, qword [rbp-8H]                     ; 06BC _ 48: 8B. 45, F8
        add     rax, 8                                  ; 06C0 _ 48: 83. C0, 08
        mov     rdi, rax                                ; 06C4 _ 48: 89. C7
        call    sphereVolume                            ; 06C7 _ E8, 00000000(PLT r)
        jmp     ?_f13                                   ; 06CC _ EB, 2D

?_f11:  mov     rax, qword [rbp-8H]                     ; 06CE _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 06D2 _ 8B. 00
        cmp     eax, 1                                  ; 06D4 _ 83. F8, 01
        jnz     ?_f12                                   ; 06D7 _ 75, 12
        mov     rax, qword [rbp-8H]                     ; 06D9 _ 48: 8B. 45, F8
        add     rax, 8                                  ; 06DD _ 48: 83. C0, 08
        mov     rdi, rax                                ; 06E1 _ 48: 89. C7
        call    parallelepipedVolume                    ; 06E4 _ E8, 00000000(PLT r)
        jmp     ?_f13                                   ; 06E9 _ EB, 10

?_f12:  mov     rax, qword [rbp-8H]                     ; 06EB _ 48: 8B. 45, F8
        add     rax, 8                                  ; 06EF _ 48: 83. C0, 08
        mov     rdi, rax                                ; 06F3 _ 48: 89. C7
        call    tetrahedronVolume                       ; 06F6 _ E8, 00000000(PLT r)

?_f13:  leave                                           ; 06FB _ C9
        ret                                             ; 06FC _ C3
; volume End of function


SECTION .rodata                                         ; const

?_f14:                                                  ; byte
        db 41H, 6EH, 20H, 6FH, 62H, 6AH, 65H, 63H       ; 0098 _ An objec
        db 74H, 20H, 6FH, 66H, 20H, 74H, 68H, 69H       ; 00A0 _ t of thi
        db 73H, 20H, 74H, 79H, 70H, 65H, 20H, 64H       ; 00A8 _ s type d
        db 6FH, 65H, 73H, 20H, 6EH, 6FH, 74H, 20H       ; 00B0 _ oes not 
        db 65H, 78H, 69H, 73H, 74H, 21H, 20H, 00H       ; 00B8 _ exist! .

?_f15:                                                  ; byte
        db 2CH, 20H, 64H, 65H, 6EH, 73H, 69H, 74H       ; 00C0 _ , densit
        db 79H, 20H, 2DH, 20H, 25H, 66H, 20H, 0AH       ; 00C8 _ y - %f .
        db 00H                                          ; 00D0 _ .
