.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
INPUT DB 50 DUP('$') 

.CODE

MAIN PROC

    MOV AX, DATA
    MOV DS, AX        
        
    MOV SI, 0    
                      
    START_INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_INPUT 
        MOV INPUT[SI], AL
        INC SI
        JMP START_INPUT
    
    END_INPUT:   
    
    MOV AH, 9
    LEA DX, NEWLINE
    INT 21H
    
    MOV SI, 0
    
    LOOP1:
        MOV BL, INPUT[SI]   
        CMP BL, '$'
        JE END_LOOP1:
        INC SI
        CMP BL, INPUT[0]
        JG UPDATE  
        JMP LOOP1
        
        UPDATE:
            MOV INPUT[0], BL
            JMP LOOP1      
            
    END_LOOP1:  
    
    MOV AH, 2
    MOV DL, INPUT[0]
    INT 21H     
        
END MAIN
        