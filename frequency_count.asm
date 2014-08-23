.MODEL SMALL
.STACK 100H

.DATA
A DW 0,0,0,0,0,0,0,0,0,0

.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; TAKING INPUT OF 5 NUMBERS
    MOV CX, 5
    LOOP_INPUT:
        MOV AH, 1
        INT 21H
        PUSH AX              ; PUSHING INPUT TO STACK
        LOOP LOOP_INPUT
    
    ; PRINTING NEWLINE
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ; GETLINE STACK VALUE AND INCREASING INDEX
    MOV CX, 5
    STACK_ACCESS:
        POP AX               ; POPING DATA FROM STACK
        MOV AH, 0
        MOV BX, 0            ; INITIALIZING ARRAY INDEX
        MOV SI, 0
        SUB AL, 30H          ; LOOP TO MOVE TO EXACT ARRAY LOCATION
        INNER_LOOP:
            CMP AL, 0
            JE SKIP_FOR_ZERO ; SKIPING COLUMN MOVE FOR ZERO
            ADD SI, 2        ; MOVING COLUMN
            ADD AH, 1
            CMP AH, AL
            JNGE INNER_LOOP
        
        SKIP_FOR_ZERO:
        
        MOV AX, A[BX+SI]     ; GETTING INDEX VALUE FROM ARRAY
        ADD AL, 1            ; INCREASING INDEX VALUE
        MOV AH, 0
        MOV A[BX+SI], AX     ; CHANGING INDEX VALUE
        LOOP STACK_ACCESS
    
    ; PRINTING OUTPUT
    MOV CX, 10
    MOV BX, 0
    MOV SI, 0
    MOV DH, 0
    LOOP_OUTPUT:             ; LOOP TO ACCESS FULL ARRAY
        MOV AX, A[BX+SI]     ; GETTING ARRAY INDEX VALUE
        MOV DL, AL
        ADD SI, 2
        CMP DL, 0            ; COMPARING WHETHER INDEX VALUE IS ZERO OR NOT
        JNZ PRINT            ; IF ZERO THEN GOING TO PRINT
        JMP SKIP             ; IF ZERO INDEX , NOT GOING TO PRINT
        PRINT:
            MOV AH, 2        ; PRINTING FREQUENCY
            ADD DL, 30H
            INT 21H
            
            MOV DL, ' '      ; THIS IS MANUALLY PRINTING TIMES WORD
            INT 21H
            MOV DL, 'T'
            INT 21H
            MOV DL, 'I'
            INT 21H
            MOV DL, 'M'
            INT 21H
            MOV DL, 'E'
            INT 21H
            MOV DL, 'S'
            INT 21H
            MOV DL, ' '
            INT 21H
            
            MOV DL, DH        ; PRINTING THE NUMBER WHICH FREQUENCY HAS PRINTED
            ADD DL, 30H       ; PRINTING NEW LINE
            INT 21H
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H    
                
        SKIP:
        ADD DH, 1
        LOOP LOOP_OUTPUT  
        
    MAIN ENDP
END MAIN
