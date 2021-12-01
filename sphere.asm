global sphereFileInput: function
global sphereRandomInput: function
global sphereFileOutput: function
global sphereVolume: function


SECTION .text                                           ; code


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
        lea     rsi, [rel ?_s1]                        ; 0721 _ 48: 8D. 35, 00000000(rel)
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
        mov     esi, 1000                              ; 074D _ BE, 00002710
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
        lea     rsi, [rel ?_s2]                        ; 0783 _ 48: 8D. 35, 00000000(rel)
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
        movsd   xmm0, qword [rel ?_s3]                  ; 07B0 _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm1, xmm0                              ; 07B8 _ F2: 0F 59. C8
        mov     rax, qword [rbp-8H]                     ; 07BC _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 07C0 _ 8B. 00
        cvtsi2sd xmm0, eax                              ; 07C2 _ F2: 0F 2A. C0
        mulsd   xmm1, xmm0                              ; 07C6 _ F2: 0F 59. C8
        mov     rax, qword [rbp-8H]                     ; 07CA _ 48: 8B. 45, F8
        mov     eax, dword [rax]                        ; 07CE _ 8B. 00
        cvtsi2sd xmm0, eax                              ; 07D0 _ F2: 0F 2A. C0
        mulsd   xmm1, xmm0                              ; 07D4 _ F2: 0F 59. C8
        movsd   xmm0, qword [rel ?_s4]                 ; 07D8 _ F2: 0F 10. 05, 00000000(rel)
        mulsd   xmm0, xmm1                              ; 07E0 _ F2: 0F 59. C1
        movsd   xmm1, qword [rel ?_s5]                 ; 07E4 _ F2: 0F 10. 0D, 00000000(rel)
        divsd   xmm0, xmm1                              ; 07EC _ F2: 0F 5E. C1
        cvtsd2ss xmm0, xmm0                             ; 07F0 _ F2: 0F 5A. C0
        pop     rbp                                     ; 07F4 _ 5D
        ret                                             ; 07F5 _ C3
; sphereVolume End of function


SECTION .rodata                                         ; const

?_s1:                                                   ; byte
        db 25H, 66H, 20H, 25H, 69H, 00H                 ; %f %i.

?_s2:                                                   ; byte
        db 53H, 70H, 68H, 65H, 72H, 65H, 2CH, 20H       ; Sphere, 
        db 72H, 61H, 64H, 69H, 75H, 73H, 20H, 2DH       ; radius -
        db 20H, 25H, 69H, 00H                           ; %i.

?_s3:  dq 400921FB54442D18H                             ; 3.141592653589793 

?_s4:  dq 4010000000000000H                             ; 4.0 

?_s5:  dq 4008000000000000H                             ; 3.0 
