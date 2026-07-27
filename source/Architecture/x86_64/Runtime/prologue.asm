; SPDX-License-Identifier: LGPL-3.0-or-later
; SPDX-FileCopyrightText: 2026 Wakana Kisarazu <wakanakisarazu.work@gmail.com>
.intel_syntax noprefix



.section .init
.global _init
_init:
	push %rax

.section .fini
.global _fini
_fini:
	push %rax