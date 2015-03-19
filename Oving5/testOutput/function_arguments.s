.syntax unified
.cpu cortex-a15
.fpu vfpv3-d16
.data
.align	2
.DEBUG: .ascii "Hit Debug\n\000"
.DEBUGINT: .ascii "Hit Debug, r0 was: %d\n\000"
.INTEGER: .ascii "%d \000"
.FLOAT: .ascii "%f \000"
.NEWLINE: .ascii "\n \000"
.globl main
.align	2
.text
#0 Starting PROGRAM
#1 Starting FUNCTION (main) with depth 2
_main:
	push	{lr}
	push	{fp}
	mov	fp, sp
#2 Starting DECLARATION: adding space on stack
	push	{r0}
#3 Ending DECLARATION
#4 Starting DECLARATION: adding space on stack
	push	{r0}
#5 Ending DECLARATION
#6 Starting DECLARATION: adding space on stack
	push	{r0}
#7 Ending DECLARATION
#8 Starting DECLARATION: adding space on stack
	push	{r0}
#9 Ending DECLARATION
#10 Starting ASSIGNMENT_STATEMENT
#11 Starting CONSTANT
	movw	r5, #:lower16:5
	movt	r5, #:upper16:5
	push	{r5}
#12 End CONSTANT
	pop	{r0}
	str	r0, [fp, #-4]
#13 End ASSIGNMENT_STATEMENT
#14 Starting ASSIGNMENT_STATEMENT
#15 Starting CONSTANT
	movw	r5, #:lower16:6
	movt	r5, #:upper16:6
	push	{r5}
#16 End CONSTANT
	pop	{r0}
	str	r0, [fp, #-8]
#17 End ASSIGNMENT_STATEMENT
#18 Starting ASSIGNMENT_STATEMENT
#19 Starting CONSTANT
	movw	r5, #:lower16:7
	movt	r5, #:upper16:7
	push	{r5}
#20 End CONSTANT
	pop	{r0}
	str	r0, [fp, #-12]
#21 End ASSIGNMENT_STATEMENT
#22 Starting ASSIGNMENT_STATEMENT
#23 Starting CONSTANT
	movw	r5, #:lower16:8
	movt	r5, #:upper16:8
	push	{r5}
#24 End CONSTANT
	pop	{r0}
	str	r0, [fp, #-16]
#25 End ASSIGNMENT_STATEMENT
#26 Starting DECLARATION: adding space on stack
	push	{r0}
#27 Ending DECLARATION
#28 Starting DECLARATION: adding space on stack
	push	{r0}
#29 Ending DECLARATION
#30 Starting ASSIGNMENT_STATEMENT
#31 Starting EXPRESSION of type FUNC_CALL
	ldr	r5, [fp, #-4]
	push	{r5}
	ldr	r5, [fp, #-8]
	push	{r5}
	ldr	r5, [fp, #-12]
	push	{r5}
	bl	_func1
#32 Ending EXPRESSION of type FUNC_CALL
	str	r0, [fp, #-20]
#33 End ASSIGNMENT_STATEMENT
#34 Starting ASSIGNMENT_STATEMENT
#35 Starting EXPRESSION of type FUNC_CALL
	ldr	r5, [fp, #-4]
	push	{r5}
	ldr	r5, [fp, #-8]
	push	{r5}
	ldr	r5, [fp, #-12]
	push	{r5}
	ldr	r5, [fp, #-16]
	push	{r5}
	ldr	r5, [fp, #-20]
	push	{r5}
	bl	_func2
#36 Ending EXPRESSION of type FUNC_CALL
	str	r0, [fp, #-24]
#37 End ASSIGNMENT_STATEMENT
#38 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#39 Starting VARIABLE
	ldr	r5, [fp, #-20]
	push	{r5}
#40 End VARIABLE e, depth difference: 0, stack offset: -20
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#41 Starting VARIABLE
	ldr	r5, [fp, #-24]
	push	{r5}
#42 End VARIABLE f, depth difference: 0, stack offset: -24
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#43 Ending PRINT_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#44 Leaving FUNCTION (main) with depth 2
#45 Starting FUNCTION (func1) with depth 2
_func1:
	push	{lr}
	push	{fp}
	mov	fp, sp
#46 Starting DECLARATION: adding space on stack
	push	{r0}
#47 Ending DECLARATION
#48 Starting DECLARATION: adding space on stack
	push	{r0}
#49 Ending DECLARATION
#50 Starting DECLARATION: adding space on stack
	push	{r0}
#51 Ending DECLARATION
#52 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#53 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#54 End VARIABLE x, depth difference: 0, stack offset: 16
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#55 Starting VARIABLE
	ldr	r5, [fp, #12]
	push	{r5}
#56 End VARIABLE y, depth difference: 0, stack offset: 12
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#57 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#58 End VARIABLE z, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#59 Ending PRINT_STATEMENT
#60 Starting RETURN_STATEMENT
#61 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#62 End VARIABLE z, depth difference: 0, stack offset: 8
	pop	{r0}
#63 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#64 Leaving FUNCTION (func1) with depth 2
#65 Starting FUNCTION (func2) with depth 2
_func2:
	push	{lr}
	push	{fp}
	mov	fp, sp
#66 Starting DECLARATION: adding space on stack
	push	{r0}
#67 Ending DECLARATION
#68 Starting DECLARATION: adding space on stack
	push	{r0}
#69 Ending DECLARATION
#70 Starting DECLARATION: adding space on stack
	push	{r0}
#71 Ending DECLARATION
#72 Starting DECLARATION: adding space on stack
	push	{r0}
#73 Ending DECLARATION
#74 Starting DECLARATION: adding space on stack
	push	{r0}
#75 Ending DECLARATION
#76 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#77 Starting VARIABLE
	ldr	r5, [fp, #24]
	push	{r5}
#78 End VARIABLE x, depth difference: 0, stack offset: 24
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#79 Starting VARIABLE
	ldr	r5, [fp, #20]
	push	{r5}
#80 End VARIABLE y, depth difference: 0, stack offset: 20
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#81 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#82 End VARIABLE z, depth difference: 0, stack offset: 16
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#83 Starting VARIABLE
	ldr	r5, [fp, #12]
	push	{r5}
#84 End VARIABLE w, depth difference: 0, stack offset: 12
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#85 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#86 End VARIABLE ae, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#87 Ending PRINT_STATEMENT
#88 Starting RETURN_STATEMENT
#89 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#90 End VARIABLE z, depth difference: 0, stack offset: 16
	pop	{r0}
#91 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#92 Leaving FUNCTION (func2) with depth 2
debugprint:
	push {r0-r11, lr}
	movw	r0, #:lower16:.DEBUG
	movt	r0, #:upper16:.DEBUG
	bl	printf
	pop {r0-r11, pc}
debugprint_r0:
	push {r0-r11, lr}
	mov	r1, r0
	movw	r0, #:lower16:.DEBUGINT
	movt	r0, #:upper16:.DEBUGINT
	bl	printf
	pop {r0-r11, pc}
_malloc:
	push	{lr}
	push	{fp}
	ldr	r0, [sp, #8]
	bl	malloc
	pop	{fp}
	pop {pc}
main:
	push	{lr}
	push	{fp}
	mov	fp, sp
	mov	r5, r0
	sub	r5, r5, #1
	cmp	r5,#0
	beq	noargs
	mov	r6, r1
pusharg:
	ldr	r0, [r6, #4]
	add	r6, r6, #4
	mov	r1, #0
	mov	r2, #10
	bl	strtol
	push	{r0}
	sub	r5, r5, #1
	cmp	r5,#0
	bne	pusharg
noargs:
	bl	_main
#93 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
