	.file	"DMLog.c"
	.text
.Ltext0:
	.comm	fp,4,4
	.section	.rodata
.LC0:
	.string	"Inside new thread "
	.text
	.type	thread_start, @function
thread_start:
.LFB0:
	.file 1 "DMLog.c"
	.loc 1 13 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 14 0
	movl	$.LC0, (%esp)
	call	puts
.L2:
	.loc 1 20 0 discriminator 1
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	thread_start, .-thread_start
	.comm	t,4,4
	.section	.rodata
.LC1:
	.string	"After create thread"
.LC2:
	.string	"After detach"
	.text
	.globl	init
	.type	init, @function
init:
.LFB1:
	.loc 1 28 0
	.cfi_startproc
	pushl	%ebp
.LCFI2:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI3:
	.cfi_def_cfa_register 5
	subl	$72, %esp
	.loc 1 28 0
	movl	%gs:20, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	.loc 1 34 0
	leal	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	pthread_attr_init
	.loc 1 36 0
	leal	-48(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$thread_start, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$t, (%esp)
	call	pthread_create
	.loc 1 38 0
	movl	$.LC1, (%esp)
	call	puts
	.loc 1 40 0
	movl	t, %eax
	movl	%eax, (%esp)
	call	pthread_detach
	.loc 1 42 0
	movl	$.LC2, (%esp)
	call	puts
	.loc 1 44 0
	movl	$0, %eax
	.loc 1 45 0
	movl	-12(%ebp), %edx
	xorl	%gs:20, %edx
	je	.L4
	call	__stack_chk_fail
.L4:
	leave
	.cfi_restore 5
.LCFI4:
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	init, .-init
	.section	.rodata
	.align 4
.LC3:
	.string	"Log Call received with log level: %d  and MSG : %s \n"
	.text
	.globl	DMLog
	.type	DMLog, @function
DMLog:
.LFB2:
	.loc 1 51 0
	.cfi_startproc
	pushl	%ebp
.LCFI5:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI6:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 53 0
	movl	8(%ebp), %eax
	testl	%eax, %eax
	jne	.L8
.L7:
	.loc 1 57 0
	movl	t, %eax
	movl	$10, 4(%esp)
	movl	%eax, (%esp)
	call	pthread_kill
	.loc 1 61 0
	jmp	.L10
.L8:
.L10:
	nop
.L9:
	.loc 1 64 0
	movl	$.LC3, %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	.loc 1 65 0
	leave
	.cfi_restore 5
.LCFI7:
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	DMLog, .-DMLog
.Letext0:
	.file 2 "/usr/lib/gcc/i686-linux-gnu/4.6/include/stddef.h"
	.file 3 "/usr/include/i386-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/i386-linux-gnu/bits/pthreadtypes.h"
	.file 7 "../inc/logutility.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x404
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF62
	.byte	0x1
	.long	.LASF63
	.long	.LASF64
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF8
	.byte	0x2
	.byte	0xd4
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x38
	.long	0x61
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x8d
	.long	0x85
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x8e
	.long	0x6f
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.long	0x9f
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x2
	.long	.LASF14
	.byte	0x4
	.byte	0x31
	.long	0xb1
	.uleb128 0x7
	.long	.LASF44
	.byte	0x94
	.byte	0x5
	.value	0x111
	.long	0x272
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.value	0x112
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.value	0x117
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.value	0x118
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.value	0x119
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.value	0x11a
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.value	0x11b
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.value	0x11c
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.long	.LASF22
	.byte	0x5
	.value	0x11d
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.long	.LASF23
	.byte	0x5
	.value	0x11e
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.long	.LASF24
	.byte	0x5
	.value	0x120
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.long	.LASF25
	.byte	0x5
	.value	0x121
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.long	.LASF26
	.byte	0x5
	.value	0x122
	.long	0x99
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.long	.LASF27
	.byte	0x5
	.value	0x124
	.long	0x2b0
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.long	.LASF28
	.byte	0x5
	.value	0x126
	.long	0x2b6
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.long	.LASF29
	.byte	0x5
	.value	0x128
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.long	.LASF30
	.byte	0x5
	.value	0x12c
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.long	.LASF31
	.byte	0x5
	.value	0x12e
	.long	0x7a
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.long	.LASF32
	.byte	0x5
	.value	0x132
	.long	0x3e
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.long	.LASF33
	.byte	0x5
	.value	0x133
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x46
	.uleb128 0x8
	.long	.LASF34
	.byte	0x5
	.value	0x134
	.long	0x2bc
	.byte	0x2
	.byte	0x23
	.uleb128 0x47
	.uleb128 0x8
	.long	.LASF35
	.byte	0x5
	.value	0x138
	.long	0x2cc
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.long	.LASF36
	.byte	0x5
	.value	0x141
	.long	0x8c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x8
	.long	.LASF37
	.byte	0x5
	.value	0x14a
	.long	0x97
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x8
	.long	.LASF38
	.byte	0x5
	.value	0x14b
	.long	0x97
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.long	.LASF39
	.byte	0x5
	.value	0x14c
	.long	0x97
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x8
	.long	.LASF40
	.byte	0x5
	.value	0x14d
	.long	0x97
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.long	.LASF41
	.byte	0x5
	.value	0x14e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.long	.LASF42
	.byte	0x5
	.value	0x150
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.long	.LASF43
	.byte	0x5
	.value	0x152
	.long	0x2d2
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.long	.LASF65
	.byte	0x5
	.byte	0xb6
	.uleb128 0xa
	.long	.LASF45
	.byte	0xc
	.byte	0x5
	.byte	0xbc
	.long	0x2b0
	.uleb128 0xb
	.long	.LASF46
	.byte	0x5
	.byte	0xbd
	.long	0x2b0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.long	.LASF47
	.byte	0x5
	.byte	0xbe
	.long	0x2b6
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.long	.LASF48
	.byte	0x5
	.byte	0xc2
	.long	0x5a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x279
	.uleb128 0x6
	.byte	0x4
	.long	0xb1
	.uleb128 0xc
	.long	0x9f
	.long	0x2cc
	.uleb128 0xd
	.long	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.long	0x272
	.uleb128 0xc
	.long	0x9f
	.long	0x2e2
	.uleb128 0xd
	.long	0x30
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF49
	.byte	0x6
	.byte	0x24
	.long	0x45
	.uleb128 0xe
	.byte	0x24
	.byte	0x6
	.byte	0x27
	.long	0x30c
	.uleb128 0xf
	.long	.LASF50
	.byte	0x6
	.byte	0x29
	.long	0x30c
	.uleb128 0xf
	.long	.LASF51
	.byte	0x6
	.byte	0x2a
	.long	0x85
	.byte	0
	.uleb128 0xc
	.long	0x9f
	.long	0x31c
	.uleb128 0xd
	.long	0x30
	.byte	0x23
	.byte	0
	.uleb128 0x2
	.long	.LASF52
	.byte	0x6
	.byte	0x2b
	.long	0x2ed
	.uleb128 0x10
	.byte	0x4
	.byte	0x7
	.byte	0xa
	.long	0x348
	.uleb128 0x11
	.long	.LASF53
	.sleb128 0
	.uleb128 0x11
	.long	.LASF54
	.sleb128 1
	.uleb128 0x11
	.long	.LASF55
	.sleb128 2
	.uleb128 0x11
	.long	.LASF56
	.sleb128 3
	.byte	0
	.uleb128 0x2
	.long	.LASF57
	.byte	0x7
	.byte	0xf
	.long	0x327
	.uleb128 0x12
	.long	.LASF66
	.byte	0x1
	.byte	0xc
	.byte	0x1
	.long	0x97
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.long	0x37e
	.uleb128 0x13
	.string	"arg"
	.byte	0x1
	.byte	0xc
	.long	0x97
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF58
	.byte	0x1
	.byte	0x1b
	.long	0x5a
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.long	0x3a9
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.byte	0x1e
	.long	0x31c
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF59
	.byte	0x1
	.byte	0x32
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST2
	.long	0x3e0
	.uleb128 0x17
	.long	.LASF60
	.byte	0x1
	.byte	0x32
	.long	0x348
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF61
	.byte	0x1
	.byte	0x32
	.long	0x99
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.byte	0
	.uleb128 0x19
	.string	"fp"
	.byte	0x1
	.byte	0x9
	.long	0x3f1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	fp
	.uleb128 0x6
	.byte	0x4
	.long	0xa6
	.uleb128 0x19
	.string	"t"
	.byte	0x1
	.byte	0x19
	.long	0x2e2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	t
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST1:
	.long	.LFB1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI2-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI4-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB2-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI5-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"__quad_t"
.LASF57:
	.string	"DMLogLevel"
.LASF63:
	.string	"DMLog.c"
.LASF26:
	.string	"_IO_save_end"
.LASF59:
	.string	"DMLog"
.LASF5:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF66:
	.string	"thread_start"
.LASF36:
	.string	"_offset"
.LASF20:
	.string	"_IO_write_ptr"
.LASF15:
	.string	"_flags"
.LASF22:
	.string	"_IO_buf_base"
.LASF51:
	.string	"__align"
.LASF27:
	.string	"_markers"
.LASF17:
	.string	"_IO_read_end"
.LASF44:
	.string	"_IO_FILE"
.LASF64:
	.string	"/home/saurabh/AppleAssignment/src"
.LASF61:
	.string	"format"
.LASF35:
	.string	"_lock"
.LASF11:
	.string	"long int"
.LASF32:
	.string	"_cur_column"
.LASF48:
	.string	"_pos"
.LASF55:
	.string	"DM_LOG_TRACE"
.LASF47:
	.string	"_sbuf"
.LASF31:
	.string	"_old_offset"
.LASF53:
	.string	"DM_LOG_ERROR"
.LASF1:
	.string	"unsigned char"
.LASF4:
	.string	"signed char"
.LASF7:
	.string	"long long unsigned int"
.LASF0:
	.string	"unsigned int"
.LASF45:
	.string	"_IO_marker"
.LASF34:
	.string	"_shortbuf"
.LASF19:
	.string	"_IO_write_base"
.LASF43:
	.string	"_unused2"
.LASF16:
	.string	"_IO_read_ptr"
.LASF50:
	.string	"__size"
.LASF23:
	.string	"_IO_buf_end"
.LASF56:
	.string	"DM_LOG_INFO"
.LASF13:
	.string	"char"
.LASF58:
	.string	"init"
.LASF46:
	.string	"_next"
.LASF37:
	.string	"__pad1"
.LASF38:
	.string	"__pad2"
.LASF39:
	.string	"__pad3"
.LASF40:
	.string	"__pad4"
.LASF41:
	.string	"__pad5"
.LASF2:
	.string	"short unsigned int"
.LASF3:
	.string	"long unsigned int"
.LASF21:
	.string	"_IO_write_end"
.LASF54:
	.string	"DM_LOG_WARNING"
.LASF12:
	.string	"__off64_t"
.LASF29:
	.string	"_fileno"
.LASF28:
	.string	"_chain"
.LASF67:
	.string	"attr"
.LASF10:
	.string	"__off_t"
.LASF25:
	.string	"_IO_backup_base"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF18:
	.string	"_IO_read_base"
.LASF60:
	.string	"logLevel"
.LASF33:
	.string	"_vtable_offset"
.LASF62:
	.string	"GNU C 4.6.3"
.LASF24:
	.string	"_IO_save_base"
.LASF14:
	.string	"FILE"
.LASF52:
	.string	"pthread_attr_t"
.LASF49:
	.string	"pthread_t"
.LASF6:
	.string	"long long int"
.LASF65:
	.string	"_IO_lock_t"
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
