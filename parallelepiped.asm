global parallelepipedFileInput: function
global parallelepipedRandomInput: function
global parallelepipedFileOutput: function
global parallelepipedVolume: function


SECTION .text                                           ; code

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
        lea     rsi, [rel ?_p1]                        ; 0830 _ 48: 8D. 35, 00000000(rel)
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
        mov     esi, 1000                              ; 085C _ BE, 00002710
        mov     edi, 1                                  ; 0861 _ BF, 00000001
        call    randomInt                               ; 0866 _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 086B _ 48: 8B. 55, F8
        mov     dword [rdx], eax                        ; 086F _ 89. 02
        mov     esi, 1000                              ; 0871 _ BE, 00002710
        mov     edi, 1                                  ; 0876 _ BF, 00000001
        call    randomInt                               ; 087B _ E8, 00000000(PLT r)
        mov     rdx, qword [rbp-8H]                     ; 0880 _ 48: 8B. 55, F8
        mov     dword [rdx+4H], eax                     ; 0884 _ 89. 42, 04
        mov     esi, 1000                              ; 0887 _ BE, 00002710
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
        lea     rsi, [rel ?_p2]                        ; 08CF _ 48: 8D. 35, 00000000(rel)
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


SECTION .rodata                                         ; const

?_p1:                                                   ; byte
        db 25H, 66H, 20H, 25H, 69H, 20H, 25H, 69H       ; %f %i %i
        db 20H, 25H, 69H, 00H, 00H                      ; %i..

?_p2:                                                   ; byte
        db 50H, 61H, 72H, 61H, 6CH, 6CH, 65H, 6CH       ; Parallel
        db 65H, 70H, 69H, 70H, 65H, 64H, 2CH, 20H       ; epiped, 
        db 66H, 69H, 72H, 73H, 74H, 20H, 65H, 64H       ; first ed
        db 67H, 65H, 20H, 2DH, 20H, 25H, 69H, 2CH       ; ge - %i,
        db 20H, 73H, 65H, 63H, 6FH, 6EH, 64H, 20H       ;  second 
        db 65H, 64H, 67H, 65H, 20H, 2DH, 20H, 25H       ; edge - %
        db 69H, 2CH, 20H, 74H, 68H, 69H, 72H, 64H       ; i, third
        db 20H, 65H, 64H, 67H, 65H, 20H, 2DH, 20H       ;  edge - 
        db 25H, 69H, 00H                                ; %i.
