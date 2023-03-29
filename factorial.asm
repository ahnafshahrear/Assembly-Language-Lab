;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO CALCULATE FACTORIAL OF N, N<=3

.MODEL SMALL

.STACK 100H

.DATA
 
NEWLINE DB 0AH,0DH,'$'

.CODE

MAIN PROC  
    
    MOV AX, @DATA
    MOV DS, AX
                                             
    MOV AH, 1
    INT 21H      
    SUB AL, '0'      
    MOV BL, AL     
    
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H 
    
    MOV AL, 1   
     
    FACTORIAL:
        CMP BL, 0
        JE PRINT_FACTORIAL 
        MUL BL
        DEC BL
        JMP FACTORIAL
    
    PRINT_FACTORIAL: 
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H

END MAIN
    