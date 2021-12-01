global randomInt: function
global randomFloat: function


SECTION .text                                           ; code

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
        movsd   xmm1, qword [rel ?_r1]                 ; 0A2E _ F2: 0F 10. 0D, 00000000(rel)
        divsd   xmm0, xmm1                              ; 0A36 _ F2: 0F 5E. C1
        cvtsd2ss xmm0, xmm0                             ; 0A3A _ F2: 0F 5A. C0
        pop     rbp                                     ; 0A3E _ 5D
        ret                                             ; 0A3F _ C3
; randomFloat End of function


SECTION .rodata                                         ; const

?_r1:  dq 41DFFFFFFFC00000H                             ; 2147483647.0 

