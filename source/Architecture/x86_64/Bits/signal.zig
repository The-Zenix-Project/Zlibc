// SPDX-License-Identifier: LGPL-3.0-or-later
// SPDX-FileCopyrightText: 2026 Wakana Kisarazu <wakanakisarazu.work@gmail.com>



pub const Register = enum (u8)
{
    r8 = 0,
    r9 = 1,
    r10 = 2,
    r11 = 3,
    r12 = 4,
    r13 = 5,
    r14 = 6,
    r15 = 7,
    rdi = 8,
    rsi = 9,
    rbp = 10,
    rbx = 11,
    rdx = 12,
    rax = 13,
    rcx = 14,
    rsp = 15,
    rip = 16,
    efl = 17,
    csgsfs = 18,
    err = 19,
    trapno = 20,
    oldmask = 21,
    cr2 = 22,

    pub inline fn toInteger(this: @This()) u8 { return @intFromEnum(this); }
    pub inline fn toString(this: @This()) []const u8 { return @tagName(this); }
};


pub const SignalAction = packed struct (u32)
{
    nocldstop:      bool = false,
    nocldwait:      bool = false,

    __reserved_1:   bool = false,

    siginfo:        bool = false,

    __reserved_2:   u22 = 0,

    onstack:        bool = false,
    restorer:       bool = false,
    restart:        bool = false,

    __reserved_3:   u1 = 0,

    nodefer:        bool = false,
    resethand:      bool = false,
};

pub const Signal = enum (u8)
{
    hup = 1,
    int = 2,
    quit = 3,
    ill = 4,
    trap = 5,
    abrt = 6,
    iot = 6,
    bus = 7,
    fpe = 8,
    kill = 9,
    usr1 = 10,
    segv = 11,
    usr2 = 12,
    pipe = 13,
    alrm = 14,
    term = 15,
    stkflt = 16,
    chld = 17,
    cont = 18,
    tstp = 20,
    ttin = 21,
    ttou = 22,
    urg = 23,
    xcpu = 24,
    xfsz = 25,
    vtalrm = 26,
    prof = 27,
    winch = 28,
    io = 29,
    poll = 29,
    pwr = 30,
    sys = 31,
    unused = 31,

    pub inline fn toInteger(this: @This()) u8 { return @intFromEnum(this); }
    pub inline fn toString(this: @This()) []const u8 { return @tagName(this); }
};

pub const generalregister = i64;
pub const generalregisterset = [23]generalregister;

const FpState = struct 
{
    cwd:        u16,
    swd:        u16,
    ftw:        u16,
    fop:        u16,

    rip:        u64,
    rdp:        u64,

    mxcsr:      u32,
    mxcr_mask:  u32,

    st:         [8]struct {
        significand:    [4]u16,
        exponent:       u16,

        __padding:      [3]u16,
    },

    xmm:        [16]struct {
        element:    [4]u8,
    },

    __padding:  [24]u8,
};

pub const floatingpointerregisterset = FpState;

pub const Context = struct 
{
    r8:             u64,
    r9:             u64,
    r10:            u64,
    r11:            u64,
    r12:            u64,
    r13:            u64,
    r14:            u64,
    r15:            u64,

    rdi:            u64,
    rsi:            u64,
    rbp:            u64,
    rbx:            u64,
    rax:            u64,
    rcx:            u64,
    rsp:            u64,
    rip:            u64,
    
    eflags:         u64,

    cs:             u16,
    gs:             u16,
    fs:             u16,

    __padding_1:    u16,

    fpstate:        *FpState,

    __reserved_1:   [8]u64,
};

// TODO: Make a if/else for GNU_SOURCE/BSD_SOURCE
pub const MachineContext = struct 
{
    general_registers:          generalregisterset,
    floating_point_registers:   floatingpointerregisterset,

    __reserved:                 [8]u64,
};

pub const SigaltStack = struct 
{
    ss_sp:      *anyopaque,
    ss_flags:   u32,
    ss_size:    usize,
};