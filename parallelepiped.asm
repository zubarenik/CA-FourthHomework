global parallelepipedFileInput: function
global parallelepipedRandomInput: function
global parallelepipedFileOutput: function
global parallelepipedVolume: function


SECTION .text                                           ; code                                           

parallelepipedFileInput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     qword [rbp-18H], rdx                    
        mov     rax, qword [rbp-8H]                     
        lea     rdi, [rax+8H]                           
        mov     rax, qword [rbp-8H]                     
        lea     rsi, [rax+4H]                           
        mov     rcx, qword [rbp-8H]                     
        mov     rdx, qword [rbp-18H]                    
        mov     rax, qword [rbp-10H]                    
        mov     r9, rdi                                 
        mov     r8, rsi                                 
        lea     rsi, [rel ?_p1]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        cmp     eax, -1                                 
        setne   al                                      
        leave                                           
        ret                                             


parallelepipedRandomInput:
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
        mov     esi, 1000                              
        mov     edi, 1                                  
        call    randomInt                               
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+4H], eax                     
        mov     esi, 1000                              
        mov     edi, 1                                  
        call    randomInt                               
        mov     rdx, qword [rbp-8H]                     
        mov     dword [rdx+8H], eax                     
        nop                                             
        leave                                           
        ret                                             


parallelepipedFileOutput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     esi, dword [rax+8H]                     
        mov     rax, qword [rbp-8H]                     
        mov     ecx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-10H]                    
        mov     r8d, esi                                
        lea     rsi, [rel ?_p2]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


parallelepipedVolume:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax]                        
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+4H]                     
        imul    edx, eax                                
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+8H]                     
        imul    eax, edx                                
        cvtsi2ss xmm0, eax                              
        pop     rbp                                     
        ret                                             


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
