.MODEL SMALL
.STACK 100H

.DATA
    A DW 2,7,6,4,8
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS, AX
        
        MOV CX, 5
        MOV BX, 0
        MOV SI, 0
        
        MOV AX, A[BX+SI]
        MOV DL, AL
        ADD SI, 2
        LOOP_BODY:
            MOV AX, A[BX+SI]
            CMP AL, DL
            JG YES
            JMP NO
            YES:
                MOV DL, AL
            NO:
            ADD SI, 2
            LOOP LOOP_BODY
        
        MOV AH, 2
        ADD DL, 30H
        INT 21H
    MAIN ENDP
END MAIN
