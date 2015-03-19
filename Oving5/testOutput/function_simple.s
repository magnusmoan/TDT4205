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
#6 Starting ASSIGNMENT_STATEMENT
#7 Starting CONSTANT
	movw	r5, #:lower16:5
	movt	r5, #:upper16:5
	push	{r5}
#8 End CONSTANT
	pop	{r5}
	str	r5, [fp, #-4]
#9 End ASSIGNMENT_STATEMENT
#10 Starting ASSIGNMENT_STATEMENT
	str	r0, [fp, #-8]
#11 End ASSIGNMENT_STATEMENT
#12 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#13 Starting VARIABLE
	ldr	r5, [fp, #-4]
	push	{r5}
#14 End VARIABLE a, depth difference: 0, stack offset: -4
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
#15 Starting VARIABLE
	ldr	r5, [fp, #-8]
	push	{r5}
#16 End VARIABLE b, depth difference: 0, stack offset: -8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#17 Ending PRINT_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#18 Leaving FUNCTION (main) with depth 2
#19 Starting FUNCTION (func) with depth 2
_func:
	push	{lr}
	push	{fp}
	mov	fp, sp
#20 Starting DECLARATION: adding space on stack
	push	{r0}
#21 Ending DECLARATION
#22 Starting PRINT_STATEMENT
	push	{r6}
	pop	{r6}
#23 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#24 End VARIABLE x, depth difference: 0, stack offset: 8
	movw  r0, #:lower16:.INTEGER
	movt  r0, #:upper16:.INTEGER
	pop	{r1}
	bl	printf
	movw	r0, #:lower16:0x0A
	movt	r0, #:upper16:0x0A
	bl	putchar
#25 Ending PRINT_STATEMENT
#26 Starting RETURN_STATEMENT
#27 Starting VARIABLE
	ldr	r5, [fp, #8]
	push	{r5}
#28 End VARIABLE x, depth difference: 0, stack offset: 8
	pop	{r0}
#29 End RETURN_STATEMENT
	mov	sp, fp
	pop	{fp}
	pop	{pc}
#30 Leaving FUNCTION (func) with depth 2
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
#31 End PROGRAM
	mov	sp, fp
	pop	{fp}
	bl	exit
.end
