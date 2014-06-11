.MODEL SMALL
.STACK 100H
.DATA
.CODE
    MAIN PROC
        MOV AL, 'L'
        MOV AH, 'K'
        MOV BH, 'S'
        MOV BL, 'A'
        MOV CH, 'U'
        MOV CL, 'O'
        MOV DH, 'T'
        
        MOV AH, 2
        MOV DL, AL
        INT 21H
        MOV DL, CL
        INT 21H
        MOV DL, DH
        INT 21H
        MOV DL, CH
        INT 21H
        MOV DL, BH
        INT 21H
        
    MAIN ENDP
END MAIN
