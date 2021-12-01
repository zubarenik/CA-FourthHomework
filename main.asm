default rel

global main: function
global _start: function

extern exit                                             
extern fwrite                                           
extern fclose                                           
extern fopen                                            
extern atoi                                             
extern strcmp                                           
extern srand                                            
extern time                                             
extern rand                                             
extern fprintf                                          
extern puts                                             
extern __isoc99_fscanf                                  
extern printf                                           
extern _GLOBAL_OFFSET_TABLE_                            
extern malloc                                           


%include "container.asm"


SECTION .text                                           ; code                                           

main:   
        endbr64                                         
        push    rbp                                     
        mov     rbp, rsp                                
        sub     rsp, 64                                 
        mov     dword [rbp-34H], edi                    
        mov     qword [rbp-40H], rsi                    
        cmp     dword [rbp-34H], 4                      
        jz      ?_m1                                   
        lea     rdi, [rel ?_m7]                        
        mov     eax, 0                                  
        call    printf                                  
        mov     eax, 0                                  
        jmp     ?_m6                                   

?_m1:   mov     eax, 0                                  
        call    init                                    
        mov     qword [rbp-30H], rax                    
        mov     qword [rbp-28H], rdx                    
        mov     edi, 0                                  
        call    time                                    
        mov     edi, eax                                
        call    srand                                   
        mov     rax, qword [rbp-40H]                    
        add     rax, 8                                  
        mov     rax, qword [rax]                        
        lea     rsi, [rel ?_m8]                        
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_m2                                   
        mov     rax, qword [rbp-40H]                    
        add     rax, 16                                 
        mov     rax, qword [rax]                        
        mov     rdi, rax                                
        call    atoi                                    
        mov     dword [rbp-0CH], eax                    
        mov     edx, dword [rbp-0CH]                    
        lea     rax, [rbp-30H]                          
        mov     esi, edx                                
        mov     rdi, rax                                
        call    randomInput                             
        jmp     ?_m5                                   

?_m2:   mov     rax, qword [rbp-40H]                    
        add     rax, 8                                  
        mov     rax, qword [rax]                        
        lea     rsi, [rel ?_m9]                        
        mov     rdi, rax                                
        call    strcmp                                  
        test    eax, eax                                
        jnz     ?_m4                                   
        mov     rax, qword [rbp-40H]                    
        add     rax, 16                                 
        mov     rax, qword [rax]                        
        lea     rsi, [rel ?_m10]                        
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-8H], rax                     
        cmp     qword [rbp-8H], 0                       
        jnz     ?_m3                                   
        lea     rdi, [rel ?_m11]                        
        mov     eax, 0                                  
        call    printf                                  
        mov     eax, 0                                  
        jmp     ?_m6                                   

?_m3:   mov     rdx, qword [rbp-8H]                     
        lea     rax, [rbp-30H]                          
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fileInput                               
        mov     rax, qword [rbp-8H]                     
        mov     rdi, rax                                
        call    fclose                                  
        jmp     ?_m5                                   

?_m4:   lea     rdi, [rel ?_m12]                        
        mov     eax, 0                                  
        call    printf                                  
        mov     eax, 0                                  
        jmp     ?_m6                                   

?_m5:   mov     rax, qword [rbp-40H]                    
        add     rax, 24                                 
        mov     rax, qword [rax]                        
        lea     rsi, [rel ?_m13]                        
        mov     rdi, rax                                
        call    fopen                                   
        mov     qword [rbp-18H], rax                    
        mov     rdx, qword [rbp-18H]                    
        lea     rax, [rbp-30H]                          
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fileOutput                              
        lea     rax, [rbp-30H]                          
        mov     rdi, rax                                
        call    shakerSort                              
        mov     rax, qword [rbp-18H]                    
        mov     rcx, rax                                
        mov     edx, 24                                 
        mov     esi, 1                                  
        lea     rdi, [rel ?_m14]                        
        call    fwrite                                  
        mov     rdx, qword [rbp-18H]                    
        lea     rax, [rbp-30H]                          
        mov     rsi, rdx                                
        mov     rdi, rax                                
        call    fileOutput                              
        mov     rax, qword [rbp-18H]                    
        mov     rdi, rax                                
        call    fclose                                  
        lea     rax, [rbp-30H]                          
        mov     rdi, rax                                
        call    clear                                   
        lea     rdi, [rel ?_m15]                        
        call    puts                                    
        mov     eax, 0                                  
?_m6:   leave                                           
        ret                                             


_start: 
        endbr64                                         
        mov     rdi, qword [rsp]                        
        mov     rsi, rsp                                
        add     rsi, 8                                  
        call    main                                    
        xor     rdi, rdi                                
        call    exit                                    
        nop                                             
        ud2                                             


SECTION .data                                           


SECTION .bss                                            


SECTION .rodata                                         ; const

?_m7:                                                   ; byte
        db 4FH, 6EH, 6CH, 79H, 20H, 34H, 20H, 61H       ; Only 4 a
        db 72H, 67H, 75H, 6DH, 65H, 6EH, 74H, 73H       ; rguments
        db 20H, 63H, 61H, 6EH, 20H, 62H, 65H, 20H       ;  can be 
        db 65H, 6EH, 74H, 65H, 72H, 65H, 64H, 21H       ; entered!
        db 00H                                          ; .

?_m8:                                                   ; byte
        db 72H, 61H, 6EH, 64H, 6FH, 6DH, 00H            ; random.

?_m9:                                                   ; byte
        db 66H, 69H, 6CH, 65H, 00H                      ; file.

?_m10:                                                  ; byte
        db 72H, 00H                                     ; r.

?_m11:                                                  ; byte
        db 54H, 68H, 69H, 73H, 20H, 66H, 69H, 6CH       ; This fil
        db 65H, 20H, 64H, 6FH, 65H, 73H, 20H, 6EH       ; e does n
        db 6FH, 74H, 20H, 65H, 78H, 69H, 73H, 74H       ; ot exist
        db 73H, 21H, 00H, 00H, 00H, 00H, 00H, 00H       ; s!......
        db 00H                                          ; .

?_m12:                                                  ; byte
        db 54H, 68H, 69H, 73H, 20H, 63H, 6FH, 6DH       ; This com
        db 6DH, 61H, 6EH, 64H, 20H, 69H, 73H, 20H       ; mand is 
        db 6EH, 6FH, 74H, 20H, 61H, 76H, 61H, 69H       ; not avai
        db 6CH, 61H, 62H, 6CH, 65H, 21H, 00H            ; lable!.

?_m13:                                                  ; byte
        db 77H, 00H                                     ; w.

?_m14:                                                  ; byte
        db 0AH, 20H, 41H, 66H, 74H, 65H, 72H, 20H       ; . After 
        db 73H, 68H, 61H, 6BH, 65H, 72H, 20H, 73H       ; shaker s
        db 6FH, 72H, 74H, 2EH, 2EH, 2EH, 20H, 0AH       ; ort... .
        db 00H                                          ; .

?_m15:                                                  ; byte
        db 0AH, 20H, 50H, 72H, 6FH, 67H, 72H, 61H       ; . Progra
        db 6DH, 20H, 68H, 61H, 73H, 20H, 74H, 65H       ; m has te
        db 72H, 6DH, 69H, 6EH, 61H, 74H, 65H, 64H       ; rminated
        db 20H, 3AH, 29H, 20H, 00H, 00H                 ;  :) ..
