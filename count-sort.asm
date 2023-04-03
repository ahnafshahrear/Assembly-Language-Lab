;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO TAKE ARRAY OF NUMBER AS INPUT & SORT IT, N<=9  


.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
INPUT DB 50 DUP('$') 
COUNT DB 10 DUP(0)

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX        
                      
    START_INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_INPUT 
        SUB AL, '0'
        MOV AH, 0
        MOV SI, AX
        ADD COUNT[SI], 1
        JMP START_INPUT
    
    END_INPUT: 
    
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H  
    
    MOV SI, 0
    
    OUTPUT:
        CMP SI, 10  
        INC SI
        JE EXIT         
        MOV CX, 0
        MOV CL, COUNT[SI] 
        MOV AH, 2
        MOV DX, SI 
        CMP CL, 0
        JE OUTPUT 
        ADD DL, '0'
        PRINT_DIGIT:
            INT 21H
            LOOP PRINT_DIGIT
        
        JMP OUTPUT        
        
    EXIT:    
        
END MAIN
        