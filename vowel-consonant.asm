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

    MOV AX, DATA
    MOV DS, AX        
          
END MAIN              