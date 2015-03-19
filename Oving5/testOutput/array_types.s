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
#8 Starting ASSIGNMENT_STATEMENT
#9 Starting EXPRESSION of type NEW
	movw	r6, #:lower16:240
	movt	r6, #:upper16:240
	push	{r6}
	bl	_malloc
	pop	{r6}
#10 Ending EXPRESSION of type NEW
	str	r0, [fp, #-4]
#11 End ASSIGNMENT_STATEMENT
#12 Starting ASSIGNMENT_STATEMENT
#13 Starting EXPRESSION of type NEW
	movw	r6, #:lower16:20
	movt	r6, #:upper16:20
	push	{r6}
	bl	_malloc
	pop	{r6}
#14 Ending EXPRESSION of type NEW
	str	r0, [fp, #-12]
#15 End ASSIGNMENT_STATEMENT
#16 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:12
	movt	r2, #:upper16:12
	add	r3, r3, r2
#17 Starting CONSTANT
	movw	r5, #:lower16:42
	movt	r5, #:upper16:42
	push	{r5}
#18 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#19 End ASSIGNMENT_STATEMENT
#20 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-12]
	movw	r2, #:lower16:12
	movt	r2, #:upper16:12
	add	r3, r3, r2
#21 Starting CONSTANT
	movw	r5, #:lower16:43
	movt	r5, #:upper16:43
	push	{r5}
#22 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#23 End ASSIGNMENT_STATEMENT
#24 Starting ASSIGNMENT_STATEMENT
#25 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-4]
	movw	r6, #:lower16:4
	movt	r6, #:upper16:4
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#26 Ending EXPRESSION of type ARRAY_INDEX
	str	r0, [fp, #-8]
#27 End ASSIGNMENT_STATEMENT
#28 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#29 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-8]
	movw	r6, #:lower16:8
	movt	r6, #:upper16:8
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#30 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#31 Ending PRINT_STATEMENT
#32 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-8]
	movw	r2, #:lower16:4
	movt	r2, #:upper16:4
	add	r3, r3, r2
#33 Starting VARIABLE
	ldr	r5, [fp, #-12]
	push	{r5}
#34 End VARIABLE c, depth difference: 0, stack offset: -12
	pop	{r0}
	str	r0, [r3]
#35 End ASSIGNMENT_STATEMENT
#36 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#37 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-8]
	movw	r6, #:lower16:4
	movt	r6, #:upper16:4
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
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#40 Leaving FUNCTION (main) with depth 2
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
#41 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
