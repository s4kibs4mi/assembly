.MODEL SMALL
.STACK 100H

.DATA
E1 DB 0DH , 0AH , 'EVEN',0DH , 0AH , '$'       ; setting up output strings
E2 DB 0DH , 0AH , 'ODD' ,0DH , 0AH , '$'       ; setting up output strings

.CODE
    MAIN PROC
        MOV AX, @DATA                          ; loading data input string output register
        MOV DS, AX                             ; loading data input string output register
        
        BEGIN:                                 ; start loop for taking input while not zero
        MOV AH,1                               ; setting up input parameter
        INT 21H                                ; taking input
        
        CMP AL,'0'                             ; checking is input zero or not
            JNA EXIT                           ; if input zero jumping to EXIT label
        
        AND AL, 1                              ; using AND operator for even odd check . even = 0 , odd = 1
        
        CMP AL, 0                              ; check what is in AL , 0 or 1
            JNA ELSE                           ; if JNA ( is equal to ) 0 jumping to ELSE label
        
        LEA DX, E2                             ; loading output string into DX
        JMP DISPLAY                            ; jumping to DISPLAY label
           
        ELSE:                                  ; ELSE label stats here
            LEA DX, E1                         ; loading output string into DX
        
        DISPLAY:                               ; DISPLAY label starts
            MOV AH, 9                          ; setting up for string output
            INT 21H                            ; printing output
            JMP BEGIN                          ; continues loop
        
        EXIT:                                  ; EXIT label
    MAIN ENDP
END MAIN
