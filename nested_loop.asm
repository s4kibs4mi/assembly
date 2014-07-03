; *
; **
; ***
; ****
; *****

.MODEL SMALL
.STACK 100H
.DATA

.CODE
    MAIN PROC
        MOV AH, 2
        
        MOV BL, 5
        OUTER_LOOP:
            MOV CL, 5
            INNER_LOOP:
                MOV DL, '*'
                INT 21H
                DEC CL
                CMP CL, BL
                    JGE INNER_LOOP
                        
            MOV DL, 0DH
            INT 21H
            MOV DL, 0AH
            INT 21H
            DEC BL
            CMP BL, 0
                JG OUTER_LOOP
                
    MAIN ENDP
END MAIN
