; SPDX-License-Identifier: LGPL-3.0-or-later
; SPDX-FileCopyrightText: 2026 Wakana Kisarazu <wakanakisarazu.work@gmail.com>
.intel_syntax noprefix



.text
.global_start
.type runtime_entry, @function

runtime_entry:
    xor rbp, rbp        ; Clear `rbp`
    mov rdi, rsp        ; Pass stack
    and rsp, -16        ; Align stack
    call runtime_start  ; Start runtime