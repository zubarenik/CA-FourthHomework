global init: function
global clear: function
global fileInput: function
global randomInput: function
global fileOutput: function
global swap: function
global shakerSort: function


%include "figure.asm"


SECTION .text                                           ; code                                           

init:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-10H], 0                      
        mov     qword [rbp-8H], 0                       
        mov     dword [rbp-10H], 10000                  
        mov     eax, dword [rbp-10H]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        mov     rdi, rax                                
        call    malloc                                  
        mov     qword [rbp-8H], rax                     
        mov     rax, qword [rbp-10H]                    
        mov     rdx, qword [rbp-8H]                     
        leave                                           
        ret                                             


clear:  
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-8H], rdi                     
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax+4H], 0                       
        mov     rax, qword [rbp-8H]                     
        mov     qword [rax+8H], 0                       
        nop                                             
        pop     rbp                                     
        ret                                             


fileInput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 64                                 
        mov     qword [rbp-38H], rdi                    
        mov     qword [rbp-40H], rsi                    
        mov     dword [rbp-24H], 0                      
        jmp     ?_c4                                   

?_c1:   mov     byte [rbp-1H], 1                        
        mov     rax, qword [rbp-38H]                    
        mov     edx, dword [rax+4H]                     
        mov     rax, qword [rbp-38H]                    
        mov     eax, dword [rax]                        
        cmp     edx, eax                                
        jnz     ?_c2                                   
        mov     byte [rbp-1H], 0                        
?_c2:   mov     edx, dword [rbp-24H]                    
        mov     rcx, qword [rbp-40H]                    
        lea     rax, [rbp-20H]                          
        mov     rsi, rcx                                
        mov     rdi, rax                                
        call    fileInputFigure                         
        mov     byte [rbp-1H], al                       
        movzx   eax, byte [rbp-1H]                      
        xor     eax, 01H                                
        test    al, al                                  
        jz      ?_c3                                   
        mov     rax, qword [rbp-38H]                    
        mov     eax, dword [rax+4H]                     
        mov     esi, eax                                
        lea     rdi, [rel ?_c19]                        
        mov     eax, 0                                  
        call    printf                                  
        jmp     ?_c5                                   

?_c3:   mov     rax, qword [rbp-38H]                    
        mov     rcx, qword [rax+8H]                     
        mov     rax, qword [rbp-38H]                    
        mov     eax, dword [rax+4H]                     
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        add     rcx, rax                                
        mov     rax, qword [rbp-20H]                    
        mov     rdx, qword [rbp-18H]                    
        mov     qword [rcx], rax                        
        mov     qword [rcx+8H], rdx                     
        mov     eax, dword [rbp-10H]                    
        mov     dword [rcx+10H], eax                    
        mov     rax, qword [rbp-38H]                    
        mov     eax, dword [rax+4H]                     
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-38H]                    
        mov     dword [rax+4H], edx                     
?_c4:   lea     rdx, [rbp-24H]                          
        mov     rax, qword [rbp-40H]                    
        lea     rsi, [rel ?_c20]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    __isoc99_fscanf                         
        cmp     eax, -1                                 
        jne     ?_c1                                   
        nop                                             
?_c5:   nop                                             
        leave                                           
        ret                                             


randomInput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 16                                 
        mov     qword [rbp-8H], rdi                     
        mov     dword [rbp-0CH], esi                    
        cmp     dword [rbp-0CH], 0                      
        jns     ?_c7                                   
        lea     rdi, [rel ?_c21]                        
        call    puts                                    
        jmp     ?_c8                                   

?_c6:   mov     rax, qword [rbp-8H]                     
        mov     rcx, qword [rax+8H]                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+4H]                     
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rcx                                
        mov     rdi, rax                                
        call    randomInputFigure                       
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+4H]                     
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-8H]                     
        mov     dword [rax+4H], edx                     
        mov     rax, qword [rbp-8H]                     
        mov     edx, dword [rax+4H]                     
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        cmp     edx, eax                                
        jnz     ?_c7                                   
        mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax]                        
        mov     esi, eax                                
        lea     rdi, [rel ?_c22]                        
        mov     eax, 0                                  
        call    printf                                  
        jmp     ?_c8                                   
