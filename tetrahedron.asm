global tetrahedronFileInput: function
global tetrahedronRandomInput: function
global tetrahedronFileOutput: function
global tetrahedronVolume: function


SECTION .text                                           ; code                                           

tetrahedronFileInput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     qword [rbp-18H], rdx                    
        mov     rcx, qword [rbp-8H]                     
        mov     rdx, qword [rbp-18H]                    
        mov     rax, qword [rbp-10H]                    
        lea     rsi, [rel ?_t1]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        cmp     eax, -1                                 
        setne   al                                      
        leave                                           
        ret                                             


tetrahedronRandomInput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     esi, 1000                              
        mov     edi, 1                                  
        call    randomInt                               
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx], eax                        
        nop                                             
        leave                                           
        ret                                             


tetrahedronFileOutput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-10H]                    
        lea     rsi, [rel ?_t2]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


tetrahedronVolume:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cvtsi2sd xmm1, eax                              
        movsd   xmm0, qword [rel ?_t3]                 
        mulsd   xmm1, xmm0                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cvtsi2sd xmm0, eax                              
        mulsd   xmm1, xmm0                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cvtsi2sd xmm0, eax                              
        mulsd   xmm0, xmm1                              
        cvtsd2ss xmm0, xmm0                             
        pop     rbp                                     
        ret                                             


SECTION .rodata                                         ; const

?_t1:                                                   ; byte
        db 25H, 66H, 20H, 25H, 69H, 00H                 ; %f %i.

?_t2:                                                   ; byte
        db 54H, 65H, 74H, 72H, 61H, 68H, 65H, 64H       ; Tetrahed
        db 72H, 6FH, 6EH, 2CH, 20H, 65H, 64H, 67H       ; ron, edg
        db 65H, 20H, 2DH, 20H, 25H, 69H, 00H, 00H       ; e - %i..
        db 00H, 00H, 00H, 00H, 00H                      ; .....

?_t3:  dq 3FBE2B7DDDFEFA67H                             ; 0.1178511301977579                            
