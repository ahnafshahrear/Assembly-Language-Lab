;AHNAF SHAHREAR KHAN
;COMPUTER SCIENCE & ENGINEERING
;UNIVERSITY OF RAJSHAHI

;ASSEMBLY CODE TO CHECK A STRING IS A SUBSTRING OF ANOTHER STRING OR NOT 


.MODEL SMALL

.STACK 100H

.DATA   

NEWLINE DB 0AH,0DH,'$' 
INPUT DB ?
V DB 0
C DB 0
D DB 0
S DB 0

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX        
           
    STRING_INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_STRING_INPUT
        CMP AL, ' '
        JE UDATE_SPACE  
        CMP AL, 'A'
        JE UDATE_VOWEL  
        CMP AL, 'E'
        JE UDATE_VOWEL
        CMP AL, 'I'
        JE UDATE_VOWEL
        CMP AL, 'O'
        JE UDATE_VOWEL
        CMP AL, 'U'
        JE UDATE_VOWEL
        JMP STRING_INPUT 
        
        UDATE_SPACE:
            MOV CL, S
            INC CL
            MOV S, CL 
            JMP STRING_INPUT
        
        UDATE_VOWEL:
            MOV CL, V
            INC CL
            MOV V, CL 
            JMP STRING_INPUT     
        
    END_STRING_INPUT: 
                      
    MOV AH, 9
    LEA DX, NEWLINE
    INT 21H
    
    MOV DL, S 
    ADD DL, '0'
    MOV AH, 2
    INT 21H       
            
    EXIT: 
        
END MAIN              