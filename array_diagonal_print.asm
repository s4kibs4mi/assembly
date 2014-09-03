.MODEL SAMLL
.STACK 100H
.DATA
    DMSG DB 'THE DIAGONAL NUMBERS ARE : $'
    ARRAYMSG DB 'THE ARRAY IS :$'
    FMSG DB 'THE MINIMUM DIAGONAL NUMBER : $'
    
    A DW 0,0,0
      DW 0,0,0
      DW 0,0,0
      

.CODE

    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV SI, 0
    MOV BX, 0
    
    MOV CL, 2           ; OUTER LOOP COUNTER
    OUTER_LOOP:
        MOV CH, 2       ; INNER LOOP COUNTER
        INNER_LOOP:
            MOV AH, 1   ; TAKING INPUT
            INT 21H
            MOV AH, 0
            MOV A[BX+SI], AX    ; MOVEING INPUTTED VALUE TO ARRAY
            ADD SI, 2           ; MOVEING COLUMN
            SUB CH, 1           ; DECREASING OUTER LOOP COUNTER
            CMP CH, 0           ; CHECKING CONDITION
                JGE INNER_LOOP  ; JUMPING
        
        ADD SI, 2               ; INCREASING COLUMN
        ADD SI, BX
        MOV BX, SI              ; MOVING TO ROW
        MOV SI, 0               ; RE INITIALIZATION OF ROW COLUMN
        SUB CL, 1               ; DECRESING OUTER LOOP COUNTER
        CMP CL, 0
            JGE OUTER_LOOP      ; JUMPING
        
    
    
    MOV AH, 2
    MOV DL, 0DH                 ; PRINTING NEW LINE
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX,ARRAYMSG
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, 0DH                 ; PRINTING NEW LINE
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    MOV SI, 0
    MOV BX, 0
    
    MOV CL, 2           ; OUTER LOOP COUNTER
    OUTER_LOOP_B:
        MOV CH, 2       ; INNER LOOP COUNTER
        INNER_LOOP_B:

            MOV AH, 0
            MOV AX, A[BX+SI]        ; MOVEING INPUTTED VALUE TO ARRAY
            MOV DL, AL              ; MOVING DATA TO OUTPUT REGISTER
            MOV AH, 2
            INT 21H                 ; GIVING OUTPUT
            MOV DL, ' '
            INT 21H
            ADD SI, 2               ; MOVEING COLUMN
            SUB CH, 1               ; DECREASING OUTER LOOP COUNTER
            CMP CH, 0               ; CHECKING CONDITION
                JGE INNER_LOOP_B    ; JUMPING
        
        ADD SI, 2                   ; INCREASING COLUMN
        ADD SI, BX
        MOV BX, SI                  ; MOVING TO ROW
        MOV SI, 0                   ; RE INITIALIZATION OF ROW COLUMN
        SUB CL, 1                   ; DECRESING OUTER LOOP COUNTER
        MOV AH, 2
        MOV DL, 0DH                 ; PRINTING NEW LINE
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        CMP CL, 0
            JGE OUTER_LOOP_B          ; JUMPING 
    
    
    MOV AH, 2
    MOV DL, 0DH                 ; PRINTING NEW LINE
    INT 21H
    MOV DL, 0AH
    INT 21H
                                ; PRINTING DIAGONAL MESSAGE
    LEA DX,DMSG
    MOV AH, 9
    INT 21H
    
    MOV BX, 0
    MOV SI, 0
    
    MOV AX, A[BX+SI]
    
    MOV CX, 3                         ; DIAGONAL PRINTING
    DIAGONAL_PRINT:
        MOV AX, A[BX+SI]
        MOV AH, 0
        MOV DL, AL
        MOV AH, 2
        INT 21H            
        
        MOV DL, ' '
        INT 21H
        ADD SI, 4
        ADD BX, 6
        LOOP DIAGONAL_PRINT
    
    MOV AH, 2
    MOV DL, 'A'
    INT 21H
    MOV DL, 'N'
    INT 21H
    MOV DL, 'D'
    INT 21H
    MOV DL, ' '
    INT 21H
        
    MOV BX, 0
    MOV SI, 4
    MOV CX, 3                         ; DIAGONAL PRINTING CROSS
    DIAGONAL_PRINT_X:
        MOV AX, A[BX+SI]
        MOV AH, 0
        MOV DL, AL
        MOV AH, 2
        INT 21H
        
        MOV DL, ' '
        INT 21H
        SUB SI, 2
        ADD BX, 8
        LOOP DIAGONAL_PRINT_X
    
    MOV AH, 2
    MOV DL, 0DH                 ; PRINTING NEW LINE
    INT 21H
    MOV DL, 0AH
    INT 21H
        
    LEA DX,FMSG
    MOV AH, 9
    INT 21H
    POP AX
    MOV DL, AL
    INT 21H
    
    MAIN ENDP
END MAIN
