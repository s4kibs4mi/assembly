; HELLO WORLD PROGRAM

.MODEL SMALL
.STACK 100H

.DATA
MSG DB 'HELLO WORLD !$'

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        LEA DX,MSG
        MOV AH, 9
        INT 21H