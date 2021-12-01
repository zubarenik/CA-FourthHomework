global randomInt: function
global randomFloat: function


SECTION .text                                           ; code                                           

randomInt:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     dword [rbp-4H], edi                     
        mov     dword [rbp-8H], esi                     
        call    rand                                    
        mov     edx, dword [rbp-8H]                     
        sub     edx, dword [rbp-4H]                     
        lea     ecx, [rdx+1H]                           
        cdq                                             
        idiv    ecx                                     
        mov     eax, dword [rbp-4H]                     
        add     eax, edx                                
        leave                                           
        ret                                             


randomFloat:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        call    rand                                    
        cvtsi2sd xmm0, eax                              
        movsd   xmm1, qword [rel ?_r1]                 
        divsd   xmm0, xmm1                              
        cvtsd2ss xmm0, xmm0                             
        pop     rbp                                     
        ret                                             


SECTION .rodata                                         

?_r1:  dq 41DFFFFFFFC00000H                             ; 2147483647.0 
