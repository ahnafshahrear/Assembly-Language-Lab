;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO CONVERT CASE OF STRING

.MODEL SMALL

.STACK 100H

.DATA

INPUT DB 40 DUP('$') 
NEWLINE DB 0AH,0DH,'$'

.CODE

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    MOV SI, 0   
      
    STRING_INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_STRING_INPUT
        MOV INPUT+SI, AL
        INC SI
        JMP STRING_INPUT   
        
    END_STRING_INPUT: 
                      
    CALL PRINT_NEWLINE                  
    MOV DI, 0
    
    CASE_CHANGE:
        MOV DL, INPUT[DI]
        CMP DL, '$'
        JE END_CASE_CHANGE
        
        CMP DL, 'A'
        JL NO_CHANGE      
        CMP DL, 'z'
        JG CHECK_LOWER
        XOR DL, 32
        JMP NO_CHANGE
        
        CHECK_LOWER:
            CMP DL, 97D
            JL NO_CHANGE
            CMP DL, 122D
            JG NO_CHANGE
            XOR DL, 32
        
        NO_CHANGE:
            MOV INPUT[DI], DL
            INC DI
            JMP CASE_CHANGE
            
    END_CASE_CHANGE: 
    
    LEA DX, INPUT
    MOV AH, 9
    INT 21H
    
    MOV AH, 4CH
    INT 21H  
    
    PRINT_NEWLINE PROC
        PUSH DX
        PUSH AX
        LEA DX, NEWLINE
        MOV AH, 9
        INT 21H
        POP AX
        POP DX
        RET
        PRINT_NEWLINE ENDP 

END MAIN
    