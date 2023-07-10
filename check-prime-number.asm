.MODEL SMALL

.STACK 100H

.DATA
 
PRIME_MSG DB 0AH,0DH,'PRIME','$'   
NOT_PRIME_MSG DB 0AH,0DH,'NOT PRIME','$' 
PRIMES DB '2357'

.CODE

MAIN PROC  
    
    MOV AX, DATA
    MOV DS, AX
      
    MOV AH, 1
    INT 21H      
    MOV SI, 0
    MOV CX, 4
    
    CHECK_PRIME:
        CMP AL, PRIMES[SI]
        JE PRINT_PRIME
        INC SI
        LOOP CHECK_PRIME  
    
    LEA DX, NOT_PRIME_MSG
    MOV AH, 9
    INT 21H
    JMP EXIT  
        
    PRINT_PRIME:
        LEA DX, PRIME_MSG
        MOV AH, 9
        INT 21H

    EXIT:
             
END MAIN 