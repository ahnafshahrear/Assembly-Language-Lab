;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO CHECK A STRING IS A SUBSTRING OF ANOTHER STRING OR NOT 


.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
TEXT DB 'HELLO WORLD','$'
PATTERN DB 'HELL','$'  
FOUND DB 'SUBSTRING FOUND','$'
NOT_FOUND DB 'SUBSTRING NOT FOUND','$'

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX        
        
    MOV SI, 0    
                      
    CHECK:
        MOV DI, 0  
        PUSH SI
        
        ITERATE:  
            MOV AH, TEXT[SI]
            MOV AL, PATTERN[DI]   
            INC DI
            INC SI
            CMP AL, '$'
            JE FOUND_MSG  
            CMP AH, AL  
            JE ITERATE
            JNE UPDATE_INDEX    
        
        UPDATE_INDEX:
            POP SI
            INC SI
            MOV AH, TEXT[SI]
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
        
