; ADDING TWO NUMBER

.MODEL SMALL
.STACK 100H
.DATA
.CODE
    MAIN PROC
        MOV BH, 2     ; NUMBER 1
        MOV BL, 3     ; NUMBER 2
        ADD BL, BH    ; ADDING NUMBER 1 + NUMBER 2
        ADD BL, 30H   ; CONVERTING 5 TO CHAR
        MOV AH, 2     ; ACTIVING OUTPUT MOOD
        MOV DL, BL    ; MOVING DATA TO OUTPUT REG DL
        INT 21H       ; OUTPUT COMMAND
        
    MAIN ENDP
END MAIN
