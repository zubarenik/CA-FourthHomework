global fileInputFigure: function
global randomInputFigure: function
global fileOutputFigure: function
global volume: function


%include "random.asm"
%include "sphere.asm"
%include "parallelepiped.asm"
%include "tetrahedron.asm"


SECTION .text                                           ; code                                           

fileInputFigure:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     dword [rbp-14H], edx                    
        cmp     dword [rbp-14H], 1                      
        jnz     ?_f1                                   
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax], 0                          
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-8H]                     
        lea     rcx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rcx                                
        call    sphereFileInput                         
        jmp     ?_f4                                   

?_f1:   cmp     dword [rbp-14H], 2                      
        jnz     ?_f2                                   
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax], 1                          
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-8H]                     
        lea     rcx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rcx                                
        call    parallelepipedFileInput                 
        jmp     ?_f4                                   

?_f2:   cmp     dword [rbp-14H], 3                      
        jnz     ?_f3                                   
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax], 2                          
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+4H]                           
        mov     rax, qword [rbp-8H]                     
        lea     rcx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rcx                                
        call    tetrahedronFileInput                    
        jmp     ?_f4                                   

?_f3:   lea     rdi, [rel ?_f14]                        
        call    puts                                    
        mov     eax, 0                                  
?_f4:   leave                                           
        ret                                             


randomInputFigure:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     eax, 0                                  
        call    randomFloat                             
        movd    eax, xmm0                               
        mov     rdx, qword [rbp-18H]                    
        mov     dword [rdx+4H], eax                     
        mov     esi, 3                                  
        mov     edi, 1                                  
        call    randomInt                               
        mov     dword [rbp-4H], eax                     
        cmp     dword [rbp-4H], 1                       
        jnz     ?_f5                                   
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax], 0                          
        mov     rax, qword [rbp-18H]                    
        add     rax, 8                                  
        mov     rdi, rax                                
        call    sphereRandomInput                       
        jmp     ?_f7                                   

?_f5:   cmp     dword [rbp-4H], 2                       
        jnz     ?_f6                                   
        mov     rax, qword [rbp-18H]                    
        mov     dword [rax], 1                          
        mov     rax, qword [rbp-18H]                    
        add     rax, 8                                  
        mov     rdi, rax                                
        call    parallelepipedRandomInput               
        jmp     ?_f7                                   

?_f6:   mov     rax, qword [rbp-18H]                    
        mov     dword [rax], 2                          
        mov     rax, qword [rbp-18H]                    
        add     rax, 8                                  
        mov     rdi, rax                                
        call    tetrahedronRandomInput                  
?_f7:  nop                                             
        leave                                           
        ret                                             


fileOutputFigure:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     qword [rbp-10H], rsi                    
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        test    eax, eax                                
        jnz     ?_f8                                   
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    sphereFileOutput                        
        jmp     ?_f10                                   

?_f8:   mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 1                                  
        jnz     ?_f9                                   
        mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    parallelepipedFileOutput                
        jmp     ?_f10                                   

?_f9:   mov     rax, qword [rbp-8H]                     
        lea     rdx, [rax+8H]                           
        mov     rax, qword [rbp-10H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    tetrahedronFileOutput                   
?_f10:  mov     rax, qword [rbp-8H]                     
        movss   xmm0, dword [rax+4H]                    
        cvtss2sd xmm0, xmm0                             
        mov     rax, qword [rbp-10H]                    
        lea     rsi, [rel ?_f15]                        
        mov     rdi, rax                                
        mov     eax, 1                                  
        call    fprintf                                 
        nop                                             
        leave                                           
        ret                                             


volume: 
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        test    eax, eax                                
        jnz     ?_f11                                   
        mov     rax, qword [rbp-8H]                     
        add     rax, 8                                  
        mov     rdi, rax                                
        call    sphereVolume                            
        jmp     ?_f13                                   

?_f11:  mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     eax, 1                                  
        jnz     ?_f12                                   
        mov     rax, qword [rbp-8H]                     
        add     rax, 8                                  
        mov     rdi, rax                                
        call    parallelepipedVolume                    
        jmp     ?_f13                                   

?_f12:  mov     rax, qword [rbp-8H]                     
        add     rax, 8                                  
        mov     rdi, rax                                
        call    tetrahedronVolume                       

?_f13:  leave                                           
        ret                                             


SECTION .rodata                                         ; const

?_f14:                                                  ; byte
        db 41H, 6EH, 20H, 6FH, 62H, 6AH, 65H, 63H       ; An objec
        db 74H, 20H, 6FH, 66H, 20H, 74H, 68H, 69H       ; t of thi
        db 73H, 20H, 74H, 79H, 70H, 65H, 20H, 64H       ; s type d
        db 6FH, 65H, 73H, 20H, 6EH, 6FH, 74H, 20H       ; oes not 
        db 65H, 78H, 69H, 73H, 74H, 21H, 20H, 00H       ; exist! .

?_f15:                                                  ; byte
        db 2CH, 20H, 64H, 65H, 6EH, 73H, 69H, 74H       ; densit
        db 79H, 20H, 2DH, 20H, 25H, 66H, 20H, 0AH       ; y - %f .
        db 00H                                          ; .                                         
