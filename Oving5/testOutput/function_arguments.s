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
	pop	{r5}
	str	r5, [fp, #-4]
#11 End ASSIGNMENT_STATEMENT
#12 Starting ASSIGNMENT_STATEMENT
	pop	{r5}
	str	r5, [fp, #-8]
#13 End ASSIGNMENT_STATEMENT
#14 Starting ASSIGNMENT_STATEMENT
	pop	{r5}
	str	r5, [fp, #-12]
#15 End ASSIGNMENT_STATEMENT
#16 Starting ASSIGNMENT_STATEMENT
	pop	{r5}
	str	r5, [fp, #-16]
#17 End ASSIGNMENT_STATEMENT
#18 Starting DECLARATION: adding space on stack
	push	{r0}
#19 Ending DECLARATION
#20 Starting DECLARATION: adding space on stack
	push	{r0}
#21 Ending DECLARATION
#22 Starting ASSIGNMENT_STATEMENT
	str	r0, [fp, #-20]
#23 End ASSIGNMENT_STATEMENT
#24 Starting ASSIGNMENT_STATEMENT
	str	r0, [fp, #-24]
#25 End ASSIGNMENT_STATEMENT
#26 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#27 Starting VARIABLE
	ldr	r5, [fp, #-20]
	push	{r5}
#28 End VARIABLE e, depth difference: 0, stack offset: -20
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#29 Starting VARIABLE
	ldr	r5, [fp, #-24]
	push	{r5}
#30 End VARIABLE f, depth difference: 0, stack offset: -24
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#31 Ending PRINT_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#32 Leaving FUNCTION (main) with depth 2
#33 Starting FUNCTION (func1) with depth 2
_func1:
	push	{lr}
	push	{fp}
	mov	fp, sp
#34 Starting DECLARATION: adding space on stack
	push	{r0}
#35 Ending DECLARATION
#36 Starting DECLARATION: adding space on stack
	push	{r0}
#37 Ending DECLARATION
#38 Starting DECLARATION: adding space on stack
	push	{r0}
#39 Ending DECLARATION
#40 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#41 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#42 End VARIABLE x, depth difference: 0, stack offset: 16
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#43 Starting VARIABLE
	ldr	r5, [fp, #12]
	push	{r5}
#44 End VARIABLE y, depth difference: 0, stack offset: 12
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#45 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#46 End VARIABLE z, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#47 Ending PRINT_STATEMENT
#48 Starting RETURN_STATEMENT
#49 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#50 End VARIABLE z, depth difference: 0, stack offset: 8
	pop	{r0}
#51 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#52 Leaving FUNCTION (func1) with depth 2
#53 Starting FUNCTION (func2) with depth 2
_func2:
	push	{lr}
	push	{fp}
	mov	fp, sp
#54 Starting DECLARATION: adding space on stack
	push	{r0}
#55 Ending DECLARATION
#56 Starting DECLARATION: adding space on stack
	push	{r0}
#57 Ending DECLARATION
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
	ldr	r5, [fp, #24]
	push	{r5}
#66 End VARIABLE x, depth difference: 0, stack offset: 24
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#67 Starting VARIABLE
	ldr	r5, [fp, #20]
	push	{r5}
#68 End VARIABLE y, depth difference: 0, stack offset: 20
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#69 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#70 End VARIABLE z, depth difference: 0, stack offset: 16
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#71 Starting VARIABLE
	ldr	r5, [fp, #12]
	push	{r5}
#72 End VARIABLE w, depth difference: 0, stack offset: 12
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#73 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#74 End VARIABLE ae, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#75 Ending PRINT_STATEMENT
#76 Starting RETURN_STATEMENT
#77 Starting VARIABLE
	ldr	r5, [fp, #16]
	push	{r5}
#78 End VARIABLE z, depth difference: 0, stack offset: 16
	pop	{r0}
#79 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#80 Leaving FUNCTION (func2) with depth 2
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
#81 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
