;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO TAKE ARRAY OF NUMBER AS INPUT & SORT IT, N<=9  


.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
INPUT DB 50 DUP('$') 

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX        
        
    MOV SI, 0    
                      
    START_INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_INPUT 
        MOV INPUT+SI, AL
        INC SI
        JMP START_INPUT
    
    END_INPUT:   
    
    MOV AH, 9
    LEA DX, NEWLINE
    INT 21H
    
    MOV SI, 0
    LOOP1:
        MOV DI, SI
        
        MOV AH, INPUT[SI]
        CMP AH, '$'
        JE END_LOOP1
        
        LOOP2:
            INC DI
            MOV AH, INPUT[SI]
            MOV AL, INPUT[DI] 
            CMP AL, '$'
            JE END_LOOP2
            CMP AH, AL
            JG SWAP 
            JMP LOOP2
        
        SWAP:
            MOV BH, AH
            MOV AH, AL
            MOV AH, BH
            MOV INPUT[DI], AH
            MOV INPUT[SI], AL
            JMP LOOP2
        
        END_LOOP2:
            INC SI
            JMP LOOP1        
            
    END_LOOP1:  
    
    MOV AH, 9
    LEA DX, INPUT
    INT 21H       
        
END MAIN
        