?_c7:   mov     rax, qword [rbp-8H]                     
        mov     eax, dword [rax+4H]                     
        cmp     dword [rbp-0CH], eax                    
        jg      ?_c6                                   
?_c8:   leave                                           
        ret                                             


fileOutput:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     qword [rbp-20H], rsi                    
        mov     rax, qword [rbp-18H]                    
        mov     edx, dword [rax+4H]                     
        mov     rax, qword [rbp-20H]                    
        lea     rsi, [rel ?_c23]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     dword [rbp-4H], 0                       
        jmp     ?_c10                                   

?_c9:   mov     eax, dword [rbp-4H]                     
        lea     edx, [rax+1H]                           
        mov     rax, qword [rbp-20H]                    
        lea     rsi, [rel ?_c24]                        
        mov     rdi, rax                                
        mov     eax, 0                                  
        call    fprintf                                 
        mov     rax, qword [rbp-18H]                    
        mov     rcx, qword [rax+8H]                     
        mov     eax, dword [rbp-4H]                     
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        lea     rdx, [rcx+rax]                          
        mov     rax, qword [rbp-20H]                    
        mov     rsi, rax                                
        mov     rdi, rdx                                
        call    fileOutputFigure                        
        add     dword [rbp-4H], 1                       
?_c10:  mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+4H]                     
        cmp     dword [rbp-4H], eax                     
        jl      ?_c9                                   
        nop                                             
        nop                                             
        leave                                           
        ret                                             


swap:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        mov     qword [rbp-28H], rdi                    
        mov     dword [rbp-2CH], esi                    
        mov     eax, dword [rbp-2CH]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-28H]                    
        lea     rcx, [rdx+rax]                          
        mov     rax, qword [rcx]                        
        mov     rdx, qword [rcx+8H]                     
        mov     qword [rbp-20H], rax                    
        mov     qword [rbp-18H], rdx                    
        mov     eax, dword [rcx+10H]                    
        mov     dword [rbp-10H], eax                    
        mov     eax, dword [rbp-2CH]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        lea     rdx, [rax-14H]                          
        mov     rax, qword [rbp-28H]                    
        lea     rsi, [rdx+rax]                          
        mov     eax, dword [rbp-2CH]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        mov     rdx, rax                                
        mov     rax, qword [rbp-28H]                    
        lea     rcx, [rdx+rax]                          
        mov     rax, qword [rsi]                        
        mov     rdx, qword [rsi+8H]                     
        mov     qword [rcx], rax                        
        mov     qword [rcx+8H], rdx                     
        mov     eax, dword [rsi+10H]                    
        mov     dword [rcx+10H], eax                    
        mov     eax, dword [rbp-2CH]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        lea     rdx, [rax-14H]                          
        mov     rax, qword [rbp-28H]                    
        lea     rcx, [rdx+rax]                          
        mov     rax, qword [rbp-20H]                    
        mov     rdx, qword [rbp-18H]                    
        mov     qword [rcx], rax                        
        mov     qword [rcx+8H], rdx                     
        mov     eax, dword [rbp-10H]                    
        mov     dword [rcx+10H], eax                    
        nop                                             
        pop     rbp                                     
        ret                                             


shakerSort:
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 32                                 
        mov     qword [rbp-18H], rdi                    
        mov     dword [rbp-4H], 1                       
        mov     rax, qword [rbp-18H]                    
        mov     eax, dword [rax+4H]                     
        sub     eax, 1                                  
        mov     dword [rbp-8H], eax                     
        jmp     ?_c18                                   

?_c11:  mov     eax, dword [rbp-8H]                     
        mov     dword [rbp-0CH], eax                    
        jmp     ?_c14                                   

?_c12:  mov     rax, qword [rbp-18H]                    
        mov     rcx, qword [rax+8H]                     
        mov     eax, dword [rbp-0CH]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        sub     rax, 20                                 
        add     rax, rcx                                
        mov     rdi, rax                                
        call    volume                                  
        movss   dword [rbp-1CH], xmm0                   
        mov     rax, qword [rbp-18H]                    
        mov     rcx, qword [rax+8H]                     
        mov     eax, dword [rbp-0CH]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rcx                                
        mov     rdi, rax                                
        call    volume                                  
        comiss  xmm0, dword [rbp-1CH]                   
        jbe     ?_c13                                   
        mov     rax, qword [rbp-18H]                    
        mov     rax, qword [rax+8H]                     
        mov     edx, dword [rbp-0CH]                    
        mov     esi, edx                                
        mov     rdi, rax                                
        call    swap                                    
