global sphereFileInput: function
global sphereRandomInput: function
global sphereFileOutput: function
global sphereVolume: function


SECTION .text                                           ; code                                           

sphereFileInput:
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
        lea     rsi, [rel ?_s1]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        cmp     eax, -1                                 
        setne   al                                      
        leave                                           
        ret                                             


sphereRandomInput:
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


sphereFileOutput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-10H]                    
        lea     rsi, [rel ?_s2]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


sphereVolume:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cvtsi2sd xmm1, eax                              
        movsd   xmm0, qword [rel ?_s3]                  
        mulsd   xmm1, xmm0                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cvtsi2sd xmm0, eax                              
        mulsd   xmm1, xmm0                              
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cvtsi2sd xmm0, eax                              
        mulsd   xmm1, xmm0                              
        movsd   xmm0, qword [rel ?_s4]                 
        mulsd   xmm0, xmm1                              
        movsd   xmm1, qword [rel ?_s5]                 
        divsd   xmm0, xmm1                              
        cvtsd2ss xmm0, xmm0                             
        pop     rbp                                     
        ret                                             


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
