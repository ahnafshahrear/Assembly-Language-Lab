;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO CHECK A STRING IS A SUBSTRING OF ANOTHER STRING OR NOT 


.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
TEXT DB 'HELLO WORLD','$'
PATTERN DB 'ELLO','$'  
FOUND DB 'SUBSTRING FOUND','$'
NOT_FOUND DB 'SUBSTRING NOT FOUND','$'
INDEX DB -1 

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX        
                  
    CHECK:
        MOV DI, -1
        MOV SI, INDEX
        
        ITERATE:  
            INC SI
            INC DI
            MOV AH, TEXT[DI]
            MOV AL, PATTERN[DI]  
            CMP AL, '$'
            JE FOUND_MSG
            CMP AH, AL  
            JE ITERATE
            JNE UPDATE_INDEX    
        
        UPDATE_INDEX:
            INC INDEX
            MOV AH, TEXT[INDEX]
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
        