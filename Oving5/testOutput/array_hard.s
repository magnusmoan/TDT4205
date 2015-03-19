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
#4 Starting ASSIGNMENT_STATEMENT
#5 Starting EXPRESSION of type NEW
#6 TEST1 1 
#7 TEST2 3 
#8 TEST1 3 
#9 TEST2 9 
	movw	r6, #:lower16:36
	movt	r6, #:upper16:36
	push	{r6}
	bl	_malloc
	pop	{r6}
#10 Ending EXPRESSION of type NEW
	str	r0, [fp, #-4]
#11 End ASSIGNMENT_STATEMENT
#12 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:8
	movt	r2, #:upper16:8
	add	r3, r3, r2
#13 Starting CONSTANT
	movw	r5, #:lower16:5
	movt	r5, #:upper16:5
	push	{r5}
#14 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#15 End ASSIGNMENT_STATEMENT
#16 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#17 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-4]
	movw	r6, #:lower16:8
	movt	r6, #:upper16:8
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#18 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#19 Ending PRINT_STATEMENT
#20 Starting DECLARATION: adding space on stack
	push	{r0}
#21 Ending DECLARATION
#22 Starting ASSIGNMENT_STATEMENT
#23 Starting EXPRESSION of type NEW
#24 TEST1 1 
#25 TEST2 4 
#26 TEST1 4 
#27 TEST2 16 
#28 TEST1 16 
#29 TEST2 64 
	movw	r6, #:lower16:256
	movt	r6, #:upper16:256
	push	{r6}
	bl	_malloc
	pop	{r6}
#30 Ending EXPRESSION of type NEW
	str	r0, [fp, #-8]
#31 End ASSIGNMENT_STATEMENT
#32 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-8]
	movw	r2, #:lower16:0
	movt	r2, #:upper16:0
	add	r3, r3, r2
#33 Starting CONSTANT
	movw	r5, #:lower16:10
	movt	r5, #:upper16:10
	push	{r5}
#34 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#35 End ASSIGNMENT_STATEMENT
#36 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#37 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-8]
	movw	r6, #:lower16:0
	movt	r6, #:upper16:0
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#38 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#39 Ending PRINT_STATEMENT
#40 Starting DECLARATION: adding space on stack
	push	{r0}
#41 Ending DECLARATION
#42 Starting ASSIGNMENT_STATEMENT
#43 Starting EXPRESSION of type FUNC_CALL
	bl	_create
#44 Ending EXPRESSION of type FUNC_CALL
	str	r0, [fp, #-12]
#45 End ASSIGNMENT_STATEMENT
#46 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#47 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-12]
	movw	r6, #:lower16:4
	movt	r6, #:upper16:4
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#48 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#49 Ending PRINT_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#50 Leaving FUNCTION (main) with depth 2
#51 Starting FUNCTION (create) with depth 2
_create:
	push	{lr}
	push	{fp}
	mov	fp, sp
#52 Starting DECLARATION: adding space on stack
	push	{r0}
#53 Ending DECLARATION
#54 Starting ASSIGNMENT_STATEMENT
#55 Starting EXPRESSION of type NEW
#56 TEST1 1 
#57 TEST2 3 
	movw	r6, #:lower16:12
	movt	r6, #:upper16:12
	push	{r6}
	bl	_malloc
	pop	{r6}
#58 Ending EXPRESSION of type NEW
	str	r0, [fp, #-4]
#59 End ASSIGNMENT_STATEMENT
#60 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:0
	movt	r2, #:upper16:0
	add	r3, r3, r2
#61 Starting CONSTANT
	movw	r5, #:lower16:1
	movt	r5, #:upper16:1
	push	{r5}
#62 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#63 End ASSIGNMENT_STATEMENT
#64 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:4
	movt	r2, #:upper16:4
	add	r3, r3, r2
#65 Starting CONSTANT
	movw	r5, #:lower16:2
	movt	r5, #:upper16:2
	push	{r5}
#66 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#67 End ASSIGNMENT_STATEMENT
#68 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:8
	movt	r2, #:upper16:8
	add	r3, r3, r2
#69 Starting CONSTANT
	movw	r5, #:lower16:3
	movt	r5, #:upper16:3
	push	{r5}
#70 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#71 End ASSIGNMENT_STATEMENT
#72 Starting RETURN_STATEMENT
#73 Starting VARIABLE
	ldr	r5, [fp, #-4]
	push	{r5}
#74 End VARIABLE a, depth difference: 0, stack offset: -4
	pop	{r0}
#75 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#76 Leaving FUNCTION (create) with depth 2
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
#77 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
