;ASSEMBLY CODE TO CONVERT CASE OF STRING

.MODEL SMALL

.STACK 100H

.DATA
INPUT DB 50 DUP('$') 
NEWLINE DB 0AH,0DH,'$'
MSG DB 'NO CAPITAL','$'

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
    NO_CAPITAL:
        CMP INPUT[DI], '$'
        JMP NO
        CMP INPUT[DI], 'A'
        JGE LESS_Z
        INC DI
        JMP NO_CAPITAL
        
        LESS_Z:
            CMP INPUT[DI], 'Z'
            JLE EXIT_NO_CAPITAL
            INC DI
            JMP NO_CAPITAL
        NO: 
            LEA DX, MSG
            MOV AH, 9
            INT 21H    
            
    EXIT_NO_CAPITAL:    
        
    
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
    
    EXIT:

END MAIN
    