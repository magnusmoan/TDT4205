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
#1 Starting FUNCTION (arrayTest) with depth 2
_arrayTest:
	push	{lr}
	push	{fp}
	mov	fp, sp
#2 Starting DECLARATION: adding space on stack
	push	{r0}
#3 Ending DECLARATION
#4 Starting DECLARATION: adding space on stack
	push	{r0}
#5 Ending DECLARATION
#6 Starting ASSIGNMENT_STATEMENT
#7 Starting VARIABLE
	ldr	r5, [fp, #-4]
	push	{r5}
#8 End VARIABLE a, depth difference: 0, stack offset: -4
#9 Starting CONSTANT
	movw	r5, #:lower16:66
	movt	r5, #:upper16:66
	push	{r5}
#10 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-4]
#11 End ASSIGNMENT_STATEMENT
#12 Starting ASSIGNMENT_STATEMENT
#13 Starting VARIABLE
	ldr	r5, [fp, #-8]
	push	{r5}
#14 End VARIABLE b, depth difference: 0, stack offset: -8
#15 Starting CONSTANT
	movw	r5, #:lower16:44
	movt	r5, #:upper16:44
	push	{r5}
#16 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-8]
#17 End ASSIGNMENT_STATEMENT
#18 Starting DECLARATION: adding space on stack
	push	{r0}
#19 Ending DECLARATION
#20 Starting ASSIGNMENT_STATEMENT
#21 Starting VARIABLE
	ldr	r5, [fp, #-12]
	push	{r5}
#22 End VARIABLE array, depth difference: 0, stack offset: -12
#23 Starting EXPRESSION of type NEW
	ldr	r5, [2]
	push	{r5}
	bl	_malloc
#24 Ending EXPRESSION of type NEW
	pop	{r5}
	str	r5, [fp, #-12]
#25 End ASSIGNMENT_STATEMENT
#26 Starting ASSIGNMENT_STATEMENT
#27 Starting EXPRESSION of type ARRAY_INDEX
#28 Ending EXPRESSION of type ARRAY_INDEX
#29 Starting VARIABLE
	ldr	r5, [fp, #-4]
	push	{r5}
#30 End VARIABLE a, depth difference: 0, stack offset: -4
	ldr	r5, [fp, #-12]
	movw	r6, #:lower16:0
	movt	r6, #:upper16:0
	add	r6, r6, r5
	pop	{r5}
	str	r5, [r6]
#31 End ASSIGNMENT_STATEMENT
#32 Starting ASSIGNMENT_STATEMENT
#33 Starting EXPRESSION of type ARRAY_INDEX
#34 Ending EXPRESSION of type ARRAY_INDEX
#35 Starting VARIABLE
	ldr	r5, [fp, #-8]
	push	{r5}
#36 End VARIABLE b, depth difference: 0, stack offset: -8
	ldr	r5, [fp, #-12]
	movw	r6, #:lower16:1
	movt	r6, #:upper16:1
	add	r6, r6, r5
	pop	{r5}
	str	r5, [r6]
#37 End ASSIGNMENT_STATEMENT
#38 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#39 Starting EXPRESSION of type ARRAY_INDEX
#40 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#41 Starting EXPRESSION of type ARRAY_INDEX
#42 Ending EXPRESSION of type ARRAY_INDEX
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
#44 Leaving FUNCTION (arrayTest) with depth 2
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
	bl	_arrayTest
#45 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
