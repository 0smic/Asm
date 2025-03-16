.global _start
_start:
	mov r7, #4     @ moves id 4 into r7
	mov r0, #1     @ moves file descriptor 1 tp r0
	ldr r1, =text   @ loads the text from the stack to register
	ldr r2, =len    @ load the len from the stack to register
	ldr r2, [r2]    @ load the real value of the r2 to r2
	svc #0          @ sys call
	B end           @ jump to end

end:
  mov r7, #1
	mov r0, #0
	svc #0  
.section .data
	text: .asciz "test\n"
	len: .word . - text 