?_c13:  sub     dword [rbp-0CH], 1                      
?_c14:  mov     eax, dword [rbp-0CH]                    
        cmp     eax, dword [rbp-4H]                     
        jge     ?_c12                                   
        add     dword [rbp-4H], 1                       
        mov     eax, dword [rbp-4H]                     
        mov     dword [rbp-10H], eax                    
        jmp     ?_c17                                   

?_c15:  mov     rax, qword [rbp-18H]                    
        mov     rcx, qword [rax+8H]                     
        mov     eax, dword [rbp-10H]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        sub     rax, 20                                 
        add     rax, rcx                                
        mov     rdi, rax                                
        call    volume                                  
        movss   dword [rbp-1CH], xmm0                   
        mov     rax, qword [rbp-18H]                    
        mov     rcx, qword [rax+8H]                     
        mov     eax, dword [rbp-10H]                    
        movsxd  rdx, eax                                
        mov     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rdx                                
        shl     rax, 2                                  
        add     rax, rcx                                
        mov     rdi, rax                                
        call    volume                                  
        comiss  xmm0, dword [rbp-1CH]                   
        jbe     ?_c16                                   
        mov     rax, qword [rbp-18H]                    
        mov     rax, qword [rax+8H]                     
        mov     edx, dword [rbp-10H]                    
        mov     esi, edx                                
        mov     rdi, rax                                
        call    swap                                    
?_c16:  add     dword [rbp-10H], 1                      
?_c17:  mov     eax, dword [rbp-10H]                    
        cmp     eax, dword [rbp-8H]                     
        jle     ?_c15                                   
        sub     dword [rbp-8H], 1                       
?_c18:  mov     eax, dword [rbp-4H]                     
        cmp     eax, dword [rbp-8H]                     
        jle     ?_c11                                   
        nop                                             
        nop                                             
        leave                                           
        ret                                             


SECTION .rodata                                         

?_c19:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 74H, 68H, 65H       ; Only the
        db 20H, 66H, 69H, 72H, 73H, 74H, 20H, 25H       ; first %
        db 69H, 20H, 6FH, 62H, 6AH, 65H, 63H, 74H       ; i object
        db 73H, 20H, 61H, 72H, 65H, 20H, 6CH, 6FH       ; s are lo
        db 61H, 64H, 65H, 64H, 21H, 20H, 0AH, 00H       ; aded! ..

?_c20:                                                  ; byte
        db 25H, 69H, 00H                                ; %i.

?_c21:                                                  ; byte
        db 53H, 69H, 7AH, 65H, 20H, 6DH, 75H, 73H       ; Size mus
        db 74H, 20H, 62H, 65H, 20H, 6DH, 6FH, 72H       ; t be mor
        db 65H, 20H, 74H, 68H, 61H, 6EH, 20H, 7AH       ; e than z
        db 65H, 72H, 6FH, 21H, 20H, 00H, 00H, 00H       ; ero! ...
        db 00H, 00H, 00H, 00H, 00H                      ; .....

?_c22:                                                  ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 25H, 69H, 20H       ; Only %i 
        db 6FH, 62H, 6AH, 65H, 63H, 74H, 73H, 20H       ; objects 
        db 63H, 61H, 6EH, 20H, 62H, 65H, 20H, 63H       ; can be c
        db 72H, 65H, 61H, 74H, 65H, 64H, 21H, 20H       ; reated! 
        db 0AH, 00H                                     ; ..

?_c23:                                                  ; byte
        db 0AH, 20H, 43H, 6FH, 6EH, 74H, 61H, 69H       ; Contai
        db 6EH, 65H, 72H, 27H, 73H, 20H, 73H, 69H       ; ner's si
        db 7AH, 65H, 20H, 2DH, 20H, 25H, 69H, 20H       ; ze - %i 
        db 0AH, 00H                                     ; ..

?_c24:                                                  ; byte
        db 25H, 69H, 3AH, 20H, 00H, 00H, 00H, 00H       ; %i: ....
        db 00H, 00H, 00H, 00H                           ; ....                          
