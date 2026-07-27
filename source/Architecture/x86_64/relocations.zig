// SPDX-License-Identifier: LGPL-3.0-or-later
// SPDX-FileCopyrightText: 2026 Wakana Kisarazu <wakanakisarazu.work@gmail.com>



const LDSO_ARCHITECTURE = "x86_64";

const RelocationKind = enum (u32)
{
    symbolic = 1,
    offset32 = 2, 
    got = 3,
    plt = 4,
    relative = 5,
    copy = 6,
    dtpmod = 7,
    dtpoff = 8,
    tpoff = 9,
    tlsdesc = 10
};