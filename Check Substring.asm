;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO CHECK A STRING IS A SUBSTRING OF ANOTHER STRING OR NOT 


.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
TEXT DB 'HELLO WORLD','$'
PATTERN DB 'ORIO','$'  
FOUND DB 'SUBSTRING FOUND','$'
NOT_FOUND DB 'SUBSTRING NOT FOUND','$' 

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX        
                  
    MOV DI, -1
                  
    CHECK:
        MOV SI, -1
        
        ITERATE:  
            INC SI
            INC DI
            MOV AH, TEXT[DI]
            MOV AL, PATTERN[SI]  
            CMP AL, '$'
            JE FOUND_MSG
            CMP AH, AL  
            JE ITERATE
            JNE UPDATE_INDEX    
        
        UPDATE_INDEX:
            INC DI
            MOV AH, TEXT[DI]
            CMP AH, '$'
            JE NOT_FOUND_MSG
            JMP CHECK    
            
            
    FOUND_MSG:
        LEA DX, FOUND
        MOV AH, 9
        INT 21H
        JMP EXIT
        
    NOT_FOUND_MSG:
        LEA DX, NOT_FOUND
        MOV AH, 9
        INT 21H
        JMP EXIT
        
    EXIT: 
        
END MAIN
        