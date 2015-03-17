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
#11 Starting VARIABLE
	ldr	r5, [fp, #-4]
	push	{r5}
#12 End VARIABLE a, depth difference: 0, stack offset: -4
#13 Starting CONSTANT
	movw	r5, #:lower16:5
	movt	r5, #:upper16:5
	push	{r5}
#14 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-4]
#15 End ASSIGNMENT_STATEMENT
#16 Starting ASSIGNMENT_STATEMENT
#17 Starting VARIABLE
	ldr	r5, [fp, #-8]
	push	{r5}
#18 End VARIABLE b, depth difference: 0, stack offset: -8
#19 Starting CONSTANT
	movw	r5, #:lower16:6
	movt	r5, #:upper16:6
	push	{r5}
#20 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-8]
#21 End ASSIGNMENT_STATEMENT
#22 Starting ASSIGNMENT_STATEMENT
#23 Starting VARIABLE
	ldr	r5, [fp, #-12]
	push	{r5}
#24 End VARIABLE c, depth difference: 0, stack offset: -12
#25 Starting CONSTANT
	movw	r5, #:lower16:7
	movt	r5, #:upper16:7
	push	{r5}
#26 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-12]
#27 End ASSIGNMENT_STATEMENT
#28 Starting ASSIGNMENT_STATEMENT
#29 Starting VARIABLE
	ldr	r5, [fp, #-16]
	push	{r5}
#30 End VARIABLE d, depth difference: 0, stack offset: -16
#31 Starting CONSTANT
	movw	r5, #:lower16:8
	movt	r5, #:upper16:8
	push	{r5}
#32 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-16]
#33 End ASSIGNMENT_STATEMENT
#34 Starting DECLARATION: adding space on stack
	push	{r0}
#35 Ending DECLARATION
#36 Starting DECLARATION: adding space on stack
	push	{r0}
#37 Ending DECLARATION
#38 Starting ASSIGNMENT_STATEMENT
#39 Starting VARIABLE
	ldr	r5, [fp, #-20]
	push	{r5}
#40 End VARIABLE e, depth difference: 0, stack offset: -20
#41 Starting EXPRESSION of type FUNC_CALL
	bl	_func1
#42 Ending EXPRESSION of type FUNC_CALL
	pop	{r5}
	str	r5, [fp, #-20]
#43 End ASSIGNMENT_STATEMENT
#44 Starting ASSIGNMENT_STATEMENT
#45 Starting VARIABLE
	ldr	r5, [fp, #-24]
	push	{r5}
#46 End VARIABLE f, depth difference: 0, stack offset: -24
#47 Starting EXPRESSION of type FUNC_CALL
	bl	_func2
#48 Ending EXPRESSION of type FUNC_CALL
	pop	{r5}
	str	r5, [fp, #-24]
#49 End ASSIGNMENT_STATEMENT
#50 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#51 Starting VARIABLE
	ldr	r5, [fp, #-20]
	push	{r5}
#52 End VARIABLE e, depth difference: 0, stack offset: -20
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#53 Starting VARIABLE
	ldr	r5, [fp, #-24]
	push	{r5}
#54 End VARIABLE f, depth difference: 0, stack offset: -24
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#55 Ending PRINT_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#56 Leaving FUNCTION (main) with depth 2
#57 Starting FUNCTION (func1) with depth 2
_func1:
	push	{lr}
	push	{fp}
	mov	fp, sp
#58 Starting DECLARATION: adding space on stack
	push	{r0}
#59 Ending DECLARATION
#60 Starting DECLARATION: adding space on stack
	push	{r0}
#61 Ending DECLARATION
#62 Starting DECLARATION: adding space on stack
	push	{r0}
#63 Ending DECLARATION
#64 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#65 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#66 End VARIABLE x, depth difference: 0, stack offset: 16
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#67 Starting VARIABLE
	ldr	r5, [fp, #12]
	push	{r5}
#68 End VARIABLE y, depth difference: 0, stack offset: 12
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#69 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#70 End VARIABLE z, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#71 Ending PRINT_STATEMENT
#72 Starting RETURN_STATEMENT
#73 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#74 End VARIABLE z, depth difference: 0, stack offset: 8
	pop	{r0}
#75 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#76 Leaving FUNCTION (func1) with depth 2
#77 Starting FUNCTION (func2) with depth 2
_func2:
	push	{lr}
	push	{fp}
	mov	fp, sp
#78 Starting DECLARATION: adding space on stack
	push	{r0}
#79 Ending DECLARATION
#80 Starting DECLARATION: adding space on stack
	push	{r0}
#81 Ending DECLARATION
#82 Starting DECLARATION: adding space on stack
	push	{r0}
#83 Ending DECLARATION
#84 Starting DECLARATION: adding space on stack
	push	{r0}
#85 Ending DECLARATION
#86 Starting DECLARATION: adding space on stack
	push	{r0}
#87 Ending DECLARATION
#88 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#89 Starting VARIABLE
	ldr	r5, [fp, #24]
	push	{r5}
#90 End VARIABLE x, depth difference: 0, stack offset: 24
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#91 Starting VARIABLE
	ldr	r5, [fp, #20]
	push	{r5}
#92 End VARIABLE y, depth difference: 0, stack offset: 20
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#93 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#94 End VARIABLE z, depth difference: 0, stack offset: 16
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#95 Starting VARIABLE
	ldr	r5, [fp, #12]
	push	{r5}
#96 End VARIABLE w, depth difference: 0, stack offset: 12
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#97 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#98 End VARIABLE ae, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#99 Ending PRINT_STATEMENT
#100 Starting RETURN_STATEMENT
#101 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#102 End VARIABLE z, depth difference: 0, stack offset: 16
	pop	{r0}
#103 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#104 Leaving FUNCTION (func2) with depth 2
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
#105 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
