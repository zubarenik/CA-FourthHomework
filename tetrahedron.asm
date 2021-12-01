global tetrahedronFileInput: function
global tetrahedronRandomInput: function
global tetrahedronFileOutput: function
global tetrahedronVolume: function


SECTION .text                                           ; code

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
        lea     rsi, [rel ?_t1]                        ; 0936 _ 48: 8D. 35, 00000000(rel)
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
        mov     esi, 1000                              ; 0962 _ BE, 00002710
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
        lea     rsi, [rel ?_t2]                        ; 0998 _ 48: 8D. 35, 00000000(rel)
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
        movsd   xmm0, qword [rel ?_t3]                 ; 09C5 _ F2: 0F 10. 05, 00000000(rel)
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


SECTION .rodata                                         ; const

?_t1:                                                   ; byte
        db 25H, 66H, 20H, 25H, 69H, 00H                 ; %f %i.

?_t2:                                                   ; byte
        db 54H, 65H, 74H, 72H, 61H, 68H, 65H, 64H       ; Tetrahed
        db 72H, 6FH, 6EH, 2CH, 20H, 65H, 64H, 67H       ; ron, edg
        db 65H, 20H, 2DH, 20H, 25H, 69H, 00H, 00H       ; e - %i..
        db 00H, 00H, 00H, 00H, 00H                      ; .....

?_t3:  dq 3FBE2B7DDDFEFA67H                             ; 0.1178511301977579 
