;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO FIND SMALLEST & LARGEST CAPITAL LETTER

.MODEL SMALL

.STACK 100H

.DATA

INPUT DB 50 DUP('$') 
NEWLINE DB 0AH,0DH,'$'
MSG DB 'NO CAPITAL','$'  
SMALL DB 'Z'
BIG DB 'A'
FLAG DB 0

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
    CHECK: 
        MOV DL, INPUT[DI]
        INC DI
        CMP DL, '$'
        JE NO
        CMP DL, 'A'
        JGE LESS_Z
        JMP CHECK
        
        LESS_Z:
            CMP DL, 'Z'
            JLE CAPITAL
            JMP CHECK
        NO:   
            CMP FLAG, 1
            JE FOUND
            LEA DX, MSG
            MOV AH, 9
            INT 21H
            JMP EXIT    
            
    CAPITAL:  
        MOV BL, SMALL
        CMP DL, BL
        JL UPDATE_SMALL
        MOV BL, BIG
        CMP DL, BL
        JG UPDATE_BIG
        JMP CHECK
          
    UPDATE_SMALL:
        MOV SMALL, DL 
        MOV FLAG, 1
        JMP CAPITAL
    UPDATE_BIG: 
        MOV BIG, DL
        MOV FLAG, 1
        JMP CHECK 
        
    FOUND:
        MOV AH, 2
        MOV DL, SMALL
        INT 21H
        CALL PRINT_NEWLINE
        MOV DL, BIG
        INT 21H
        JMP EXIT    
        
    
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
    