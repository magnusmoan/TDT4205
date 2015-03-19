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
	movw	r6, #:lower16:36
	movt	r6, #:upper16:36
	push	{r6}
	bl	_malloc
	pop	{r6}
#6 Ending EXPRESSION of type NEW
	str	r0, [fp, #-4]
#7 End ASSIGNMENT_STATEMENT
#8 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:8
	movt	r2, #:upper16:8
	add	r3, r3, r2
#9 Starting CONSTANT
	movw	r5, #:lower16:5
	movt	r5, #:upper16:5
	push	{r5}
#10 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#11 End ASSIGNMENT_STATEMENT
#12 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#13 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-4]
	movw	r6, #:lower16:8
	movt	r6, #:upper16:8
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#14 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#15 Ending PRINT_STATEMENT
#16 Starting DECLARATION: adding space on stack
	push	{r0}
#17 Ending DECLARATION
#18 Starting ASSIGNMENT_STATEMENT
#19 Starting EXPRESSION of type NEW
	movw	r6, #:lower16:256
	movt	r6, #:upper16:256
	push	{r6}
	bl	_malloc
	pop	{r6}
#20 Ending EXPRESSION of type NEW
	str	r0, [fp, #-8]
#21 End ASSIGNMENT_STATEMENT
#22 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-8]
	movw	r2, #:lower16:8
	movt	r2, #:upper16:8
	add	r3, r3, r2
#23 Starting CONSTANT
	movw	r5, #:lower16:10
	movt	r5, #:upper16:10
	push	{r5}
#24 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#25 End ASSIGNMENT_STATEMENT
#26 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#27 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-8]
	movw	r6, #:lower16:0
	movt	r6, #:upper16:0
	add	r5, r5, r6
	ldr	r5, [r5]
	push	{r5}
#28 Ending EXPRESSION of type ARRAY_INDEX
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#29 Ending PRINT_STATEMENT
#30 Starting DECLARATION: adding space on stack
	push	{r0}
#31 Ending DECLARATION
#32 Starting ASSIGNMENT_STATEMENT
#33 Starting EXPRESSION of type FUNC_CALL
	bl	_create
#34 Ending EXPRESSION of type FUNC_CALL
	str	r0, [fp, #-12]
#35 End ASSIGNMENT_STATEMENT
#36 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#37 Starting EXPRESSION of type ARRAY_INDEX
	ldr	r5, [fp, #-12]
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
#41 Starting FUNCTION (create) with depth 2
_create:
	push	{lr}
	push	{fp}
	mov	fp, sp
#42 Starting DECLARATION: adding space on stack
	push	{r0}
#43 Ending DECLARATION
#44 Starting ASSIGNMENT_STATEMENT
#45 Starting EXPRESSION of type NEW
	movw	r6, #:lower16:12
	movt	r6, #:upper16:12
	push	{r6}
	bl	_malloc
	pop	{r6}
#46 Ending EXPRESSION of type NEW
	str	r0, [fp, #-4]
#47 End ASSIGNMENT_STATEMENT
#48 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:0
	movt	r2, #:upper16:0
	add	r3, r3, r2
#49 Starting CONSTANT
	movw	r5, #:lower16:1
	movt	r5, #:upper16:1
	push	{r5}
#50 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#51 End ASSIGNMENT_STATEMENT
#52 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:4
	movt	r2, #:upper16:4
	add	r3, r3, r2
#53 Starting CONSTANT
	movw	r5, #:lower16:2
	movt	r5, #:upper16:2
	push	{r5}
#54 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#55 End ASSIGNMENT_STATEMENT
#56 Starting ASSIGNMENT_STATEMENT
	ldr	r3, [fp, #-4]
	movw	r2, #:lower16:8
	movt	r2, #:upper16:8
	add	r3, r3, r2
#57 Starting CONSTANT
	movw	r5, #:lower16:3
	movt	r5, #:upper16:3
	push	{r5}
#58 End CONSTANT
	pop	{r0}
	str	r0, [r3]
#59 End ASSIGNMENT_STATEMENT
#60 Starting RETURN_STATEMENT
#61 Starting VARIABLE
	ldr	r5, [fp, #-4]
	push	{r5}
#62 End VARIABLE a, depth difference: 0, stack offset: -4
	pop	{r0}
#63 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#64 Leaving FUNCTION (create) with depth 2
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
#65 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
