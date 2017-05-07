; RUN: tesla instrument %s -tesla-manifest %p/Inputs/kern_cpuset.tesla -o %t

; ModuleID = 'kern_cpuset.bc'
source_filename = "kern_cpuset.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd11.0"

module asm ".ident\09\22$FreeBSD: head/sys/kern/kern_cpuset.c 239923 2012-08-30 21:22:47Z attilio $\22"
module asm ".globl __start_set_pcpu"
module asm ".globl __stop_set_pcpu"
module asm ".globl __start_set_sysctl_set"
module asm ".globl __stop_set_sysctl_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"

%struct.sysctl_oid = type { %struct.sysctl_oid_list*, %struct.anon, i32, i32, i8*, i64, i8*, i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)*, i8*, i32, i32, i8* }
%struct.sysctl_oid_list = type { %struct.sysctl_oid* }
%struct.anon = type { %struct.sysctl_oid* }
%struct.sysctl_req = type { %struct.thread*, i32, i8*, i64, i64, i32 (%struct.sysctl_req*, i8*, i64)*, i8*, i64, i64, i32 (%struct.sysctl_req*, i8*, i64)*, i64, i32 }
%struct.thread = type { %struct.mtx*, %struct.proc*, %struct.anon.35, %struct.anon.36, %struct.anon.37, %struct.anon.38, %struct.anon.39, %struct.cpuset*, %struct.seltd*, %struct.sleepqueue*, %struct.turnstile*, %struct.rl_q_entry*, %struct.umtx_q*, i32, %struct.sigqueue, i8, i32, i32, i32, i32, i32, i8*, i8*, i8, i8, i8, i8, i16, i16, i16, i16, %struct.turnstile*, i8*, %struct.anon.40, %struct.lock_list_entry*, i32, i32, %struct.ucred*, i32, i32, i32, i32, i32, %struct.rusage, %struct.rusage_ext, i64, i64, i32, i32, i32, i32, i32, %struct.__sigset, i32, %struct.sigaltstack, i32, i64, i32, [20 x i8], %struct.file*, i32, %struct.ksiginfo, i32, %struct.osd, %struct.vm_map_entry*, i32, i32, i32, i32, %struct.__sigset, i8, i8, i8, i8, i8, i8, %struct.pcb*, i32, [2 x i64], %struct.callout, %struct.trapframe*, %struct.vm_object*, i64, i32, i32, %struct.mdthread, %struct.td_sched*, %struct.kaudit_record*, [2 x %struct.lpohead], %struct.kdtrace_thread*, i32, %struct.vnet*, i8*, %struct.trapframe*, %struct.proc*, %struct.vm_page**, i32, %struct.tesla_store* }
%struct.mtx = type { %struct.lock_object, i64 }
%struct.lock_object = type { i8*, i32, i32, %struct.witness* }
%struct.witness = type opaque
%struct.anon.35 = type { %struct.thread*, %struct.thread** }
%struct.anon.36 = type { %struct.thread*, %struct.thread** }
%struct.anon.37 = type { %struct.thread*, %struct.thread** }
%struct.anon.38 = type { %struct.thread*, %struct.thread** }
%struct.anon.39 = type { %struct.thread*, %struct.thread** }
%struct.cpuset = type { %struct._cpuset, i32, i32, i32, %struct.cpuset*, %struct.anon.7, %struct.anon.8, %struct.setlist }
%struct._cpuset = type { [1 x i64] }
%struct.anon.7 = type { %struct.cpuset*, %struct.cpuset** }
%struct.anon.8 = type { %struct.cpuset*, %struct.cpuset** }
%struct.setlist = type { %struct.cpuset* }
%struct.seltd = type opaque
%struct.sleepqueue = type opaque
%struct.rl_q_entry = type opaque
%struct.umtx_q = type opaque
%struct.sigqueue = type { %struct.__sigset, %struct.__sigset, %struct.anon.24, %struct.proc*, i32 }
%struct.anon.24 = type { %struct.ksiginfo*, %struct.ksiginfo** }
%struct.turnstile = type opaque
%struct.anon.40 = type { %struct.turnstile* }
%struct.lock_list_entry = type opaque
%struct.ucred = type { i32, i32, i32, i32, i32, i32, i32, %struct.uidinfo*, %struct.uidinfo*, %struct.prison*, %struct.loginclass*, i32, [2 x i8*], %struct.label*, %struct.auditinfo_addr, i32*, i32 }
%struct.uidinfo = type opaque
%struct.prison = type { %struct.anon.2, i32, i32, i32, i32, %struct.anon.3, %struct.anon.4, %struct.prison*, %struct.mtx, %struct.task, %struct.osd, %struct.cpuset*, %struct.vnet*, %struct.vnode*, i32, i32, %struct.in_addr*, %struct.in6_addr*, %struct.prison_racct*, [3 x i8*], i32, i32, i32, i32, i32, i32, [4 x i32], i64, [256 x i8], [1024 x i8], [256 x i8], [256 x i8], [64 x i8] }
%struct.anon.2 = type { %struct.prison*, %struct.prison** }
%struct.anon.3 = type { %struct.prison* }
%struct.anon.4 = type { %struct.prison*, %struct.prison** }
%struct.task = type { %struct.anon.5, i16, i16, void (i8*, i32)*, i8* }
%struct.anon.5 = type { %struct.task* }
%struct.vnode = type opaque
%struct.in_addr = type opaque
%struct.in6_addr = type opaque
%struct.prison_racct = type { %struct.anon.9, [256 x i8], i32, %struct.racct* }
%struct.anon.9 = type { %struct.prison_racct*, %struct.prison_racct** }
%struct.racct = type opaque
%struct.loginclass = type opaque
%struct.label = type opaque
%struct.auditinfo_addr = type { i32, %struct.au_mask, %struct.au_tid_addr, i32, i64 }
%struct.au_mask = type { i32, i32 }
%struct.au_tid_addr = type { i32, i32, [4 x i32] }
%struct.rusage = type { %struct.timeval, %struct.timeval, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.rusage_ext = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.sigaltstack = type { i8*, i64, i32 }
%struct.file = type opaque
%struct.ksiginfo = type { %struct.anon.17, %struct.__siginfo, i32, %struct.sigqueue* }
%struct.anon.17 = type { %struct.ksiginfo*, %struct.ksiginfo** }
%struct.__siginfo = type { i32, i32, i32, i32, i32, i32, i8*, %union.sigval, %union.anon.18 }
%union.sigval = type { i8* }
%union.anon.18 = type { %struct.anon.23 }
%struct.anon.23 = type { i64, [7 x i32] }
%struct.osd = type { i32, i8**, %struct.anon.6 }
%struct.anon.6 = type { %struct.osd*, %struct.osd** }
%struct.vm_map_entry = type opaque
%struct.__sigset = type { [4 x i32] }
%struct.pcb = type opaque
%struct.callout = type { %union.anon, i64, i64, i8*, void (i8*)*, %struct.lock_object*, i32, i32 }
%union.anon = type { %struct.anon.10 }
%struct.anon.10 = type { %struct.callout*, %struct.callout** }
%struct.vm_object = type opaque
%struct.mdthread = type { i32, i64, i64 }
%struct.td_sched = type opaque
%struct.kaudit_record = type opaque
%struct.lpohead = type { %struct.lock_profile_object* }
%struct.lock_profile_object = type opaque
%struct.kdtrace_thread = type opaque
%struct.vnet = type opaque
%struct.trapframe = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i32, i16, i16, i64, i32, i16, i16, i64, i64, i64, i64, i64, i64 }
%struct.proc = type { %struct.anon.0, %struct.anon.1, %struct.mtx, %struct.ucred*, %struct.filedesc*, %struct.filedesc_to_leader*, %struct.pstats*, %struct.plimit*, %struct.callout, %struct.sigacts*, i32, i32, i32, %struct.anon.13, %struct.anon.14, %struct.proc*, %struct.anon.15, %struct.anon.16, %struct.mtx, %struct.ksiginfo*, %struct.sigqueue, i32, %struct.vmspace*, i32, %struct.itimerval, %struct.rusage, %struct.rusage_ext, %struct.rusage_ext, i32, i32, i32, %struct.vnode*, %struct.ucred*, %struct.vnode*, i32, %struct.sigiolst, i32, i32, i64, i32, i32, i8, i8, %struct.nlminfo*, %struct.kaioinfo*, %struct.thread*, i32, %struct.thread*, i32, i32, %struct.itimers*, %struct.procdesc*, i32, i32, [20 x i8], %struct.pgrp*, %struct.sysentvec*, %struct.pargs*, i64, i8, i32, i16, %struct.knlist, i32, %struct.mdproc, %struct.callout, i16, %struct.proc*, %struct.proc*, i8*, %struct.label*, %struct.p_sched*, %struct.anon.31, %struct.anon.32, %struct.kdtrace_proc*, %struct.cv, %struct.cv, i64, %struct.racct*, i8, %struct.anon.33, %struct.anon.34 }
%struct.anon.0 = type { %struct.proc*, %struct.proc** }
%struct.anon.1 = type { %struct.thread*, %struct.thread** }
%struct.filedesc = type opaque
%struct.filedesc_to_leader = type opaque
%struct.pstats = type opaque
%struct.plimit = type opaque
%struct.sigacts = type { [128 x void (i32)*], [128 x %struct.__sigset], %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, i32, i32, %struct.mtx }
%struct.anon.13 = type { %struct.proc*, %struct.proc** }
%struct.anon.14 = type { %struct.proc*, %struct.proc** }
%struct.anon.15 = type { %struct.proc*, %struct.proc** }
%struct.anon.16 = type { %struct.proc* }
%struct.vmspace = type opaque
%struct.itimerval = type { %struct.timeval, %struct.timeval }
%struct.sigiolst = type { %struct.sigio* }
%struct.sigio = type { %union.anon.25, %struct.anon.26, %struct.sigio**, %struct.ucred*, i32 }
%union.anon.25 = type { %struct.proc* }
%struct.anon.26 = type { %struct.sigio* }
%struct.nlminfo = type opaque
%struct.kaioinfo = type opaque
%struct.itimers = type opaque
%struct.procdesc = type opaque
%struct.pgrp = type { %struct.anon.41, %struct.anon.42, %struct.session*, %struct.sigiolst, i32, i32, %struct.mtx }
%struct.anon.41 = type { %struct.pgrp*, %struct.pgrp** }
%struct.anon.42 = type { %struct.proc* }
%struct.session = type { i32, %struct.proc*, %struct.vnode*, %struct.cdev_priv*, %struct.tty*, i32, [40 x i8], %struct.mtx }
%struct.cdev_priv = type opaque
%struct.tty = type opaque
%struct.sysentvec = type opaque
%struct.pargs = type { i32, i32, [1 x i8] }
%struct.knlist = type { %struct.klist, void (i8*)*, void (i8*)*, void (i8*)*, void (i8*)*, i8* }
%struct.klist = type { %struct.knote* }
%struct.knote = type { %struct.anon.27, %struct.anon.28, %struct.knlist*, %struct.anon.29, %struct.kqueue*, %struct.kevent, i32, i32, i64, %union.anon.30, %struct.filterops*, i8*, i32 }
%struct.anon.27 = type { %struct.knote* }
%struct.anon.28 = type { %struct.knote* }
%struct.anon.29 = type { %struct.knote*, %struct.knote** }
%struct.kqueue = type opaque
%struct.kevent = type { i64, i16, i16, i32, i64, i8* }
%union.anon.30 = type { %struct.file* }
%struct.filterops = type { i32, i32 (%struct.knote*)*, void (%struct.knote*)*, i32 (%struct.knote*, i64)*, void (%struct.knote*, %struct.kevent*, i64)* }
%struct.mdproc = type { %struct.proc_ldt*, %struct.system_segment_descriptor }
%struct.proc_ldt = type { i8*, i32 }
%struct.system_segment_descriptor = type <{ [16 x i8] }>
%struct.p_sched = type opaque
%struct.anon.31 = type { %struct.ktr_request*, %struct.ktr_request** }
%struct.ktr_request = type opaque
%struct.anon.32 = type { %struct.mqueue_notifier* }
%struct.mqueue_notifier = type opaque
%struct.kdtrace_proc = type opaque
%struct.cv = type { i8*, i32 }
%struct.anon.33 = type { %struct.proc*, %struct.proc** }
%struct.anon.34 = type { %struct.proc* }
%struct.vm_page = type opaque
%struct.tesla_store = type opaque
%struct.uma_zone = type opaque
%struct.unrhdr = type opaque
%struct.sysinit = type { i32, i32, void (i8*)*, i8* }
%struct.malloc_type = type { %struct.malloc_type*, i64, i8*, i8* }
%struct.command_table = type { %struct.command* }
%struct.command = type { i8*, void (i64, i32, i64, i8*)*, i32, %struct.command_table*, %struct.anon.43 }
%struct.anon.43 = type { %struct.command*, %struct.command** }
%struct.sx = type { %struct.lock_object, i64 }
%struct.__tesla_locality = type {}
%struct.cpuset_args = type { [0 x i8], i32*, [0 x i8] }
%struct.cpuset_setid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i64, [0 x i8], [0 x i8], i32, [4 x i8] }
%struct.cpuset_getid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8], [0 x i8], i64, [0 x i8], [0 x i8], i32*, [0 x i8] }
%struct.cpuset_getaffinity_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8], [0 x i8], i64, [0 x i8], [0 x i8], i64, [0 x i8], [0 x i8], %struct._cpuset*, [0 x i8] }
%struct.cpuset_setaffinity_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8], [0 x i8], i64, [0 x i8], [0 x i8], i64, [0 x i8], [0 x i8], %struct._cpuset*, [0 x i8] }

@sysctl___kern_sched_cpusetsize = internal global %struct.sysctl_oid { %struct.sysctl_oid_list* @sysctl__kern_sched_children, %struct.anon zeroinitializer, i32 -1, i32 -2147221502, i8* null, i64 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str24, i32 0, i32 0), i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)* @sysctl_handle_int, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str25, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str26, i32 0, i32 0) }, align 8
@__set_sysctl_set_sym_sysctl___kern_sched_cpusetsize = internal constant i8* bitcast (%struct.sysctl_oid* @sysctl___kern_sched_cpusetsize to i8*), section "set_sysctl_set", align 8
@cpuset_lock = internal global %struct.mtx zeroinitializer, align 8
@.emptystring = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str = private unnamed_addr constant [44 x i8] c"/home/jra40/P4/tesla/sys/kern/kern_cpuset.c\00", align 1
@.str1 = private unnamed_addr constant [34 x i8] c"Bad link elm %p next->prev != elm\00", align 1
@.str2 = private unnamed_addr constant [34 x i8] c"Bad link elm %p prev->next != elm\00", align 1
@cpuset_zone = internal global %struct.uma_zone* null, align 8
@cpuset_unr = internal global %struct.unrhdr* null, align 8
@.str3 = private unnamed_addr constant [5 x i8] c"%lx,\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%lx\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"cpuset\00", align 1
@cpuset_ids = internal global %struct.setlist zeroinitializer, align 8
@.str7 = private unnamed_addr constant [37 x i8] c"Bad list head %p first->prev != head\00", align 1
@cpuset_zero = internal global %struct.cpuset* null, align 8
@cpuset_root = common global %struct._cpuset* null, align 8
@.str8 = private unnamed_addr constant [32 x i8] c"Error creating default set: %d\0A\00", align 1
@.str9 = private unnamed_addr constant [19 x i8] c"[%s:%d] invalid pr\00", align 1
@__func__.cpuset_create_root = private unnamed_addr constant [19 x i8] c"cpuset_create_root\00", align 1
@.str10 = private unnamed_addr constant [21 x i8] c"[%s:%d] invalid setp\00", align 1
@.str11 = private unnamed_addr constant [44 x i8] c"[%s:%d] cpuset_create returned invalid data\00", align 1
@.str12 = private unnamed_addr constant [21 x i8] c"[%s:%d] invalid proc\00", align 1
@__func__.cpuset_setproc_update_set = private unnamed_addr constant [26 x i8] c"cpuset_setproc_update_set\00", align 1
@.str13 = private unnamed_addr constant [20 x i8] c"[%s:%d] invalid set\00", align 1
@cpuset_sys_init = internal global %struct.sysinit { i32 251658240, i32 268435455, void (i8*)* @cpuset_init, i8* null }, align 8
@__set_sysinit_set_sym_cpuset_sys_init = internal constant i8* bitcast (%struct.sysinit* @cpuset_sys_init to i8*), section "set_sysinit_set", align 8
@M_TEMP = external global [1 x %struct.malloc_type]
@cpusets_show_sys_init = internal global %struct.sysinit { i32 33554432, i32 268435455, void (i8*)* @cpusets_show_add, i8* null }, align 8
@__set_sysinit_set_sym_cpusets_show_sys_init = internal constant i8* bitcast (%struct.sysinit* @cpusets_show_sys_init to i8*), section "set_sysinit_set", align 8
@cpusets_show_sys_uninit = internal global %struct.sysinit { i32 33554432, i32 268435455, void (i8*)* @cpusets_show_del, i8* null }, align 8
@__set_sysuninit_set_sym_cpusets_show_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @cpusets_show_sys_uninit to i8*), section "set_sysuninit_set", align 8
@db_show_table = external global %struct.command_table
@cpusets_show = internal global %struct.command { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str14, i32 0, i32 0), void (i64, i32, i64, i8*)* @db_show_cpusets, i32 0, %struct.command_table* null, %struct.anon.43 zeroinitializer }, align 8
@.str14 = private unnamed_addr constant [8 x i8] c"cpusets\00", align 1
@.str15 = private unnamed_addr constant [51 x i8] c"set=%p id=%-6u ref=%-6d flags=0x%04x parent id=%d\0A\00", align 1
@.str16 = private unnamed_addr constant [8 x i8] c"  mask=\00", align 1
@.str17 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str18 = private unnamed_addr constant [4 x i8] c",%d\00", align 1
@.str19 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@db_pager_quit = external global i32
@.str20 = private unnamed_addr constant [19 x i8] c"[%s:%d] td is NULL\00", align 1
@__func__.cpuset_lookup = private unnamed_addr constant [14 x i8] c"cpuset_lookup\00", align 1
@all_cpus = external global %struct._cpuset
@.str21 = private unnamed_addr constant [32 x i8] c"Can't set initial cpuset mask.\0A\00", align 1
@allprison_lock = external global %struct.sx
@.str22 = private unnamed_addr constant [21 x i8] c"negative refcount %p\00", align 1
@.str23 = private unnamed_addr constant [23 x i8] c"refcount %p overflowed\00", align 1
@sysctl__kern_sched_children = external global %struct.sysctl_oid_list
@.str24 = private unnamed_addr constant [11 x i8] c"cpusetsize\00", align 1
@.str25 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str26 = private unnamed_addr constant [17 x i8] c"sizeof(cpuset_t)\00", align 1
@llvm.used = appending global [4 x i8*] [i8* bitcast (i8** @__set_sysctl_set_sym_sysctl___kern_sched_cpusetsize to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_cpuset_sys_init to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_cpusets_show_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_cpusets_show_sys_uninit to i8*)], section "llvm.metadata"

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.cpuset* @cpuset_ref(%struct.cpuset* %set) #0 {
entry:
  %set.addr = alloca %struct.cpuset*, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_ref = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 1
  call void @refcount_acquire(i32* %cs_ref) #7
  %1 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  ret %struct.cpuset* %1
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @refcount_acquire(i32* %count) #1 {
entry:
  %count.addr = alloca i32*, align 8
  store i32* %count, i32** %count.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32*, i32** %count.addr, align 8
  %1 = load volatile i32, i32* %0, align 4
  %cmp = icmp ult i32 %1, -1
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load i32*, i32** %count.addr, align 8
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str23, i32 0, i32 0), i32* %2) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32*, i32** %count.addr, align 8
  call void @atomic_add_barr_int(i32* %3, i32 1) #7
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @cpuset_rel(%struct.cpuset* %set) #0 {
entry:
  %set.addr = alloca %struct.cpuset*, align 8
  %id = alloca i32, align 4
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_ref = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 1
  %call = call i32 @refcount_release(i32* %cs_ref) #7
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end77

if.end:                                           ; preds = %entry
  call void @__mtx_lock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 173) #7
  br label %do.body

do.body:                                          ; preds = %if.end
  br label %do.body1

do.body1:                                         ; preds = %do.body
  %1 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings = getelementptr inbounds %struct.cpuset, %struct.cpuset* %1, i32 0, i32 6
  %le_next = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings, i32 0, i32 0
  %2 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  %cmp2 = icmp ne %struct.cpuset* %2, null
  br i1 %cmp2, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %do.body1
  %3 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings3 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %3, i32 0, i32 6
  %le_next4 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings3, i32 0, i32 0
  %4 = load %struct.cpuset*, %struct.cpuset** %le_next4, align 8
  %cs_siblings5 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %4, i32 0, i32 6
  %le_prev = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings5, i32 0, i32 1
  %5 = load %struct.cpuset**, %struct.cpuset*** %le_prev, align 8
  %6 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings6 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %6, i32 0, i32 6
  %le_next7 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings6, i32 0, i32 0
  %cmp8 = icmp ne %struct.cpuset** %5, %le_next7
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true
  %7 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %7) #8
  unreachable

if.end10:                                         ; preds = %land.lhs.true, %do.body1
  br label %do.end

do.end:                                           ; preds = %if.end10
  br label %do.body11

do.body11:                                        ; preds = %do.end
  %8 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings12 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %8, i32 0, i32 6
  %le_prev13 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings12, i32 0, i32 1
  %9 = load %struct.cpuset**, %struct.cpuset*** %le_prev13, align 8
  %10 = load %struct.cpuset*, %struct.cpuset** %9, align 8
  %11 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cmp14 = icmp ne %struct.cpuset* %10, %11
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.body11
  %12 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %12) #8
  unreachable

if.end16:                                         ; preds = %do.body11
  br label %do.end17

do.end17:                                         ; preds = %if.end16
  %13 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings18 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 6
  %le_next19 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings18, i32 0, i32 0
  %14 = load %struct.cpuset*, %struct.cpuset** %le_next19, align 8
  %cmp20 = icmp ne %struct.cpuset* %14, null
  br i1 %cmp20, label %if.then21, label %if.end28

if.then21:                                        ; preds = %do.end17
  %15 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings22 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %15, i32 0, i32 6
  %le_prev23 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings22, i32 0, i32 1
  %16 = load %struct.cpuset**, %struct.cpuset*** %le_prev23, align 8
  %17 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings24 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %17, i32 0, i32 6
  %le_next25 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings24, i32 0, i32 0
  %18 = load %struct.cpuset*, %struct.cpuset** %le_next25, align 8
  %cs_siblings26 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %18, i32 0, i32 6
  %le_prev27 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings26, i32 0, i32 1
  store %struct.cpuset** %16, %struct.cpuset*** %le_prev27, align 8
  br label %if.end28

if.end28:                                         ; preds = %if.then21, %do.end17
  %19 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings29 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %19, i32 0, i32 6
  %le_next30 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings29, i32 0, i32 0
  %20 = load %struct.cpuset*, %struct.cpuset** %le_next30, align 8
  %21 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings31 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %21, i32 0, i32 6
  %le_prev32 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings31, i32 0, i32 1
  %22 = load %struct.cpuset**, %struct.cpuset*** %le_prev32, align 8
  store %struct.cpuset* %20, %struct.cpuset** %22, align 8
  br label %do.end33

do.end33:                                         ; preds = %if.end28
  %23 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %23, i32 0, i32 3
  %24 = load i32, i32* %cs_id, align 4
  store i32 %24, i32* %id, align 4
  %25 = load i32, i32* %id, align 4
  %cmp34 = icmp ne i32 %25, -1
  br i1 %cmp34, label %if.then35, label %if.end74

if.then35:                                        ; preds = %do.end33
  br label %do.body36

do.body36:                                        ; preds = %if.then35
  br label %do.body37

do.body37:                                        ; preds = %do.body36
  %26 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %26, i32 0, i32 5
  %le_next38 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 0
  %27 = load %struct.cpuset*, %struct.cpuset** %le_next38, align 8
  %cmp39 = icmp ne %struct.cpuset* %27, null
  br i1 %cmp39, label %land.lhs.true40, label %if.end49

land.lhs.true40:                                  ; preds = %do.body37
  %28 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link41 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %28, i32 0, i32 5
  %le_next42 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link41, i32 0, i32 0
  %29 = load %struct.cpuset*, %struct.cpuset** %le_next42, align 8
  %cs_link43 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %29, i32 0, i32 5
  %le_prev44 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link43, i32 0, i32 1
  %30 = load %struct.cpuset**, %struct.cpuset*** %le_prev44, align 8
  %31 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link45 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %31, i32 0, i32 5
  %le_next46 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link45, i32 0, i32 0
  %cmp47 = icmp ne %struct.cpuset** %30, %le_next46
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %land.lhs.true40
  %32 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %32) #8
  unreachable

if.end49:                                         ; preds = %land.lhs.true40, %do.body37
  br label %do.end50

do.end50:                                         ; preds = %if.end49
  br label %do.body51

do.body51:                                        ; preds = %do.end50
  %33 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link52 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %33, i32 0, i32 5
  %le_prev53 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link52, i32 0, i32 1
  %34 = load %struct.cpuset**, %struct.cpuset*** %le_prev53, align 8
  %35 = load %struct.cpuset*, %struct.cpuset** %34, align 8
  %36 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cmp54 = icmp ne %struct.cpuset* %35, %36
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %do.body51
  %37 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %37) #8
  unreachable

if.end56:                                         ; preds = %do.body51
  br label %do.end57

do.end57:                                         ; preds = %if.end56
  %38 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link58 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %38, i32 0, i32 5
  %le_next59 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link58, i32 0, i32 0
  %39 = load %struct.cpuset*, %struct.cpuset** %le_next59, align 8
  %cmp60 = icmp ne %struct.cpuset* %39, null
  br i1 %cmp60, label %if.then61, label %if.end68

if.then61:                                        ; preds = %do.end57
  %40 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link62 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %40, i32 0, i32 5
  %le_prev63 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link62, i32 0, i32 1
  %41 = load %struct.cpuset**, %struct.cpuset*** %le_prev63, align 8
  %42 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link64 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %42, i32 0, i32 5
  %le_next65 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link64, i32 0, i32 0
  %43 = load %struct.cpuset*, %struct.cpuset** %le_next65, align 8
  %cs_link66 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %43, i32 0, i32 5
  %le_prev67 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link66, i32 0, i32 1
  store %struct.cpuset** %41, %struct.cpuset*** %le_prev67, align 8
  br label %if.end68

if.end68:                                         ; preds = %if.then61, %do.end57
  %44 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link69 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %44, i32 0, i32 5
  %le_next70 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link69, i32 0, i32 0
  %45 = load %struct.cpuset*, %struct.cpuset** %le_next70, align 8
  %46 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link71 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %46, i32 0, i32 5
  %le_prev72 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link71, i32 0, i32 1
  %47 = load %struct.cpuset**, %struct.cpuset*** %le_prev72, align 8
  store %struct.cpuset* %45, %struct.cpuset** %47, align 8
  br label %do.end73

do.end73:                                         ; preds = %if.end68
  br label %if.end74

if.end74:                                         ; preds = %do.end73, %do.end33
  call void @__mtx_unlock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 178) #7
  %48 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %48, i32 0, i32 4
  %49 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  call void @cpuset_rel(%struct.cpuset* %49) #7
  %50 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %51 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %52 = bitcast %struct.cpuset* %51 to i8*
  call void @uma_zfree(%struct.uma_zone* %50, i8* %52) #7
  %53 = load i32, i32* %id, align 4
  %cmp75 = icmp ne i32 %53, -1
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end74
  %54 = load %struct.unrhdr*, %struct.unrhdr** @cpuset_unr, align 8
  %55 = load i32, i32* %id, align 4
  call void @free_unr(%struct.unrhdr* %54, i32 %55) #7
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %if.end74, %if.then
  ret void
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i32 @refcount_release(i32* %count) #1 {
entry:
  %count.addr = alloca i32*, align 8
  %old = alloca i32, align 4
  store i32* %count, i32** %count.addr, align 8
  %0 = load i32*, i32** %count.addr, align 8
  %call = call i32 @atomic_fetchadd_int(i32* %0, i32 -1) #7
  store i32 %call, i32* %old, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load i32, i32* %old, align 4
  %cmp = icmp ugt i32 %1, 0
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load i32*, i32** %count.addr, align 8
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str22, i32 0, i32 0), i32* %2) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32, i32* %old, align 4
  %cmp1 = icmp eq i32 %3, 1
  %conv2 = zext i1 %cmp1 to i32
  ret i32 %conv2
}

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_lock_spin_flags(i64*, i32, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone noreturn
declare void @panic(i8*, ...) #3

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_unlock_spin_flags(i64*, i32, i8*, i32) #2

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @uma_zfree(%struct.uma_zone* %zone, i8* %item) #1 {
entry:
  %zone.addr = alloca %struct.uma_zone*, align 8
  %item.addr = alloca i8*, align 8
  store %struct.uma_zone* %zone, %struct.uma_zone** %zone.addr, align 8
  store i8* %item, i8** %item.addr, align 8
  %0 = load %struct.uma_zone*, %struct.uma_zone** %zone.addr, align 8
  %1 = load i8*, i8** %item.addr, align 8
  call void @uma_zfree_arg(%struct.uma_zone* %0, i8* %1, i8* null) #7
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @free_unr(%struct.unrhdr*, i32) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cpusetobj_ffs(%struct._cpuset* %set) #0 {
entry:
  %set.addr = alloca %struct._cpuset*, align 8
  %i = alloca i64, align 8
  %cbit = alloca i32, align 4
  store %struct._cpuset* %set, %struct._cpuset** %set.addr, align 8
  store i32 0, i32* %cbit, align 4
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8
  %cmp = icmp ult i64 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8
  %2 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %2, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %1
  %3 = load i64, i64* %arrayidx, align 8
  %cmp1 = icmp ne i64 %3, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8
  %5 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits2 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %5, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits2, i32 0, i64 %4
  %6 = load i64, i64* %arrayidx3, align 8
  %call = call i32 @ffsl(i64 %6) #7
  store i32 %call, i32* %cbit, align 4
  %7 = load i64, i64* %i, align 8
  %mul = mul i64 %7, 64
  %8 = load i32, i32* %cbit, align 4
  %conv = sext i32 %8 to i64
  %add = add i64 %conv, %mul
  %conv4 = trunc i64 %add to i32
  store i32 %conv4, i32* %cbit, align 4
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i64, i64* %i, align 8
  %inc = add i64 %9, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %10 = load i32, i32* %cbit, align 4
  ret i32 %10
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i32 @ffsl(i64 %mask) #1 {
entry:
  %mask.addr = alloca i64, align 8
  store i64 %mask, i64* %mask.addr, align 8
  %0 = load i64, i64* %mask.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64, i64* %mask.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64, i64* %mask.addr, align 8
  %call = call i64 @bsfq(i64 %2) #7
  %conv = trunc i64 %call to i32
  %add = add nsw i32 %conv, 1
  %conv1 = sext i32 %add to i64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %1, %cond.true ], [ %conv1, %cond.false ]
  %conv2 = trunc i64 %cond to i32
  ret i32 %conv2
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i8* @cpusetobj_strprint(i8* %buf, %struct._cpuset* %set) #0 {
entry:
  %buf.addr = alloca i8*, align 8
  %set.addr = alloca %struct._cpuset*, align 8
  %tbuf = alloca i8*, align 8
  %i = alloca i64, align 8
  %bytesp = alloca i64, align 8
  %bufsiz = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store %struct._cpuset* %set, %struct._cpuset** %set.addr, align 8
  %0 = load i8*, i8** %buf.addr, align 8
  store i8* %0, i8** %tbuf, align 8
  store i64 0, i64* %bytesp, align 8
  store i64 18, i64* %bufsiz, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8
  %cmp = icmp ult i64 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %tbuf, align 8
  %3 = load i64, i64* %bufsiz, align 8
  %4 = load i64, i64* %i, align 8
  %5 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %5, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %4
  %6 = load i64, i64* %arrayidx, align 8
  %call = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %2, i64 %3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str3, i32 0, i32 0), i64 %6) #7
  %conv = sext i32 %call to i64
  store i64 %conv, i64* %bytesp, align 8
  %7 = load i64, i64* %bytesp, align 8
  %8 = load i64, i64* %bufsiz, align 8
  %sub = sub i64 %8, %7
  store i64 %sub, i64* %bufsiz, align 8
  %9 = load i64, i64* %bytesp, align 8
  %10 = load i8*, i8** %tbuf, align 8
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 %9
  store i8* %add.ptr, i8** %tbuf, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8
  %inc = add i64 %11, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %tbuf, align 8
  %13 = load i64, i64* %bufsiz, align 8
  %14 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits1 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %14, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits1, i32 0, i64 0
  %15 = load i64, i64* %arrayidx2, align 8
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %12, i64 %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str4, i32 0, i32 0), i64 %15) #7
  %16 = load i8*, i8** %buf.addr, align 8
  ret i8* %16
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cpusetobj_strscan(%struct._cpuset* %set, i8* %buf) #0 {
entry:
  %retval = alloca i32, align 4
  %set.addr = alloca %struct._cpuset*, align 8
  %buf.addr = alloca i8*, align 8
  %nwords = alloca i32, align 4
  %i = alloca i32, align 4
  %ret = alloca i32, align 4
  %__i = alloca i64, align 8
  store %struct._cpuset* %set, %struct._cpuset** %set.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  %0 = load i8*, i8** %buf.addr, align 8
  %call = call i64 @strlen(i8* %0) #7
  %cmp = icmp ugt i64 %call, 17
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %nwords, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load i8*, i8** %buf.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp ne i32 %conv, 0
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %4 to i64
  %5 = load i8*, i8** %buf.addr, align 8
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %idxprom3
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 44
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %for.body
  %7 = load i32, i32* %nwords, align 4
  %inc = add i32 %7, 1
  store i32 %inc, i32* %nwords, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %8 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %8, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %nwords, align 4
  %conv11 = zext i32 %9 to i64
  %cmp12 = icmp ugt i64 %conv11, 1
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %for.end
  store i32 -1, i32* %retval
  br label %return

if.end15:                                         ; preds = %for.end
  br label %do.body

do.body:                                          ; preds = %if.end15
  store i64 0, i64* %__i, align 8
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc21, %do.body
  %10 = load i64, i64* %__i, align 8
  %cmp17 = icmp ult i64 %10, 1
  br i1 %cmp17, label %for.body19, label %for.end23

for.body19:                                       ; preds = %for.cond16
  %11 = load i64, i64* %__i, align 8
  %12 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %12, i32 0, i32 0
  %arrayidx20 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %11
  store i64 0, i64* %arrayidx20, align 8
  br label %for.inc21

for.inc21:                                        ; preds = %for.body19
  %13 = load i64, i64* %__i, align 8
  %inc22 = add i64 %13, 1
  store i64 %inc22, i64* %__i, align 8
  br label %for.cond16

for.end23:                                        ; preds = %for.cond16
  br label %do.end

do.end:                                           ; preds = %for.end23
  store i32 0, i32* %i, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc43, %do.end
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %nwords, align 4
  %sub = sub i32 %15, 1
  %cmp25 = icmp ult i32 %14, %sub
  br i1 %cmp25, label %for.body27, label %for.end45

for.body27:                                       ; preds = %for.cond24
  %16 = load i8*, i8** %buf.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom28 = sext i32 %17 to i64
  %18 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits29 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %18, i32 0, i32 0
  %arrayidx30 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits29, i32 0, i64 %idxprom28
  %call31 = call i32 (i8*, i8*, ...) @sscanf(i8* %16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str3, i32 0, i32 0), i64* %arrayidx30) #7
  store i32 %call31, i32* %ret, align 4
  %19 = load i32, i32* %ret, align 4
  %cmp32 = icmp eq i32 %19, 0
  br i1 %cmp32, label %if.then36, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body27
  %20 = load i32, i32* %ret, align 4
  %cmp34 = icmp eq i32 %20, -1
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %lor.lhs.false, %for.body27
  store i32 -1, i32* %retval
  br label %return

if.end37:                                         ; preds = %lor.lhs.false
  %21 = load i8*, i8** %buf.addr, align 8
  %call38 = call i8* @strstr(i8* %21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str5, i32 0, i32 0)) #7
  store i8* %call38, i8** %buf.addr, align 8
  %22 = load i8*, i8** %buf.addr, align 8
  %cmp39 = icmp eq i8* %22, null
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end37
  store i32 -1, i32* %retval
  br label %return

if.end42:                                         ; preds = %if.end37
  %23 = load i8*, i8** %buf.addr, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr, i8** %buf.addr, align 8
  br label %for.inc43

for.inc43:                                        ; preds = %if.end42
  %24 = load i32, i32* %i, align 4
  %inc44 = add nsw i32 %24, 1
  store i32 %inc44, i32* %i, align 4
  br label %for.cond24

for.end45:                                        ; preds = %for.cond24
  %25 = load i8*, i8** %buf.addr, align 8
  %26 = load i32, i32* %nwords, align 4
  %sub46 = sub i32 %26, 1
  %idxprom47 = zext i32 %sub46 to i64
  %27 = load %struct._cpuset*, %struct._cpuset** %set.addr, align 8
  %__bits48 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %27, i32 0, i32 0
  %arrayidx49 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits48, i32 0, i64 %idxprom47
  %call50 = call i32 (i8*, i8*, ...) @sscanf(i8* %25, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str4, i32 0, i32 0), i64* %arrayidx49) #7
  store i32 %call50, i32* %ret, align 4
  %28 = load i32, i32* %ret, align 4
  %cmp51 = icmp eq i32 %28, 0
  br i1 %cmp51, label %if.then56, label %lor.lhs.false53

lor.lhs.false53:                                  ; preds = %for.end45
  %29 = load i32, i32* %ret, align 4
  %cmp54 = icmp eq i32 %29, -1
  br i1 %cmp54, label %if.then56, label %if.end57

if.then56:                                        ; preds = %lor.lhs.false53, %for.end45
  store i32 -1, i32* %retval
  br label %return

if.end57:                                         ; preds = %lor.lhs.false53
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end57, %if.then56, %if.then41, %if.then36, %if.then14, %if.then
  %30 = load i32, i32* %retval
  ret i32 %30
}

; Function Attrs: noimplicitfloat noredzone
declare i64 @strlen(i8*) #2

; Function Attrs: noimplicitfloat noredzone
declare i32 @sscanf(i8*, i8*, ...) #2

; Function Attrs: noimplicitfloat noredzone
declare i8* @strstr(i8*, i8*) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cpuset_setthread(i32 %id, %struct._cpuset* %mask) #0 {
entry:
  %id.addr = alloca i32, align 4
  %mask.addr = alloca %struct._cpuset*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %set = alloca %struct.cpuset*, align 8
  %td = alloca %struct.thread*, align 8
  %p = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  store i32 %id, i32* %id.addr, align 4
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  %0 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %call = call i8* @uma_zalloc(%struct.uma_zone* %0, i32 2) #7
  %1 = bitcast i8* %call to %struct.cpuset*
  store %struct.cpuset* %1, %struct.cpuset** %nset, align 8
  %2 = load i32, i32* %id.addr, align 4
  %conv = sext i32 %2 to i64
  %call1 = call i32 @cpuset_which(i32 1, i64 %conv, %struct.proc** %p, %struct.thread** %td, %struct.cpuset** %set) #7
  store i32 %call1, i32* %error, align 4
  %3 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %out

if.end:                                           ; preds = %entry
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 720, i32 0, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #7
  store %struct.cpuset* null, %struct.cpuset** %set, align 8
  %4 = load %struct.thread*, %struct.thread** %td, align 8
  call void @thread_lock_flags_(%struct.thread* %4, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 723) #7
  %5 = load %struct.thread*, %struct.thread** %td, align 8
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %5, i32 0, i32 7
  %6 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  %7 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %8 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %call2 = call i32 @cpuset_shadow(%struct.cpuset* %6, %struct.cpuset* %7, %struct._cpuset* %8) #7
  store i32 %call2, i32* %error, align 4
  %9 = load i32, i32* %error, align 4
  %cmp = icmp eq i32 %9, 0
  br i1 %cmp, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %10 = load %struct.thread*, %struct.thread** %td, align 8
  %td_cpuset5 = getelementptr inbounds %struct.thread, %struct.thread* %10, i32 0, i32 7
  %11 = load %struct.cpuset*, %struct.cpuset** %td_cpuset5, align 8
  store %struct.cpuset* %11, %struct.cpuset** %set, align 8
  %12 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %13 = load %struct.thread*, %struct.thread** %td, align 8
  %td_cpuset6 = getelementptr inbounds %struct.thread, %struct.thread* %13, i32 0, i32 7
  store %struct.cpuset* %12, %struct.cpuset** %td_cpuset6, align 8
  %14 = load %struct.thread*, %struct.thread** %td, align 8
  call void @sched_affinity(%struct.thread* %14) #7
  store %struct.cpuset* null, %struct.cpuset** %nset, align 8
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %15 = load %struct.thread*, %struct.thread** %td, align 8
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %15, i32 0, i32 0
  %16 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %16, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 731) #7
  %17 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %17, i32 0, i32 18
  %mtx_lock8 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock8, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 732) #7
  %18 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %tobool9 = icmp ne %struct.cpuset* %18, null
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  %19 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %19) #7
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end7
  br label %out

out:                                              ; preds = %if.end11, %if.then
  %20 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %tobool12 = icmp ne %struct.cpuset* %20, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %out
  %21 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %22 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %23 = bitcast %struct.cpuset* %22 to i8*
  call void @uma_zfree(%struct.uma_zone* %21, i8* %23) #7
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %out
  %24 = load i32, i32* %error, align 4
  ret i32 %24
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i8* @uma_zalloc(%struct.uma_zone* %zone, i32 %flags) #1 {
entry:
  %zone.addr = alloca %struct.uma_zone*, align 8
  %flags.addr = alloca i32, align 4
  store %struct.uma_zone* %zone, %struct.uma_zone** %zone.addr, align 8
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.uma_zone*, %struct.uma_zone** %zone.addr, align 8
  %1 = load i32, i32* %flags.addr, align 4
  %call = call i8* @uma_zalloc_arg(%struct.uma_zone* %0, i8* null, i32 %1) #7
  ret i8* %call
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cpuset_which(i32 %which, i64 %id, %struct.proc** %pp, %struct.thread** %tdp, %struct.cpuset** %setp) #0 {
entry:
  %retval = alloca i32, align 4
  %which.addr = alloca i32, align 4
  %id.addr = alloca i64, align 8
  %pp.addr = alloca %struct.proc**, align 8
  %tdp.addr = alloca %struct.thread**, align 8
  %setp.addr = alloca %struct.cpuset**, align 8
  %set = alloca %struct.cpuset*, align 8
  %td = alloca %struct.thread*, align 8
  %p = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  %pr = alloca %struct.prison*, align 8
  store i32 %which, i32* %which.addr, align 4
  store i64 %id, i64* %id.addr, align 8
  store %struct.proc** %pp, %struct.proc*** %pp.addr, align 8
  store %struct.thread** %tdp, %struct.thread*** %tdp.addr, align 8
  store %struct.cpuset** %setp, %struct.cpuset*** %setp.addr, align 8
  store %struct.proc* null, %struct.proc** %p, align 8
  %0 = load %struct.proc**, %struct.proc*** %pp.addr, align 8
  store %struct.proc* null, %struct.proc** %0, align 8
  store %struct.thread* null, %struct.thread** %td, align 8
  %1 = load %struct.thread**, %struct.thread*** %tdp.addr, align 8
  store %struct.thread* null, %struct.thread** %1, align 8
  store %struct.cpuset* null, %struct.cpuset** %set, align 8
  %2 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  store %struct.cpuset* null, %struct.cpuset** %2, align 8
  %3 = load i32, i32* %which.addr, align 4
  switch i32 %3, label %sw.default [
    i32 2, label %sw.bb
    i32 1, label %sw.bb8
    i32 3, label %sw.bb27
    i32 5, label %sw.bb42
    i32 4, label %sw.bb54
  ]

sw.bb:                                            ; preds = %entry
  %4 = load i64, i64* %id.addr, align 8
  %cmp = icmp eq i64 %4, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  %call = call %struct.thread* @__curthread() #9
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 1
  %5 = load %struct.proc*, %struct.proc** %td_proc, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %5, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 413) #7
  %call1 = call %struct.thread* @__curthread() #9
  %td_proc2 = getelementptr inbounds %struct.thread, %struct.thread* %call1, i32 0, i32 1
  %6 = load %struct.proc*, %struct.proc** %td_proc2, align 8
  store %struct.proc* %6, %struct.proc** %p, align 8
  br label %sw.epilog

if.end:                                           ; preds = %sw.bb
  %7 = load i64, i64* %id.addr, align 8
  %conv = trunc i64 %7 to i32
  %call3 = call %struct.proc* @pfind(i32 %conv) #7
  store %struct.proc* %call3, %struct.proc** %p, align 8
  %cmp4 = icmp eq %struct.proc* %call3, null
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 3, i32* %retval
  br label %return

if.end7:                                          ; preds = %if.end
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %8 = load i64, i64* %id.addr, align 8
  %cmp9 = icmp eq i64 %8, -1
  br i1 %cmp9, label %if.then11, label %if.end19

if.then11:                                        ; preds = %sw.bb8
  %call12 = call %struct.thread* @__curthread() #9
  %td_proc13 = getelementptr inbounds %struct.thread, %struct.thread* %call12, i32 0, i32 1
  %9 = load %struct.proc*, %struct.proc** %td_proc13, align 8
  %p_mtx14 = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 18
  %mtx_lock15 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx14, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock15, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 422) #7
  %call16 = call %struct.thread* @__curthread() #9
  %td_proc17 = getelementptr inbounds %struct.thread, %struct.thread* %call16, i32 0, i32 1
  %10 = load %struct.proc*, %struct.proc** %td_proc17, align 8
  store %struct.proc* %10, %struct.proc** %p, align 8
  %call18 = call %struct.thread* @__curthread() #9
  store %struct.thread* %call18, %struct.thread** %td, align 8
  br label %sw.epilog

if.end19:                                         ; preds = %sw.bb8
  %11 = load i64, i64* %id.addr, align 8
  %conv20 = trunc i64 %11 to i32
  %call21 = call %struct.thread* @tdfind(i32 %conv20, i32 -1) #7
  store %struct.thread* %call21, %struct.thread** %td, align 8
  %12 = load %struct.thread*, %struct.thread** %td, align 8
  %cmp22 = icmp eq %struct.thread* %12, null
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  store i32 3, i32* %retval
  br label %return

if.end25:                                         ; preds = %if.end19
  %13 = load %struct.thread*, %struct.thread** %td, align 8
  %td_proc26 = getelementptr inbounds %struct.thread, %struct.thread* %13, i32 0, i32 1
  %14 = load %struct.proc*, %struct.proc** %td_proc26, align 8
  store %struct.proc* %14, %struct.proc** %p, align 8
  br label %sw.epilog

sw.bb27:                                          ; preds = %entry
  %15 = load i64, i64* %id.addr, align 8
  %cmp28 = icmp eq i64 %15, -1
  br i1 %cmp28, label %if.then30, label %if.else

if.then30:                                        ; preds = %sw.bb27
  %call31 = call %struct.thread* @__curthread() #9
  call void @thread_lock_flags_(%struct.thread* %call31, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 434) #7
  %call32 = call %struct.thread* @__curthread() #9
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %call32, i32 0, i32 7
  %16 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  %call33 = call %struct.cpuset* @cpuset_refbase(%struct.cpuset* %16) #7
  store %struct.cpuset* %call33, %struct.cpuset** %set, align 8
  %call34 = call %struct.thread* @__curthread() #9
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %call34, i32 0, i32 0
  %17 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock35 = getelementptr inbounds %struct.mtx, %struct.mtx* %17, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock35, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 436) #7
  br label %if.end39

if.else:                                          ; preds = %sw.bb27
  %18 = load i64, i64* %id.addr, align 8
  %conv36 = trunc i64 %18 to i32
  %call37 = call %struct.thread* @__curthread() #9
  %call38 = call %struct.cpuset* @cpuset_lookup(i32 %conv36, %struct.thread* %call37) #7
  store %struct.cpuset* %call38, %struct.cpuset** %set, align 8
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then30
  %19 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %tobool = icmp ne %struct.cpuset* %19, null
  br i1 %tobool, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end39
  %20 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %21 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  store %struct.cpuset* %20, %struct.cpuset** %21, align 8
  store i32 0, i32* %retval
  br label %return

if.end41:                                         ; preds = %if.end39
  store i32 3, i32* %retval
  br label %return

sw.bb42:                                          ; preds = %entry
  %call43 = call i32 @_sx_slock(%struct.sx* @allprison_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 449) #7
  %call44 = call %struct.thread* @__curthread() #9
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %call44, i32 0, i32 37
  %22 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %cr_prison = getelementptr inbounds %struct.ucred, %struct.ucred* %22, i32 0, i32 9
  %23 = load %struct.prison*, %struct.prison** %cr_prison, align 8
  %24 = load i64, i64* %id.addr, align 8
  %conv45 = trunc i64 %24 to i32
  %call46 = call %struct.prison* @prison_find_child(%struct.prison* %23, i32 %conv45) #7
  store %struct.prison* %call46, %struct.prison** %pr, align 8
  call void @_sx_sunlock(%struct.sx* @allprison_lock, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 451) #7
  %25 = load %struct.prison*, %struct.prison** %pr, align 8
  %cmp47 = icmp eq %struct.prison* %25, null
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %sw.bb42
  store i32 3, i32* %retval
  br label %return

if.end50:                                         ; preds = %sw.bb42
  %26 = load %struct.prison*, %struct.prison** %pr, align 8
  %pr_cpuset = getelementptr inbounds %struct.prison, %struct.prison* %26, i32 0, i32 11
  %27 = load %struct.cpuset*, %struct.cpuset** %pr_cpuset, align 8
  %call51 = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %27) #7
  %28 = load %struct.prison*, %struct.prison** %pr, align 8
  %pr_cpuset52 = getelementptr inbounds %struct.prison, %struct.prison* %28, i32 0, i32 11
  %29 = load %struct.cpuset*, %struct.cpuset** %pr_cpuset52, align 8
  %30 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  store %struct.cpuset* %29, %struct.cpuset** %30, align 8
  %31 = load %struct.prison*, %struct.prison** %pr, align 8
  %pr_mtx = getelementptr inbounds %struct.prison, %struct.prison* %31, i32 0, i32 8
  %mtx_lock53 = getelementptr inbounds %struct.mtx, %struct.mtx* %pr_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock53, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 456) #7
  store i32 0, i32* %retval
  br label %return

sw.bb54:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  store i32 22, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %if.end25, %if.then11, %if.end7, %if.then
  %call55 = call %struct.thread* @__curthread() #9
  %32 = load %struct.proc*, %struct.proc** %p, align 8
  %call56 = call i32 @p_cansched(%struct.thread* %call55, %struct.proc* %32) #7
  store i32 %call56, i32* %error, align 4
  %33 = load i32, i32* %error, align 4
  %tobool57 = icmp ne i32 %33, 0
  br i1 %tobool57, label %if.then58, label %if.end61

if.then58:                                        ; preds = %sw.epilog
  %34 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx59 = getelementptr inbounds %struct.proc, %struct.proc* %34, i32 0, i32 18
  %mtx_lock60 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx59, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock60, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 466) #7
  %35 = load i32, i32* %error, align 4
  store i32 %35, i32* %retval
  br label %return

if.end61:                                         ; preds = %sw.epilog
  %36 = load %struct.thread*, %struct.thread** %td, align 8
  %cmp62 = icmp eq %struct.thread* %36, null
  br i1 %cmp62, label %if.then64, label %if.end65

if.then64:                                        ; preds = %if.end61
  %37 = load %struct.proc*, %struct.proc** %p, align 8
  %p_threads = getelementptr inbounds %struct.proc, %struct.proc* %37, i32 0, i32 1
  %tqh_first = getelementptr inbounds %struct.anon.1, %struct.anon.1* %p_threads, i32 0, i32 0
  %38 = load %struct.thread*, %struct.thread** %tqh_first, align 8
  store %struct.thread* %38, %struct.thread** %td, align 8
  br label %if.end65

if.end65:                                         ; preds = %if.then64, %if.end61
  %39 = load %struct.proc*, %struct.proc** %p, align 8
  %40 = load %struct.proc**, %struct.proc*** %pp.addr, align 8
  store %struct.proc* %39, %struct.proc** %40, align 8
  %41 = load %struct.thread*, %struct.thread** %td, align 8
  %42 = load %struct.thread**, %struct.thread*** %tdp.addr, align 8
  store %struct.thread* %41, %struct.thread** %42, align 8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end65, %if.then58, %sw.default, %sw.bb54, %if.end50, %if.then49, %if.end41, %if.then40, %if.then24, %if.then6
  %43 = load i32, i32* %retval
  ret i32 %43
}

; Function Attrs: noimplicitfloat noredzone
declare void @__tesla_inline_assertion(i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) #2

; Function Attrs: noimplicitfloat noredzone
declare void @thread_lock_flags_(%struct.thread*, i32, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cpuset_shadow(%struct.cpuset* %set, %struct.cpuset* %fset, %struct._cpuset* %mask) #0 {
entry:
  %retval = alloca i32, align 4
  %set.addr = alloca %struct.cpuset*, align 8
  %fset.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %parent = alloca %struct.cpuset*, align 8
  %__i = alloca i64, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  store %struct.cpuset* %fset, %struct.cpuset** %fset.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 3
  %1 = load i32, i32* %cs_id, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %2, i32 0, i32 4
  %3 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  store %struct.cpuset* %3, %struct.cpuset** %parent, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  store %struct.cpuset* %4, %struct.cpuset** %parent, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i64 0, i64* %__i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %__i, align 8
  %cmp1 = icmp ult i64 %5, 1
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %__i, align 8
  %7 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %7, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %6
  %8 = load i64, i64* %arrayidx, align 8
  %9 = load i64, i64* %__i, align 8
  %10 = load %struct.cpuset*, %struct.cpuset** %parent, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %10, i32 0, i32 0
  %__bits2 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits2, i32 0, i64 %9
  %11 = load i64, i64* %arrayidx3, align 8
  %and = and i64 %8, %11
  %12 = load i64, i64* %__i, align 8
  %13 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits4 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %13, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits4, i32 0, i64 %12
  %14 = load i64, i64* %arrayidx5, align 8
  %cmp6 = icmp ne i64 %and, %14
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.body
  br label %for.end

if.end8:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %15 = load i64, i64* %__i, align 8
  %inc = add i64 %15, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then7, %for.cond
  %16 = load i64, i64* %__i, align 8
  %cmp9 = icmp eq i64 %16, 1
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %for.end
  store i32 11, i32* %retval
  br label %return

if.end11:                                         ; preds = %for.end
  %17 = load %struct.cpuset*, %struct.cpuset** %fset.addr, align 8
  %18 = load %struct.cpuset*, %struct.cpuset** %parent, align 8
  %19 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %call = call i32 @_cpuset_create(%struct.cpuset* %17, %struct.cpuset* %18, %struct._cpuset* %19, i32 -1) #7
  store i32 %call, i32* %retval
  br label %return

return:                                           ; preds = %if.end11, %if.then10
  %20 = load i32, i32* %retval
  ret i32 %20
}

; Function Attrs: noimplicitfloat noredzone
declare void @sched_affinity(%struct.thread*) #2

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_unlock_flags(i64*, i32, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.cpuset* @cpuset_thread0() #0 {
entry:
  %set = alloca %struct.cpuset*, align 8
  %error = alloca i32, align 4
  %__i = alloca i64, align 8
  %call = call %struct.uma_zone* @uma_zcreate(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str6, i32 0, i32 0), i64 72, i32 (i8*, i32, i8*, i32)* null, void (i8*, i32, i8*)* null, i32 (i8*, i32, i32)* null, void (i8*, i32)* null, i32 7, i32 0) #7
  store %struct.uma_zone* %call, %struct.uma_zone** @cpuset_zone, align 8
  call void @_mtx_init(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str6, i32 0, i32 0), i8* null, i32 5) #7
  %0 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %call1 = call i8* @uma_zalloc(%struct.uma_zone* %0, i32 258) #7
  %1 = bitcast i8* %call1 to %struct.cpuset*
  store %struct.cpuset* %1, %struct.cpuset** %set, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  store i64 0, i64* %__i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %2 = load i64, i64* %__i, align 8
  %cmp = icmp ult i64 %2, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %__i, align 8
  %4 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %4, i32 0, i32 0
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %3
  store i64 -1, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %__i, align 8
  %inc = add i64 %5, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %6 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_children = getelementptr inbounds %struct.cpuset, %struct.cpuset* %6, i32 0, i32 7
  %lh_first = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children, i32 0, i32 0
  store %struct.cpuset* null, %struct.cpuset** %lh_first, align 8
  br label %do.end3

do.end3:                                          ; preds = %do.body2
  br label %do.body4

do.body4:                                         ; preds = %do.end3
  br label %do.body5

do.body5:                                         ; preds = %do.body4
  %7 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %cmp6 = icmp ne %struct.cpuset* %7, null
  br i1 %cmp6, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body5
  %8 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %8, i32 0, i32 5
  %le_prev = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 1
  %9 = load %struct.cpuset**, %struct.cpuset*** %le_prev, align 8
  %cmp7 = icmp ne %struct.cpuset** %9, getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0)
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str7, i32 0, i32 0), %struct.setlist* @cpuset_ids) #8
  unreachable

if.end:                                           ; preds = %land.lhs.true, %do.body5
  br label %do.end8

do.end8:                                          ; preds = %if.end
  %10 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %11 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_link9 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %11, i32 0, i32 5
  %le_next = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link9, i32 0, i32 0
  store %struct.cpuset* %10, %struct.cpuset** %le_next, align 8
  %cmp10 = icmp ne %struct.cpuset* %10, null
  br i1 %cmp10, label %if.then11, label %if.end16

if.then11:                                        ; preds = %do.end8
  %12 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_link12 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %12, i32 0, i32 5
  %le_next13 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link12, i32 0, i32 0
  %13 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %cs_link14 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 5
  %le_prev15 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link14, i32 0, i32 1
  store %struct.cpuset** %le_next13, %struct.cpuset*** %le_prev15, align 8
  br label %if.end16

if.end16:                                         ; preds = %if.then11, %do.end8
  %14 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  store %struct.cpuset* %14, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %15 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_link17 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %15, i32 0, i32 5
  %le_prev18 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link17, i32 0, i32 1
  store %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), %struct.cpuset*** %le_prev18, align 8
  br label %do.end19

do.end19:                                         ; preds = %if.end16
  %16 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_ref = getelementptr inbounds %struct.cpuset, %struct.cpuset* %16, i32 0, i32 1
  store volatile i32 1, i32* %cs_ref, align 4
  %17 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %17, i32 0, i32 2
  store i32 1, i32* %cs_flags, align 4
  %18 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  store %struct.cpuset* %18, %struct.cpuset** @cpuset_zero, align 8
  %19 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_mask20 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %19, i32 0, i32 0
  store %struct._cpuset* %cs_mask20, %struct._cpuset** @cpuset_root, align 8
  %20 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %call21 = call i8* @uma_zalloc(%struct.uma_zone* %20, i32 2) #7
  %21 = bitcast i8* %call21 to %struct.cpuset*
  store %struct.cpuset* %21, %struct.cpuset** %set, align 8
  %22 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %23 = load %struct.cpuset*, %struct.cpuset** @cpuset_zero, align 8
  %24 = load %struct.cpuset*, %struct.cpuset** @cpuset_zero, align 8
  %cs_mask22 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %24, i32 0, i32 0
  %call23 = call i32 @_cpuset_create(%struct.cpuset* %22, %struct.cpuset* %23, %struct._cpuset* %cs_mask22, i32 1) #7
  store i32 %call23, i32* %error, align 4
  br label %do.body24

do.body24:                                        ; preds = %do.end19
  %25 = load i32, i32* %error, align 4
  %cmp25 = icmp eq i32 %25, 0
  %lnot = xor i1 %cmp25, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then26, label %if.end27

if.then26:                                        ; preds = %do.body24
  %26 = load i32, i32* %error, align 4
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str8, i32 0, i32 0), i32 %26) #7
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %do.body24
  br label %do.end28

do.end28:                                         ; preds = %if.end27
  %call29 = call %struct.unrhdr* @new_unrhdr(i32 2, i32 2147483647, %struct.mtx* null) #7
  store %struct.unrhdr* %call29, %struct.unrhdr** @cpuset_unr, align 8
  %27 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  ret %struct.cpuset* %27
}

; Function Attrs: noimplicitfloat noredzone
declare %struct.uma_zone* @uma_zcreate(i8*, i64, i32 (i8*, i32, i8*, i32)*, void (i8*, i32, i8*)*, i32 (i8*, i32, i32)*, void (i8*, i32)*, i32, i32) #2

; Function Attrs: noimplicitfloat noredzone
declare void @_mtx_init(i64*, i8*, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @_cpuset_create(%struct.cpuset* %set, %struct.cpuset* %parent, %struct._cpuset* %mask, i32 %id) #0 {
entry:
  %retval = alloca i32, align 4
  %set.addr = alloca %struct.cpuset*, align 8
  %parent.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %id.addr = alloca i32, align 4
  %__i = alloca i64, align 8
  %__i9 = alloca i64, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  store %struct.cpuset* %parent, %struct.cpuset** %parent.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  store i32 %id, i32* %id.addr, align 4
  store i64 0, i64* %__i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %__i, align 8
  %cmp = icmp ult i64 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %__i, align 8
  %2 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %2, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %1
  %3 = load i64, i64* %arrayidx, align 8
  %4 = load i64, i64* %__i, align 8
  %5 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %5, i32 0, i32 0
  %__bits1 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits1, i32 0, i64 %4
  %6 = load i64, i64* %arrayidx2, align 8
  %and = and i64 %3, %6
  %cmp3 = icmp ne i64 %and, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i64, i64* %__i, align 8
  %inc = add i64 %7, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %8 = load i64, i64* %__i, align 8
  %cmp4 = icmp ne i64 %8, 1
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %for.end
  store i32 11, i32* %retval
  br label %return

if.end6:                                          ; preds = %for.end
  %9 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask7 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %9, i32 0, i32 0
  %10 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %11 = bitcast %struct._cpuset* %cs_mask7 to i8*
  %12 = bitcast %struct._cpuset* %10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 8, i1 false)
  br label %do.body

do.body:                                          ; preds = %if.end6
  %13 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_children = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 7
  %lh_first = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children, i32 0, i32 0
  store %struct.cpuset* null, %struct.cpuset** %lh_first, align 8
  br label %do.end

do.end:                                           ; preds = %do.body
  %14 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_ref = getelementptr inbounds %struct.cpuset, %struct.cpuset* %14, i32 0, i32 1
  call void @refcount_init(i32* %cs_ref, i32 1) #7
  %15 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %15, i32 0, i32 2
  store i32 0, i32* %cs_flags, align 4
  call void @__mtx_lock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 266) #7
  br label %do.body8

do.body8:                                         ; preds = %do.end
  store i64 0, i64* %__i9, align 8
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc20, %do.body8
  %16 = load i64, i64* %__i9, align 8
  %cmp11 = icmp ult i64 %16, 1
  br i1 %cmp11, label %for.body12, label %for.end22

for.body12:                                       ; preds = %for.cond10
  %17 = load i64, i64* %__i9, align 8
  %18 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_mask13 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %18, i32 0, i32 0
  %__bits14 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask13, i32 0, i32 0
  %arrayidx15 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits14, i32 0, i64 %17
  %19 = load i64, i64* %arrayidx15, align 8
  %20 = load i64, i64* %__i9, align 8
  %21 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask16 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %21, i32 0, i32 0
  %__bits17 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask16, i32 0, i32 0
  %arrayidx18 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits17, i32 0, i64 %20
  %22 = load i64, i64* %arrayidx18, align 8
  %and19 = and i64 %22, %19
  store i64 %and19, i64* %arrayidx18, align 8
  br label %for.inc20

for.inc20:                                        ; preds = %for.body12
  %23 = load i64, i64* %__i9, align 8
  %inc21 = add i64 %23, 1
  store i64 %inc21, i64* %__i9, align 8
  br label %for.cond10

for.end22:                                        ; preds = %for.cond10
  br label %do.end23

do.end23:                                         ; preds = %for.end22
  %24 = load i32, i32* %id.addr, align 4
  %25 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %25, i32 0, i32 3
  store i32 %24, i32* %cs_id, align 4
  %26 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %call = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %26) #7
  %27 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %27, i32 0, i32 4
  store %struct.cpuset* %call, %struct.cpuset** %cs_parent, align 8
  br label %do.body24

do.body24:                                        ; preds = %do.end23
  br label %do.body25

do.body25:                                        ; preds = %do.body24
  %28 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children26 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %28, i32 0, i32 7
  %lh_first27 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children26, i32 0, i32 0
  %29 = load %struct.cpuset*, %struct.cpuset** %lh_first27, align 8
  %cmp28 = icmp ne %struct.cpuset* %29, null
  br i1 %cmp28, label %land.lhs.true, label %if.end36

land.lhs.true:                                    ; preds = %do.body25
  %30 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children29 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %30, i32 0, i32 7
  %lh_first30 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children29, i32 0, i32 0
  %31 = load %struct.cpuset*, %struct.cpuset** %lh_first30, align 8
  %cs_siblings = getelementptr inbounds %struct.cpuset, %struct.cpuset* %31, i32 0, i32 6
  %le_prev = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings, i32 0, i32 1
  %32 = load %struct.cpuset**, %struct.cpuset*** %le_prev, align 8
  %33 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children31 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %33, i32 0, i32 7
  %lh_first32 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children31, i32 0, i32 0
  %cmp33 = icmp ne %struct.cpuset** %32, %lh_first32
  br i1 %cmp33, label %if.then34, label %if.end36

if.then34:                                        ; preds = %land.lhs.true
  %34 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children35 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %34, i32 0, i32 7
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str7, i32 0, i32 0), %struct.setlist* %cs_children35) #8
  unreachable

if.end36:                                         ; preds = %land.lhs.true, %do.body25
  br label %do.end37

do.end37:                                         ; preds = %if.end36
  %35 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children38 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %35, i32 0, i32 7
  %lh_first39 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children38, i32 0, i32 0
  %36 = load %struct.cpuset*, %struct.cpuset** %lh_first39, align 8
  %37 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings40 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %37, i32 0, i32 6
  %le_next = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings40, i32 0, i32 0
  store %struct.cpuset* %36, %struct.cpuset** %le_next, align 8
  %cmp41 = icmp ne %struct.cpuset* %36, null
  br i1 %cmp41, label %if.then42, label %if.end49

if.then42:                                        ; preds = %do.end37
  %38 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings43 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %38, i32 0, i32 6
  %le_next44 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings43, i32 0, i32 0
  %39 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children45 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %39, i32 0, i32 7
  %lh_first46 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children45, i32 0, i32 0
  %40 = load %struct.cpuset*, %struct.cpuset** %lh_first46, align 8
  %cs_siblings47 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %40, i32 0, i32 6
  %le_prev48 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings47, i32 0, i32 1
  store %struct.cpuset** %le_next44, %struct.cpuset*** %le_prev48, align 8
  br label %if.end49

if.end49:                                         ; preds = %if.then42, %do.end37
  %41 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %42 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children50 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %42, i32 0, i32 7
  %lh_first51 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children50, i32 0, i32 0
  store %struct.cpuset* %41, %struct.cpuset** %lh_first51, align 8
  %43 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %cs_children52 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %43, i32 0, i32 7
  %lh_first53 = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children52, i32 0, i32 0
  %44 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings54 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %44, i32 0, i32 6
  %le_prev55 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings54, i32 0, i32 1
  store %struct.cpuset** %lh_first53, %struct.cpuset*** %le_prev55, align 8
  br label %do.end56

do.end56:                                         ; preds = %if.end49
  %45 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_id57 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %45, i32 0, i32 3
  %46 = load i32, i32* %cs_id57, align 4
  %cmp58 = icmp ne i32 %46, -1
  br i1 %cmp58, label %if.then59, label %if.end81

if.then59:                                        ; preds = %do.end56
  br label %do.body60

do.body60:                                        ; preds = %if.then59
  br label %do.body61

do.body61:                                        ; preds = %do.body60
  %47 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %cmp62 = icmp ne %struct.cpuset* %47, null
  br i1 %cmp62, label %land.lhs.true63, label %if.end67

land.lhs.true63:                                  ; preds = %do.body61
  %48 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %48, i32 0, i32 5
  %le_prev64 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 1
  %49 = load %struct.cpuset**, %struct.cpuset*** %le_prev64, align 8
  %cmp65 = icmp ne %struct.cpuset** %49, getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0)
  br i1 %cmp65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %land.lhs.true63
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str7, i32 0, i32 0), %struct.setlist* @cpuset_ids) #8
  unreachable

if.end67:                                         ; preds = %land.lhs.true63, %do.body61
  br label %do.end68

do.end68:                                         ; preds = %if.end67
  %50 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %51 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link69 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %51, i32 0, i32 5
  %le_next70 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link69, i32 0, i32 0
  store %struct.cpuset* %50, %struct.cpuset** %le_next70, align 8
  %cmp71 = icmp ne %struct.cpuset* %50, null
  br i1 %cmp71, label %if.then72, label %if.end77

if.then72:                                        ; preds = %do.end68
  %52 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link73 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %52, i32 0, i32 5
  %le_next74 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link73, i32 0, i32 0
  %53 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %cs_link75 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %53, i32 0, i32 5
  %le_prev76 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link75, i32 0, i32 1
  store %struct.cpuset** %le_next74, %struct.cpuset*** %le_prev76, align 8
  br label %if.end77

if.end77:                                         ; preds = %if.then72, %do.end68
  %54 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  store %struct.cpuset* %54, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  %55 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link78 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %55, i32 0, i32 5
  %le_prev79 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link78, i32 0, i32 1
  store %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), %struct.cpuset*** %le_prev79, align 8
  br label %do.end80

do.end80:                                         ; preds = %if.end77
  br label %if.end81

if.end81:                                         ; preds = %do.end80, %do.end56
  call void @__mtx_unlock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 273) #7
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end81, %if.then5
  %56 = load i32, i32* %retval
  ret i32 %56
}

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #4

; Function Attrs: noimplicitfloat noredzone
declare void @kassert_panic(i8*, ...) #2

; Function Attrs: noimplicitfloat noredzone
declare %struct.unrhdr* @new_unrhdr(i32, i32, %struct.mtx*) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cpuset_create_root(%struct.prison* %pr, %struct.cpuset** %setp) #0 {
entry:
  %retval = alloca i32, align 4
  %pr.addr = alloca %struct.prison*, align 8
  %setp.addr = alloca %struct.cpuset**, align 8
  %set = alloca %struct.cpuset*, align 8
  %error = alloca i32, align 4
  store %struct.prison* %pr, %struct.prison** %pr.addr, align 8
  store %struct.cpuset** %setp, %struct.cpuset*** %setp.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.prison*, %struct.prison** %pr.addr, align 8
  %cmp = icmp ne %struct.prison* %0, null
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__func__.cpuset_create_root, i32 0, i32 0), i32 802) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %1 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  %cmp2 = icmp ne %struct.cpuset** %1, null
  %lnot4 = xor i1 %cmp2, true
  %lnot.ext5 = zext i1 %lnot4 to i32
  %conv6 = sext i32 %lnot.ext5 to i64
  %expval7 = call i64 @llvm.expect.i64(i64 %conv6, i64 0)
  %tobool8 = icmp ne i64 %expval7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body1
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__func__.cpuset_create_root, i32 0, i32 0), i32 803) #7
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body1
  br label %do.end11

do.end11:                                         ; preds = %if.end10
  %2 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  %3 = load %struct.prison*, %struct.prison** %pr.addr, align 8
  %pr_cpuset = getelementptr inbounds %struct.prison, %struct.prison* %3, i32 0, i32 11
  %4 = load %struct.cpuset*, %struct.cpuset** %pr_cpuset, align 8
  %5 = load %struct.prison*, %struct.prison** %pr.addr, align 8
  %pr_cpuset12 = getelementptr inbounds %struct.prison, %struct.prison* %5, i32 0, i32 11
  %6 = load %struct.cpuset*, %struct.cpuset** %pr_cpuset12, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %6, i32 0, i32 0
  %call = call i32 @cpuset_create(%struct.cpuset** %2, %struct.cpuset* %4, %struct._cpuset* %cs_mask) #7
  store i32 %call, i32* %error, align 4
  %7 = load i32, i32* %error, align 4
  %tobool13 = icmp ne i32 %7, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %do.end11
  %8 = load i32, i32* %error, align 4
  store i32 %8, i32* %retval
  br label %return

if.end15:                                         ; preds = %do.end11
  br label %do.body16

do.body16:                                        ; preds = %if.end15
  %9 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  %10 = load %struct.cpuset*, %struct.cpuset** %9, align 8
  %cmp17 = icmp ne %struct.cpuset* %10, null
  %lnot19 = xor i1 %cmp17, true
  %lnot.ext20 = zext i1 %lnot19 to i32
  %conv21 = sext i32 %lnot.ext20 to i64
  %expval22 = call i64 @llvm.expect.i64(i64 %conv21, i64 0)
  %tobool23 = icmp ne i64 %expval22, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %do.body16
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__func__.cpuset_create_root, i32 0, i32 0), i32 810) #7
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %do.body16
  br label %do.end26

do.end26:                                         ; preds = %if.end25
  %11 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  %12 = load %struct.cpuset*, %struct.cpuset** %11, align 8
  store %struct.cpuset* %12, %struct.cpuset** %set, align 8
  %13 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 2
  %14 = load i32, i32* %cs_flags, align 4
  %or = or i32 %14, 1
  store i32 %or, i32* %cs_flags, align 4
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %do.end26, %if.then14
  %15 = load i32, i32* %retval
  ret i32 %15
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cpuset_create(%struct.cpuset** %setp, %struct.cpuset* %parent, %struct._cpuset* %mask) #0 {
entry:
  %retval = alloca i32, align 4
  %setp.addr = alloca %struct.cpuset**, align 8
  %parent.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %set = alloca %struct.cpuset*, align 8
  %id = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.cpuset** %setp, %struct.cpuset*** %setp.addr, align 8
  store %struct.cpuset* %parent, %struct.cpuset** %parent.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  %0 = load %struct.unrhdr*, %struct.unrhdr** @cpuset_unr, align 8
  %call = call i32 @alloc_unr(%struct.unrhdr* %0) #7
  store i32 %call, i32* %id, align 4
  %1 = load i32, i32* %id, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 23, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %call1 = call i8* @uma_zalloc(%struct.uma_zone* %2, i32 2) #7
  %3 = bitcast i8* %call1 to %struct.cpuset*
  store %struct.cpuset* %3, %struct.cpuset** %set, align 8
  %4 = load %struct.cpuset**, %struct.cpuset*** %setp.addr, align 8
  store %struct.cpuset* %3, %struct.cpuset** %4, align 8
  %5 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %6 = load %struct.cpuset*, %struct.cpuset** %parent.addr, align 8
  %7 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %8 = load i32, i32* %id, align 4
  %call2 = call i32 @_cpuset_create(%struct.cpuset* %5, %struct.cpuset* %6, %struct._cpuset* %7, i32 %8) #7
  store i32 %call2, i32* %error, align 4
  %9 = load i32, i32* %error, align 4
  %cmp3 = icmp eq i32 %9, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

if.end5:                                          ; preds = %if.end
  %10 = load %struct.unrhdr*, %struct.unrhdr** @cpuset_unr, align 8
  %11 = load i32, i32* %id, align 4
  call void @free_unr(%struct.unrhdr* %10, i32 %11) #7
  %12 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %13 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %14 = bitcast %struct.cpuset* %13 to i8*
  call void @uma_zfree(%struct.uma_zone* %12, i8* %14) #7
  %15 = load i32, i32* %error, align 4
  store i32 %15, i32* %retval
  br label %return

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %16 = load i32, i32* %retval
  ret i32 %16
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cpuset_setproc_update_set(%struct.proc* %p, %struct.cpuset* %set) #0 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca %struct.proc*, align 8
  %set.addr = alloca %struct.cpuset*, align 8
  %error = alloca i32, align 4
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %cmp = icmp ne %struct.proc* %0, null
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.cpuset_setproc_update_set, i32 0, i32 0), i32 824) #7
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %1 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cmp2 = icmp ne %struct.cpuset* %1, null
  %lnot4 = xor i1 %cmp2, true
  %lnot.ext5 = zext i1 %lnot4 to i32
  %conv6 = sext i32 %lnot.ext5 to i64
  %expval7 = call i64 @llvm.expect.i64(i64 %conv6, i64 0)
  %tobool8 = icmp ne i64 %expval7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body1
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.cpuset_setproc_update_set, i32 0, i32 0), i32 825) #7
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body1
  br label %do.end11

do.end11:                                         ; preds = %if.end10
  %2 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %call = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %2) #7
  %3 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_pid = getelementptr inbounds %struct.proc, %struct.proc* %3, i32 0, i32 12
  %4 = load i32, i32* %p_pid, align 4
  %5 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %call12 = call i32 @cpuset_setproc(i32 %4, %struct.cpuset* %5, %struct._cpuset* null) #7
  store i32 %call12, i32* %error, align 4
  %6 = load i32, i32* %error, align 4
  %tobool13 = icmp ne i32 %6, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %do.end11
  %7 = load i32, i32* %error, align 4
  store i32 %7, i32* %retval
  br label %return

if.end15:                                         ; preds = %do.end11
  %8 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void @cpuset_rel(%struct.cpuset* %8) #7
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end15, %if.then14
  %9 = load i32, i32* %retval
  ret i32 %9
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cpuset_setproc(i32 %pid, %struct.cpuset* %set, %struct._cpuset* %mask) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %set.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %freelist = alloca %struct.setlist, align 8
  %droplist = alloca %struct.setlist, align 8
  %tdset = alloca %struct.cpuset*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %td = alloca %struct.thread*, align 8
  %p = alloca %struct.proc*, align 8
  %threads = alloca i32, align 4
  %nfree = alloca i32, align 4
  %error = alloca i32, align 4
  %__i = alloca i64, align 8
  %__i75 = alloca i64, align 8
  store i32 %pid, i32* %pid.addr, align 4
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %lh_first = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  store %struct.cpuset* null, %struct.cpuset** %lh_first, align 8
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %lh_first2 = getelementptr inbounds %struct.setlist, %struct.setlist* %droplist, i32 0, i32 0
  store %struct.cpuset* null, %struct.cpuset** %lh_first2, align 8
  br label %do.end3

do.end3:                                          ; preds = %do.body1
  store i32 0, i32* %nfree, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.end, %do.end3
  %0 = load i32, i32* %pid.addr, align 4
  %conv = sext i32 %0 to i64
  %call = call i32 @cpuset_which(i32 2, i64 %conv, %struct.proc** %p, %struct.thread** %td, %struct.cpuset** %nset) #7
  store i32 %call, i32* %error, align 4
  %1 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  br label %out

if.end:                                           ; preds = %for.cond
  %2 = load i32, i32* %nfree, align 4
  %3 = load %struct.proc*, %struct.proc** %p, align 8
  %p_numthreads = getelementptr inbounds %struct.proc, %struct.proc* %3, i32 0, i32 63
  %4 = load i32, i32* %p_numthreads, align 4
  %cmp = icmp sge i32 %2, %4
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  br label %for.end40

if.end6:                                          ; preds = %if.end
  %5 = load %struct.proc*, %struct.proc** %p, align 8
  %p_numthreads7 = getelementptr inbounds %struct.proc, %struct.proc* %5, i32 0, i32 63
  %6 = load i32, i32* %p_numthreads7, align 4
  store i32 %6, i32* %threads, align 4
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 537) #7
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %if.end6
  %8 = load i32, i32* %nfree, align 4
  %9 = load i32, i32* %threads, align 4
  %cmp9 = icmp slt i32 %8, %9
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond8
  %10 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %call11 = call i8* @uma_zalloc(%struct.uma_zone* %10, i32 2) #7
  %11 = bitcast i8* %call11 to %struct.cpuset*
  store %struct.cpuset* %11, %struct.cpuset** %nset, align 8
  br label %do.body12

do.body12:                                        ; preds = %for.body
  br label %do.body13

do.body13:                                        ; preds = %do.body12
  %lh_first14 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %12 = load %struct.cpuset*, %struct.cpuset** %lh_first14, align 8
  %cmp15 = icmp ne %struct.cpuset* %12, null
  br i1 %cmp15, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %do.body13
  %lh_first17 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %13 = load %struct.cpuset*, %struct.cpuset** %lh_first17, align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 5
  %le_prev = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 1
  %14 = load %struct.cpuset**, %struct.cpuset*** %le_prev, align 8
  %lh_first18 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %cmp19 = icmp ne %struct.cpuset** %14, %lh_first18
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str7, i32 0, i32 0), %struct.setlist* %freelist) #8
  unreachable

if.end22:                                         ; preds = %land.lhs.true, %do.body13
  br label %do.end23

do.end23:                                         ; preds = %if.end22
  %lh_first24 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %15 = load %struct.cpuset*, %struct.cpuset** %lh_first24, align 8
  %16 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link25 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %16, i32 0, i32 5
  %le_next = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link25, i32 0, i32 0
  store %struct.cpuset* %15, %struct.cpuset** %le_next, align 8
  %cmp26 = icmp ne %struct.cpuset* %15, null
  br i1 %cmp26, label %if.then28, label %if.end34

if.then28:                                        ; preds = %do.end23
  %17 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link29 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %17, i32 0, i32 5
  %le_next30 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link29, i32 0, i32 0
  %lh_first31 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %18 = load %struct.cpuset*, %struct.cpuset** %lh_first31, align 8
  %cs_link32 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %18, i32 0, i32 5
  %le_prev33 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link32, i32 0, i32 1
  store %struct.cpuset** %le_next30, %struct.cpuset*** %le_prev33, align 8
  br label %if.end34

if.end34:                                         ; preds = %if.then28, %do.end23
  %19 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %lh_first35 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  store %struct.cpuset* %19, %struct.cpuset** %lh_first35, align 8
  %lh_first36 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %20 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link37 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %20, i32 0, i32 5
  %le_prev38 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link37, i32 0, i32 1
  store %struct.cpuset** %lh_first36, %struct.cpuset*** %le_prev38, align 8
  br label %do.end39

do.end39:                                         ; preds = %if.end34
  br label %for.inc

for.inc:                                          ; preds = %do.end39
  %21 = load i32, i32* %nfree, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %nfree, align 4
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  br label %for.cond

for.end40:                                        ; preds = %if.then5
  %22 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx41 = getelementptr inbounds %struct.proc, %struct.proc* %22, i32 0, i32 18
  %mtx_lock42 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx41, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock42, i32 4, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 543) #7
  store i32 0, i32* %error, align 4
  %23 = load %struct.proc*, %struct.proc** %p, align 8
  %p_threads = getelementptr inbounds %struct.proc, %struct.proc* %23, i32 0, i32 1
  %tqh_first = getelementptr inbounds %struct.anon.1, %struct.anon.1* %p_threads, i32 0, i32 0
  %24 = load %struct.thread*, %struct.thread** %tqh_first, align 8
  store %struct.thread* %24, %struct.thread** %td, align 8
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc104, %for.end40
  %25 = load %struct.thread*, %struct.thread** %td, align 8
  %tobool44 = icmp ne %struct.thread* %25, null
  br i1 %tobool44, label %for.body45, label %for.end105

for.body45:                                       ; preds = %for.cond43
  %26 = load %struct.thread*, %struct.thread** %td, align 8
  call void @thread_lock_flags_(%struct.thread* %26, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 551) #7
  %27 = load %struct.thread*, %struct.thread** %td, align 8
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %27, i32 0, i32 7
  %28 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  store %struct.cpuset* %28, %struct.cpuset** %tdset, align 8
  %29 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %tobool46 = icmp ne %struct._cpuset* %29, null
  br i1 %tobool46, label %if.then47, label %if.else

if.then47:                                        ; preds = %for.body45
  %30 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %30, i32 0, i32 3
  %31 = load i32, i32* %cs_id, align 4
  %cmp48 = icmp eq i32 %31, -1
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.then47
  %32 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %32, i32 0, i32 4
  %33 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  store %struct.cpuset* %33, %struct.cpuset** %tdset, align 8
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %if.then47
  store i64 0, i64* %__i, align 8
  br label %for.cond52

for.cond52:                                       ; preds = %for.inc64, %if.end51
  %34 = load i64, i64* %__i, align 8
  %cmp53 = icmp ult i64 %34, 1
  br i1 %cmp53, label %for.body55, label %for.end66

for.body55:                                       ; preds = %for.cond52
  %35 = load i64, i64* %__i, align 8
  %36 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %36, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %35
  %37 = load i64, i64* %arrayidx, align 8
  %38 = load i64, i64* %__i, align 8
  %39 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %39, i32 0, i32 0
  %__bits56 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx57 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits56, i32 0, i64 %38
  %40 = load i64, i64* %arrayidx57, align 8
  %and = and i64 %37, %40
  %41 = load i64, i64* %__i, align 8
  %42 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits58 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %42, i32 0, i32 0
  %arrayidx59 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits58, i32 0, i64 %41
  %43 = load i64, i64* %arrayidx59, align 8
  %cmp60 = icmp ne i64 %and, %43
  br i1 %cmp60, label %if.then62, label %if.end63

if.then62:                                        ; preds = %for.body55
  br label %for.end66

if.end63:                                         ; preds = %for.body55
  br label %for.inc64

for.inc64:                                        ; preds = %if.end63
  %44 = load i64, i64* %__i, align 8
  %inc65 = add i64 %44, 1
  store i64 %inc65, i64* %__i, align 8
  br label %for.cond52

for.end66:                                        ; preds = %if.then62, %for.cond52
  %45 = load i64, i64* %__i, align 8
  %cmp67 = icmp eq i64 %45, 1
  br i1 %cmp67, label %if.end70, label %if.then69

if.then69:                                        ; preds = %for.end66
  store i32 11, i32* %error, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %for.end66
  br label %if.end99

if.else:                                          ; preds = %for.body45
  %46 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_id71 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %46, i32 0, i32 3
  %47 = load i32, i32* %cs_id71, align 4
  %cmp72 = icmp eq i32 %47, -1
  br i1 %cmp72, label %if.then74, label %if.end98

if.then74:                                        ; preds = %if.else
  store i64 0, i64* %__i75, align 8
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc91, %if.then74
  %48 = load i64, i64* %__i75, align 8
  %cmp77 = icmp ult i64 %48, 1
  br i1 %cmp77, label %for.body79, label %for.end93

for.body79:                                       ; preds = %for.cond76
  %49 = load i64, i64* %__i75, align 8
  %50 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_mask80 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %50, i32 0, i32 0
  %__bits81 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask80, i32 0, i32 0
  %arrayidx82 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits81, i32 0, i64 %49
  %51 = load i64, i64* %arrayidx82, align 8
  %52 = load i64, i64* %__i75, align 8
  %53 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask83 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %53, i32 0, i32 0
  %__bits84 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask83, i32 0, i32 0
  %arrayidx85 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits84, i32 0, i64 %52
  %54 = load i64, i64* %arrayidx85, align 8
  %and86 = and i64 %51, %54
  %cmp87 = icmp ne i64 %and86, 0
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %for.body79
  br label %for.end93

if.end90:                                         ; preds = %for.body79
  br label %for.inc91

for.inc91:                                        ; preds = %if.end90
  %55 = load i64, i64* %__i75, align 8
  %inc92 = add i64 %55, 1
  store i64 %inc92, i64* %__i75, align 8
  br label %for.cond76

for.end93:                                        ; preds = %if.then89, %for.cond76
  %56 = load i64, i64* %__i75, align 8
  %cmp94 = icmp ne i64 %56, 1
  br i1 %cmp94, label %if.end97, label %if.then96

if.then96:                                        ; preds = %for.end93
  store i32 11, i32* %error, align 4
  br label %if.end97

if.end97:                                         ; preds = %if.then96, %for.end93
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.else
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.end70
  %57 = load %struct.thread*, %struct.thread** %td, align 8
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %57, i32 0, i32 0
  %58 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock100 = getelementptr inbounds %struct.mtx, %struct.mtx* %58, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock100, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 571) #7
  %59 = load i32, i32* %error, align 4
  %tobool101 = icmp ne i32 %59, 0
  br i1 %tobool101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end99
  br label %unlock_out

if.end103:                                        ; preds = %if.end99
  br label %for.inc104

for.inc104:                                       ; preds = %if.end103
  %60 = load %struct.thread*, %struct.thread** %td, align 8
  %td_plist = getelementptr inbounds %struct.thread, %struct.thread* %60, i32 0, i32 2
  %tqe_next = getelementptr inbounds %struct.anon.35, %struct.anon.35* %td_plist, i32 0, i32 0
  %61 = load %struct.thread*, %struct.thread** %tqe_next, align 8
  store %struct.thread* %61, %struct.thread** %td, align 8
  br label %for.cond43

for.end105:                                       ; preds = %for.cond43
  %62 = load %struct.proc*, %struct.proc** %p, align 8
  %p_threads106 = getelementptr inbounds %struct.proc, %struct.proc* %62, i32 0, i32 1
  %tqh_first107 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %p_threads106, i32 0, i32 0
  %63 = load %struct.thread*, %struct.thread** %tqh_first107, align 8
  store %struct.thread* %63, %struct.thread** %td, align 8
  br label %for.cond108

for.cond108:                                      ; preds = %for.inc211, %for.end105
  %64 = load %struct.thread*, %struct.thread** %td, align 8
  %tobool109 = icmp ne %struct.thread* %64, null
  br i1 %tobool109, label %for.body110, label %for.end214

for.body110:                                      ; preds = %for.cond108
  %65 = load %struct.thread*, %struct.thread** %td, align 8
  call void @thread_lock_flags_(%struct.thread* %65, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 581) #7
  %66 = load %struct.thread*, %struct.thread** %td, align 8
  %td_cpuset111 = getelementptr inbounds %struct.thread, %struct.thread* %66, i32 0, i32 7
  %67 = load %struct.cpuset*, %struct.cpuset** %td_cpuset111, align 8
  store %struct.cpuset* %67, %struct.cpuset** %tdset, align 8
  %68 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_id112 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %68, i32 0, i32 3
  %69 = load i32, i32* %cs_id112, align 4
  %cmp113 = icmp eq i32 %69, -1
  br i1 %cmp113, label %if.then116, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body110
  %70 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %tobool115 = icmp ne %struct._cpuset* %70, null
  br i1 %tobool115, label %if.then116, label %if.else205

if.then116:                                       ; preds = %lor.lhs.false, %for.body110
  %lh_first117 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %71 = load %struct.cpuset*, %struct.cpuset** %lh_first117, align 8
  store %struct.cpuset* %71, %struct.cpuset** %nset, align 8
  br label %do.body118

do.body118:                                       ; preds = %if.then116
  br label %do.body119

do.body119:                                       ; preds = %do.body118
  %72 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link120 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %72, i32 0, i32 5
  %le_next121 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link120, i32 0, i32 0
  %73 = load %struct.cpuset*, %struct.cpuset** %le_next121, align 8
  %cmp122 = icmp ne %struct.cpuset* %73, null
  br i1 %cmp122, label %land.lhs.true124, label %if.end134

land.lhs.true124:                                 ; preds = %do.body119
  %74 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link125 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %74, i32 0, i32 5
  %le_next126 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link125, i32 0, i32 0
  %75 = load %struct.cpuset*, %struct.cpuset** %le_next126, align 8
  %cs_link127 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %75, i32 0, i32 5
  %le_prev128 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link127, i32 0, i32 1
  %76 = load %struct.cpuset**, %struct.cpuset*** %le_prev128, align 8
  %77 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link129 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %77, i32 0, i32 5
  %le_next130 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link129, i32 0, i32 0
  %cmp131 = icmp ne %struct.cpuset** %76, %le_next130
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %land.lhs.true124
  %78 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %78) #8
  unreachable

if.end134:                                        ; preds = %land.lhs.true124, %do.body119
  br label %do.end135

do.end135:                                        ; preds = %if.end134
  br label %do.body136

do.body136:                                       ; preds = %do.end135
  %79 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link137 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %79, i32 0, i32 5
  %le_prev138 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link137, i32 0, i32 1
  %80 = load %struct.cpuset**, %struct.cpuset*** %le_prev138, align 8
  %81 = load %struct.cpuset*, %struct.cpuset** %80, align 8
  %82 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cmp139 = icmp ne %struct.cpuset* %81, %82
  br i1 %cmp139, label %if.then141, label %if.end142

if.then141:                                       ; preds = %do.body136
  %83 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %83) #8
  unreachable

if.end142:                                        ; preds = %do.body136
  br label %do.end143

do.end143:                                        ; preds = %if.end142
  %84 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link144 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %84, i32 0, i32 5
  %le_next145 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link144, i32 0, i32 0
  %85 = load %struct.cpuset*, %struct.cpuset** %le_next145, align 8
  %cmp146 = icmp ne %struct.cpuset* %85, null
  br i1 %cmp146, label %if.then148, label %if.end155

if.then148:                                       ; preds = %do.end143
  %86 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link149 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %86, i32 0, i32 5
  %le_prev150 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link149, i32 0, i32 1
  %87 = load %struct.cpuset**, %struct.cpuset*** %le_prev150, align 8
  %88 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link151 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %88, i32 0, i32 5
  %le_next152 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link151, i32 0, i32 0
  %89 = load %struct.cpuset*, %struct.cpuset** %le_next152, align 8
  %cs_link153 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %89, i32 0, i32 5
  %le_prev154 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link153, i32 0, i32 1
  store %struct.cpuset** %87, %struct.cpuset*** %le_prev154, align 8
  br label %if.end155

if.end155:                                        ; preds = %if.then148, %do.end143
  %90 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link156 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %90, i32 0, i32 5
  %le_next157 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link156, i32 0, i32 0
  %91 = load %struct.cpuset*, %struct.cpuset** %le_next157, align 8
  %92 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link158 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %92, i32 0, i32 5
  %le_prev159 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link158, i32 0, i32 1
  %93 = load %struct.cpuset**, %struct.cpuset*** %le_prev159, align 8
  store %struct.cpuset* %91, %struct.cpuset** %93, align 8
  br label %do.end160

do.end160:                                        ; preds = %if.end155
  %94 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %tobool161 = icmp ne %struct._cpuset* %94, null
  br i1 %tobool161, label %if.then162, label %if.else164

if.then162:                                       ; preds = %do.end160
  %95 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %96 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %97 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %call163 = call i32 @cpuset_shadow(%struct.cpuset* %95, %struct.cpuset* %96, %struct._cpuset* %97) #7
  store i32 %call163, i32* %error, align 4
  br label %if.end167

if.else164:                                       ; preds = %do.end160
  %98 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %99 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %100 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  %cs_mask165 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %100, i32 0, i32 0
  %call166 = call i32 @_cpuset_create(%struct.cpuset* %98, %struct.cpuset* %99, %struct._cpuset* %cs_mask165, i32 -1) #7
  store i32 %call166, i32* %error, align 4
  br label %if.end167

if.end167:                                        ; preds = %if.else164, %if.then162
  %101 = load i32, i32* %error, align 4
  %tobool168 = icmp ne i32 %101, 0
  br i1 %tobool168, label %if.then169, label %if.end204

if.then169:                                       ; preds = %if.end167
  br label %do.body170

do.body170:                                       ; preds = %if.then169
  br label %do.body171

do.body171:                                       ; preds = %do.body170
  %lh_first172 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %102 = load %struct.cpuset*, %struct.cpuset** %lh_first172, align 8
  %cmp173 = icmp ne %struct.cpuset* %102, null
  br i1 %cmp173, label %land.lhs.true175, label %if.end183

land.lhs.true175:                                 ; preds = %do.body171
  %lh_first176 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %103 = load %struct.cpuset*, %struct.cpuset** %lh_first176, align 8
  %cs_link177 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %103, i32 0, i32 5
  %le_prev178 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link177, i32 0, i32 1
  %104 = load %struct.cpuset**, %struct.cpuset*** %le_prev178, align 8
  %lh_first179 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %cmp180 = icmp ne %struct.cpuset** %104, %lh_first179
  br i1 %cmp180, label %if.then182, label %if.end183

if.then182:                                       ; preds = %land.lhs.true175
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str7, i32 0, i32 0), %struct.setlist* %freelist) #8
  unreachable

if.end183:                                        ; preds = %land.lhs.true175, %do.body171
  br label %do.end184

do.end184:                                        ; preds = %if.end183
  %lh_first185 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %105 = load %struct.cpuset*, %struct.cpuset** %lh_first185, align 8
  %106 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link186 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %106, i32 0, i32 5
  %le_next187 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link186, i32 0, i32 0
  store %struct.cpuset* %105, %struct.cpuset** %le_next187, align 8
  %cmp188 = icmp ne %struct.cpuset* %105, null
  br i1 %cmp188, label %if.then190, label %if.end196

if.then190:                                       ; preds = %do.end184
  %107 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link191 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %107, i32 0, i32 5
  %le_next192 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link191, i32 0, i32 0
  %lh_first193 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %108 = load %struct.cpuset*, %struct.cpuset** %lh_first193, align 8
  %cs_link194 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %108, i32 0, i32 5
  %le_prev195 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link194, i32 0, i32 1
  store %struct.cpuset** %le_next192, %struct.cpuset*** %le_prev195, align 8
  br label %if.end196

if.end196:                                        ; preds = %if.then190, %do.end184
  %109 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %lh_first197 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  store %struct.cpuset* %109, %struct.cpuset** %lh_first197, align 8
  %lh_first198 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %110 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link199 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %110, i32 0, i32 5
  %le_prev200 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link199, i32 0, i32 1
  store %struct.cpuset** %lh_first198, %struct.cpuset*** %le_prev200, align 8
  br label %do.end201

do.end201:                                        ; preds = %if.end196
  %111 = load %struct.thread*, %struct.thread** %td, align 8
  %td_lock202 = getelementptr inbounds %struct.thread, %struct.thread* %111, i32 0, i32 0
  %112 = load volatile %struct.mtx*, %struct.mtx** %td_lock202, align 8
  %mtx_lock203 = getelementptr inbounds %struct.mtx, %struct.mtx* %112, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock203, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 601) #7
  br label %for.end214

if.end204:                                        ; preds = %if.end167
  br label %if.end207

if.else205:                                       ; preds = %lor.lhs.false
  %113 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %call206 = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %113) #7
  store %struct.cpuset* %call206, %struct.cpuset** %nset, align 8
  br label %if.end207

if.end207:                                        ; preds = %if.else205, %if.end204
  %114 = load %struct.cpuset*, %struct.cpuset** %tdset, align 8
  call void @cpuset_rel_defer(%struct.setlist* %droplist, %struct.cpuset* %114) #7
  %115 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %116 = load %struct.thread*, %struct.thread** %td, align 8
  %td_cpuset208 = getelementptr inbounds %struct.thread, %struct.thread* %116, i32 0, i32 7
  store %struct.cpuset* %115, %struct.cpuset** %td_cpuset208, align 8
  %117 = load %struct.thread*, %struct.thread** %td, align 8
  call void @sched_affinity(%struct.thread* %117) #7
  %118 = load %struct.thread*, %struct.thread** %td, align 8
  %td_lock209 = getelementptr inbounds %struct.thread, %struct.thread* %118, i32 0, i32 0
  %119 = load volatile %struct.mtx*, %struct.mtx** %td_lock209, align 8
  %mtx_lock210 = getelementptr inbounds %struct.mtx, %struct.mtx* %119, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock210, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 609) #7
  br label %for.inc211

for.inc211:                                       ; preds = %if.end207
  %120 = load %struct.thread*, %struct.thread** %td, align 8
  %td_plist212 = getelementptr inbounds %struct.thread, %struct.thread* %120, i32 0, i32 2
  %tqe_next213 = getelementptr inbounds %struct.anon.35, %struct.anon.35* %td_plist212, i32 0, i32 0
  %121 = load %struct.thread*, %struct.thread** %tqe_next213, align 8
  store %struct.thread* %121, %struct.thread** %td, align 8
  br label %for.cond108

for.end214:                                       ; preds = %do.end201, %for.cond108
  br label %unlock_out

unlock_out:                                       ; preds = %for.end214, %if.then102
  %122 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx215 = getelementptr inbounds %struct.proc, %struct.proc* %122, i32 0, i32 18
  %mtx_lock216 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx215, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock216, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 612) #7
  br label %out

out:                                              ; preds = %unlock_out, %if.then
  br label %while.cond

while.cond:                                       ; preds = %while.body, %out
  %lh_first217 = getelementptr inbounds %struct.setlist, %struct.setlist* %droplist, i32 0, i32 0
  %123 = load %struct.cpuset*, %struct.cpuset** %lh_first217, align 8
  store %struct.cpuset* %123, %struct.cpuset** %nset, align 8
  %cmp218 = icmp ne %struct.cpuset* %123, null
  br i1 %cmp218, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %124 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void @cpuset_rel_complete(%struct.cpuset* %124) #7
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %while.cond220

while.cond220:                                    ; preds = %do.end267, %while.end
  %lh_first221 = getelementptr inbounds %struct.setlist, %struct.setlist* %freelist, i32 0, i32 0
  %125 = load %struct.cpuset*, %struct.cpuset** %lh_first221, align 8
  store %struct.cpuset* %125, %struct.cpuset** %nset, align 8
  %cmp222 = icmp ne %struct.cpuset* %125, null
  br i1 %cmp222, label %while.body224, label %while.end268

while.body224:                                    ; preds = %while.cond220
  br label %do.body225

do.body225:                                       ; preds = %while.body224
  br label %do.body226

do.body226:                                       ; preds = %do.body225
  %126 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link227 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %126, i32 0, i32 5
  %le_next228 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link227, i32 0, i32 0
  %127 = load %struct.cpuset*, %struct.cpuset** %le_next228, align 8
  %cmp229 = icmp ne %struct.cpuset* %127, null
  br i1 %cmp229, label %land.lhs.true231, label %if.end241

land.lhs.true231:                                 ; preds = %do.body226
  %128 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link232 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %128, i32 0, i32 5
  %le_next233 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link232, i32 0, i32 0
  %129 = load %struct.cpuset*, %struct.cpuset** %le_next233, align 8
  %cs_link234 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %129, i32 0, i32 5
  %le_prev235 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link234, i32 0, i32 1
  %130 = load %struct.cpuset**, %struct.cpuset*** %le_prev235, align 8
  %131 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link236 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %131, i32 0, i32 5
  %le_next237 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link236, i32 0, i32 0
  %cmp238 = icmp ne %struct.cpuset** %130, %le_next237
  br i1 %cmp238, label %if.then240, label %if.end241

if.then240:                                       ; preds = %land.lhs.true231
  %132 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %132) #8
  unreachable

if.end241:                                        ; preds = %land.lhs.true231, %do.body226
  br label %do.end242

do.end242:                                        ; preds = %if.end241
  br label %do.body243

do.body243:                                       ; preds = %do.end242
  %133 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link244 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %133, i32 0, i32 5
  %le_prev245 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link244, i32 0, i32 1
  %134 = load %struct.cpuset**, %struct.cpuset*** %le_prev245, align 8
  %135 = load %struct.cpuset*, %struct.cpuset** %134, align 8
  %136 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cmp246 = icmp ne %struct.cpuset* %135, %136
  br i1 %cmp246, label %if.then248, label %if.end249

if.then248:                                       ; preds = %do.body243
  %137 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %137) #8
  unreachable

if.end249:                                        ; preds = %do.body243
  br label %do.end250

do.end250:                                        ; preds = %if.end249
  %138 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link251 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %138, i32 0, i32 5
  %le_next252 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link251, i32 0, i32 0
  %139 = load %struct.cpuset*, %struct.cpuset** %le_next252, align 8
  %cmp253 = icmp ne %struct.cpuset* %139, null
  br i1 %cmp253, label %if.then255, label %if.end262

if.then255:                                       ; preds = %do.end250
  %140 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link256 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %140, i32 0, i32 5
  %le_prev257 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link256, i32 0, i32 1
  %141 = load %struct.cpuset**, %struct.cpuset*** %le_prev257, align 8
  %142 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link258 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %142, i32 0, i32 5
  %le_next259 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link258, i32 0, i32 0
  %143 = load %struct.cpuset*, %struct.cpuset** %le_next259, align 8
  %cs_link260 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %143, i32 0, i32 5
  %le_prev261 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link260, i32 0, i32 1
  store %struct.cpuset** %141, %struct.cpuset*** %le_prev261, align 8
  br label %if.end262

if.end262:                                        ; preds = %if.then255, %do.end250
  %144 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link263 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %144, i32 0, i32 5
  %le_next264 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link263, i32 0, i32 0
  %145 = load %struct.cpuset*, %struct.cpuset** %le_next264, align 8
  %146 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_link265 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %146, i32 0, i32 5
  %le_prev266 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link265, i32 0, i32 1
  %147 = load %struct.cpuset**, %struct.cpuset*** %le_prev266, align 8
  store %struct.cpuset* %145, %struct.cpuset** %147, align 8
  br label %do.end267

do.end267:                                        ; preds = %if.end262
  %148 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %149 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %150 = bitcast %struct.cpuset* %149 to i8*
  call void @uma_zfree(%struct.uma_zone* %148, i8* %150) #7
  br label %while.cond220

while.end268:                                     ; preds = %while.cond220
  %151 = load i32, i32* %error, align 4
  ret i32 %151
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_cpuset(%struct.thread* %td, %struct.cpuset_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.cpuset_args*, align 8
  %root = alloca %struct.cpuset*, align 8
  %set = alloca %struct.cpuset*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.cpuset_args* %uap, %struct.cpuset_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  call void @thread_lock_flags_(%struct.thread* %0, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 863) #7
  %1 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %1, i32 0, i32 7
  %2 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  %call = call %struct.cpuset* @cpuset_refroot(%struct.cpuset* %2) #7
  store %struct.cpuset* %call, %struct.cpuset** %root, align 8
  %3 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %3, i32 0, i32 0
  %4 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %4, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 865) #7
  %5 = load %struct.cpuset*, %struct.cpuset** %root, align 8
  %6 = load %struct.cpuset*, %struct.cpuset** %root, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %6, i32 0, i32 0
  %call1 = call i32 @cpuset_create(%struct.cpuset** %set, %struct.cpuset* %5, %struct._cpuset* %cs_mask) #7
  store i32 %call1, i32* %error, align 4
  %7 = load %struct.cpuset*, %struct.cpuset** %root, align 8
  call void @cpuset_rel(%struct.cpuset* %7) #7
  %8 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %error, align 4
  store i32 %9, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %10 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %10, i32 0, i32 3
  %11 = bitcast i32* %cs_id to i8*
  %12 = load %struct.cpuset_args*, %struct.cpuset_args** %uap.addr, align 8
  %setid = getelementptr inbounds %struct.cpuset_args, %struct.cpuset_args* %12, i32 0, i32 1
  %13 = load i32*, i32** %setid, align 8
  %14 = bitcast i32* %13 to i8*
  %call2 = call i32 @copyout(i8* %11, i8* %14, i64 4) #7
  store i32 %call2, i32* %error, align 4
  %15 = load i32, i32* %error, align 4
  %cmp = icmp eq i32 %15, 0
  br i1 %cmp, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %16 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call4 = call i32 @cpuset_setproc(i32 -1, %struct.cpuset* %16, %struct._cpuset* null) #7
  store i32 %call4, i32* %error, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %17 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %17) #7
  %18 = load i32, i32* %error, align 4
  store i32 %18, i32* %retval
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %19 = load i32, i32* %retval
  ret i32 %19
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal %struct.cpuset* @cpuset_refroot(%struct.cpuset* %set) #0 {
entry:
  %set.addr = alloca %struct.cpuset*, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 4
  %1 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  %cmp = icmp ne %struct.cpuset* %1, null
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %2, i32 0, i32 2
  %3 = load i32, i32* %cs_flags, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent1 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %4, i32 0, i32 4
  %5 = load %struct.cpuset*, %struct.cpuset** %cs_parent1, align 8
  store %struct.cpuset* %5, %struct.cpuset** %set.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %6 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %call = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %6) #7
  %7 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  ret %struct.cpuset* %7
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @copyout(i8*, i8*, i64) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_cpuset_setid(%struct.thread* %td, %struct.cpuset_setid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.cpuset_setid_args*, align 8
  %set = alloca %struct.cpuset*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.cpuset_setid_args* %uap, %struct.cpuset_setid_args** %uap.addr, align 8
  %0 = load %struct.cpuset_setid_args*, %struct.cpuset_setid_args** %uap.addr, align 8
  %which = getelementptr inbounds %struct.cpuset_setid_args, %struct.cpuset_setid_args* %0, i32 0, i32 1
  %1 = load i32, i32* %which, align 4
  %cmp = icmp ne i32 %1, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 22, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.cpuset_setid_args*, %struct.cpuset_setid_args** %uap.addr, align 8
  %setid = getelementptr inbounds %struct.cpuset_setid_args, %struct.cpuset_setid_args* %2, i32 0, i32 7
  %3 = load i32, i32* %setid, align 4
  %4 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call %struct.cpuset* @cpuset_lookup(i32 %3, %struct.thread* %4) #7
  store %struct.cpuset* %call, %struct.cpuset** %set, align 8
  %5 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cmp1 = icmp eq %struct.cpuset* %5, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 3, i32* %retval
  br label %return

if.end3:                                          ; preds = %if.end
  %6 = load %struct.cpuset_setid_args*, %struct.cpuset_setid_args** %uap.addr, align 8
  %id = getelementptr inbounds %struct.cpuset_setid_args, %struct.cpuset_setid_args* %6, i32 0, i32 4
  %7 = load i64, i64* %id, align 8
  %conv = trunc i64 %7 to i32
  %8 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call4 = call i32 @cpuset_setproc(i32 %conv, %struct.cpuset* %8, %struct._cpuset* null) #7
  store i32 %call4, i32* %error, align 4
  %9 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %9) #7
  %10 = load i32, i32* %error, align 4
  store i32 %10, i32* %retval
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %11 = load i32, i32* %retval
  ret i32 %11
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal %struct.cpuset* @cpuset_lookup(i32 %setid, %struct.thread* %td) #0 {
entry:
  %retval = alloca %struct.cpuset*, align 8
  %setid.addr = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %set = alloca %struct.cpuset*, align 8
  %jset = alloca %struct.cpuset*, align 8
  %tset = alloca %struct.cpuset*, align 8
  store i32 %setid, i32* %setid.addr, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  %0 = load i32, i32* %setid.addr, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.cpuset* null, %struct.cpuset** %retval
  br label %return

if.end:                                           ; preds = %entry
  call void @__mtx_lock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 225) #7
  %1 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  store %struct.cpuset* %1, %struct.cpuset** %set, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %tobool = icmp ne %struct.cpuset* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %3, i32 0, i32 3
  %4 = load i32, i32* %cs_id, align 4
  %5 = load i32, i32* %setid.addr, align 4
  %cmp1 = icmp eq i32 %4, %5
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %for.body
  br label %for.end

if.end3:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end3
  %6 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %6, i32 0, i32 5
  %le_next = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 0
  %7 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  store %struct.cpuset* %7, %struct.cpuset** %set, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then2, %for.cond
  %8 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %tobool4 = icmp ne %struct.cpuset* %8, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %for.end
  %9 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %9) #7
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %for.end
  call void @__mtx_unlock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 231) #7
  br label %do.body

do.body:                                          ; preds = %if.end6
  %10 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %cmp7 = icmp ne %struct.thread* %10, null
  %lnot = xor i1 %cmp7, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool8 = icmp ne i64 %expval, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__func__.cpuset_lookup, i32 0, i32 0), i32 233) #7
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %11 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cmp11 = icmp ne %struct.cpuset* %11, null
  br i1 %cmp11, label %land.lhs.true, label %if.end31

land.lhs.true:                                    ; preds = %do.end
  %12 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %12, i32 0, i32 37
  %13 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %call13 = call i32 @jailed(%struct.ucred* %13) #7
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then15, label %if.end31

if.then15:                                        ; preds = %land.lhs.true
  %14 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred16 = getelementptr inbounds %struct.thread, %struct.thread* %14, i32 0, i32 37
  %15 = load %struct.ucred*, %struct.ucred** %td_ucred16, align 8
  %cr_prison = getelementptr inbounds %struct.ucred, %struct.ucred* %15, i32 0, i32 9
  %16 = load %struct.prison*, %struct.prison** %cr_prison, align 8
  %pr_cpuset = getelementptr inbounds %struct.prison, %struct.prison* %16, i32 0, i32 11
  %17 = load %struct.cpuset*, %struct.cpuset** %pr_cpuset, align 8
  store %struct.cpuset* %17, %struct.cpuset** %jset, align 8
  %18 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  store %struct.cpuset* %18, %struct.cpuset** %tset, align 8
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc25, %if.then15
  %19 = load %struct.cpuset*, %struct.cpuset** %tset, align 8
  %cmp18 = icmp ne %struct.cpuset* %19, null
  br i1 %cmp18, label %for.body20, label %for.end26

for.body20:                                       ; preds = %for.cond17
  %20 = load %struct.cpuset*, %struct.cpuset** %tset, align 8
  %21 = load %struct.cpuset*, %struct.cpuset** %jset, align 8
  %cmp21 = icmp eq %struct.cpuset* %20, %21
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %for.body20
  br label %for.end26

if.end24:                                         ; preds = %for.body20
  br label %for.inc25

for.inc25:                                        ; preds = %if.end24
  %22 = load %struct.cpuset*, %struct.cpuset** %tset, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %22, i32 0, i32 4
  %23 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  store %struct.cpuset* %23, %struct.cpuset** %tset, align 8
  br label %for.cond17

for.end26:                                        ; preds = %if.then23, %for.cond17
  %24 = load %struct.cpuset*, %struct.cpuset** %tset, align 8
  %cmp27 = icmp eq %struct.cpuset* %24, null
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %for.end26
  %25 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %25) #7
  store %struct.cpuset* null, %struct.cpuset** %set, align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %for.end26
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %land.lhs.true, %do.end
  %26 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  store %struct.cpuset* %26, %struct.cpuset** %retval
  br label %return

return:                                           ; preds = %if.end31, %if.then
  %27 = load %struct.cpuset*, %struct.cpuset** %retval
  ret %struct.cpuset* %27
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_cpuset_getid(%struct.thread* %td, %struct.cpuset_getid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.cpuset_getid_args*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %set = alloca %struct.cpuset*, align 8
  %ttd = alloca %struct.thread*, align 8
  %p = alloca %struct.proc*, align 8
  %id = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.cpuset_getid_args* %uap, %struct.cpuset_getid_args** %uap.addr, align 8
  %0 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %level = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %0, i32 0, i32 1
  %1 = load i32, i32* %level, align 4
  %cmp = icmp eq i32 %1, 3
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %which = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %2, i32 0, i32 4
  %3 = load i32, i32* %which, align 4
  %cmp1 = icmp ne i32 %3, 3
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 22, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %4 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %which2 = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %4, i32 0, i32 4
  %5 = load i32, i32* %which2, align 4
  %6 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %id3 = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %6, i32 0, i32 7
  %7 = load i64, i64* %id3, align 8
  %call = call i32 @cpuset_which(i32 %5, i64 %7, %struct.proc** %p, %struct.thread** %ttd, %struct.cpuset** %set) #7
  store i32 %call, i32* %error, align 4
  %8 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %9 = load i32, i32* %error, align 4
  store i32 %9, i32* %retval
  br label %return

if.end5:                                          ; preds = %if.end
  %10 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %which6 = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %10, i32 0, i32 4
  %11 = load i32, i32* %which6, align 4
  switch i32 %11, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb9
    i32 5, label %sw.bb9
    i32 4, label %sw.bb10
  ]

sw.bb:                                            ; preds = %if.end5, %if.end5
  %12 = load %struct.thread*, %struct.thread** %ttd, align 8
  call void @thread_lock_flags_(%struct.thread* %12, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 929) #7
  %13 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %13, i32 0, i32 7
  %14 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  %call7 = call %struct.cpuset* @cpuset_refbase(%struct.cpuset* %14) #7
  store %struct.cpuset* %call7, %struct.cpuset** %set, align 8
  %15 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %15, i32 0, i32 0
  %16 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %16, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 931) #7
  %17 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %17, i32 0, i32 18
  %mtx_lock8 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock8, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 932) #7
  br label %sw.epilog

sw.bb9:                                           ; preds = %if.end5, %if.end5
  br label %sw.epilog

sw.bb10:                                          ; preds = %if.end5
  store i32 22, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %sw.bb9, %sw.bb, %if.end5
  %18 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %level11 = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %18, i32 0, i32 1
  %19 = load i32, i32* %level11, align 4
  switch i32 %19, label %sw.epilog16 [
    i32 1, label %sw.bb12
    i32 2, label %sw.bb14
    i32 3, label %sw.bb15
  ]

sw.bb12:                                          ; preds = %sw.epilog
  %20 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call13 = call %struct.cpuset* @cpuset_refroot(%struct.cpuset* %20) #7
  store %struct.cpuset* %call13, %struct.cpuset** %nset, align 8
  %21 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %21) #7
  %22 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  store %struct.cpuset* %22, %struct.cpuset** %set, align 8
  br label %sw.epilog16

sw.bb14:                                          ; preds = %sw.epilog
  br label %sw.epilog16

sw.bb15:                                          ; preds = %sw.epilog
  br label %sw.epilog16

sw.epilog16:                                      ; preds = %sw.bb15, %sw.bb14, %sw.bb12, %sw.epilog
  %23 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %23, i32 0, i32 3
  %24 = load i32, i32* %cs_id, align 4
  store i32 %24, i32* %id, align 4
  %25 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %25) #7
  %26 = load i32, i32* %error, align 4
  %cmp17 = icmp eq i32 %26, 0
  br i1 %cmp17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %sw.epilog16
  %27 = bitcast i32* %id to i8*
  %28 = load %struct.cpuset_getid_args*, %struct.cpuset_getid_args** %uap.addr, align 8
  %setid = getelementptr inbounds %struct.cpuset_getid_args, %struct.cpuset_getid_args* %28, i32 0, i32 10
  %29 = load i32*, i32** %setid, align 8
  %30 = bitcast i32* %29 to i8*
  %call19 = call i32 @copyout(i8* %27, i8* %30, i64 4) #7
  store i32 %call19, i32* %error, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %sw.epilog16
  %31 = load i32, i32* %error, align 4
  store i32 %31, i32* %retval
  br label %return

return:                                           ; preds = %if.end20, %sw.bb10, %if.then4, %if.then
  %32 = load i32, i32* %retval
  ret i32 %32
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal %struct.cpuset* @cpuset_refbase(%struct.cpuset* %set) #0 {
entry:
  %set.addr = alloca %struct.cpuset*, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 3
  %1 = load i32, i32* %cs_id, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %2, i32 0, i32 4
  %3 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  store %struct.cpuset* %3, %struct.cpuset** %set.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %call = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %4) #7
  %5 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  ret %struct.cpuset* %5
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_cpuset_getaffinity(%struct.thread* %td, %struct.cpuset_getaffinity_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.cpuset_getaffinity_args*, align 8
  %ttd = alloca %struct.thread*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %set = alloca %struct.cpuset*, align 8
  %p = alloca %struct.proc*, align 8
  %mask = alloca %struct._cpuset*, align 8
  %error = alloca i32, align 4
  %size = alloca i64, align 8
  %__i = alloca i64, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.cpuset_getaffinity_args* %uap, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %0 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %cpusetsize = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %0, i32 0, i32 10
  %1 = load i64, i64* %cpusetsize, align 8
  %cmp = icmp ult i64 %1, 8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %cpusetsize1 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %2, i32 0, i32 10
  %3 = load i64, i64* %cpusetsize1, align 8
  %cmp2 = icmp ugt i64 %3, 16
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 34, i32* %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %cpusetsize3 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %4, i32 0, i32 10
  %5 = load i64, i64* %cpusetsize3, align 8
  store i64 %5, i64* %size, align 8
  %6 = load i64, i64* %size, align 8
  %call = call noalias i8* @malloc(i64 %6, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0), i32 258) #7
  %7 = bitcast i8* %call to %struct._cpuset*
  store %struct._cpuset* %7, %struct._cpuset** %mask, align 8
  %8 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %which = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %8, i32 0, i32 4
  %9 = load i32, i32* %which, align 4
  %10 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %id = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %10, i32 0, i32 7
  %11 = load i64, i64* %id, align 8
  %call4 = call i32 @cpuset_which(i32 %9, i64 %11, %struct.proc** %p, %struct.thread** %ttd, %struct.cpuset** %set) #7
  store i32 %call4, i32* %error, align 4
  %12 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  br label %out

if.end6:                                          ; preds = %if.end
  %13 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %level = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %13, i32 0, i32 1
  %14 = load i32, i32* %level, align 4
  switch i32 %14, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb18
  ]

sw.bb:                                            ; preds = %if.end6, %if.end6
  %15 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %which7 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %15, i32 0, i32 4
  %16 = load i32, i32* %which7, align 4
  switch i32 %16, label %sw.epilog [
    i32 1, label %sw.bb8
    i32 2, label %sw.bb8
    i32 3, label %sw.bb10
    i32 5, label %sw.bb10
    i32 4, label %sw.bb11
  ]

sw.bb8:                                           ; preds = %sw.bb, %sw.bb
  %17 = load %struct.thread*, %struct.thread** %ttd, align 8
  call void @thread_lock_flags_(%struct.thread* %17, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 993) #7
  %18 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %18, i32 0, i32 7
  %19 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  %call9 = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %19) #7
  store %struct.cpuset* %call9, %struct.cpuset** %set, align 8
  %20 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %20, i32 0, i32 0
  %21 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %21, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 995) #7
  br label %sw.epilog

sw.bb10:                                          ; preds = %sw.bb, %sw.bb
  br label %sw.epilog

sw.bb11:                                          ; preds = %sw.bb
  store i32 22, i32* %error, align 4
  br label %out

sw.epilog:                                        ; preds = %sw.bb10, %sw.bb8, %sw.bb
  %22 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %level12 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %22, i32 0, i32 1
  %23 = load i32, i32* %level12, align 4
  %cmp13 = icmp eq i32 %23, 1
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %sw.epilog
  %24 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call15 = call %struct.cpuset* @cpuset_refroot(%struct.cpuset* %24) #7
  store %struct.cpuset* %call15, %struct.cpuset** %nset, align 8
  br label %if.end17

if.else:                                          ; preds = %sw.epilog
  %25 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call16 = call %struct.cpuset* @cpuset_refbase(%struct.cpuset* %25) #7
  store %struct.cpuset* %call16, %struct.cpuset** %nset, align 8
  br label %if.end17

if.end17:                                         ; preds = %if.else, %if.then14
  %26 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %27 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %27, i32 0, i32 0
  %28 = bitcast %struct._cpuset* %26 to i8*
  %29 = bitcast %struct._cpuset* %cs_mask to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 8, i32 8, i1 false)
  %30 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void @cpuset_rel(%struct.cpuset* %30) #7
  br label %sw.epilog44

sw.bb18:                                          ; preds = %if.end6
  %31 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %which19 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %31, i32 0, i32 4
  %32 = load i32, i32* %which19, align 4
  switch i32 %32, label %sw.epilog43 [
    i32 1, label %sw.bb20
    i32 2, label %sw.bb25
    i32 3, label %sw.bb38
    i32 5, label %sw.bb38
    i32 4, label %sw.bb40
  ]

sw.bb20:                                          ; preds = %sw.bb18
  %33 = load %struct.thread*, %struct.thread** %ttd, align 8
  call void @thread_lock_flags_(%struct.thread* %33, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1014) #7
  %34 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %35 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_cpuset21 = getelementptr inbounds %struct.thread, %struct.thread* %35, i32 0, i32 7
  %36 = load %struct.cpuset*, %struct.cpuset** %td_cpuset21, align 8
  %cs_mask22 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %36, i32 0, i32 0
  %37 = bitcast %struct._cpuset* %34 to i8*
  %38 = bitcast %struct._cpuset* %cs_mask22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 8, i32 8, i1 false)
  %39 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_lock23 = getelementptr inbounds %struct.thread, %struct.thread* %39, i32 0, i32 0
  %40 = load volatile %struct.mtx*, %struct.mtx** %td_lock23, align 8
  %mtx_lock24 = getelementptr inbounds %struct.mtx, %struct.mtx* %40, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock24, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1016) #7
  br label %sw.epilog43

sw.bb25:                                          ; preds = %sw.bb18
  %41 = load %struct.proc*, %struct.proc** %p, align 8
  %p_threads = getelementptr inbounds %struct.proc, %struct.proc* %41, i32 0, i32 1
  %tqh_first = getelementptr inbounds %struct.anon.1, %struct.anon.1* %p_threads, i32 0, i32 0
  %42 = load %struct.thread*, %struct.thread** %tqh_first, align 8
  store %struct.thread* %42, %struct.thread** %ttd, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc36, %sw.bb25
  %43 = load %struct.thread*, %struct.thread** %ttd, align 8
  %tobool26 = icmp ne %struct.thread* %43, null
  br i1 %tobool26, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  %44 = load %struct.thread*, %struct.thread** %ttd, align 8
  call void @thread_lock_flags_(%struct.thread* %44, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1020) #7
  br label %do.body

do.body:                                          ; preds = %for.body
  store i64 0, i64* %__i, align 8
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc, %do.body
  %45 = load i64, i64* %__i, align 8
  %cmp28 = icmp ult i64 %45, 1
  br i1 %cmp28, label %for.body29, label %for.end

for.body29:                                       ; preds = %for.cond27
  %46 = load i64, i64* %__i, align 8
  %47 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_cpuset30 = getelementptr inbounds %struct.thread, %struct.thread* %47, i32 0, i32 7
  %48 = load %struct.cpuset*, %struct.cpuset** %td_cpuset30, align 8
  %cs_mask31 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %48, i32 0, i32 0
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask31, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %46
  %49 = load i64, i64* %arrayidx, align 8
  %50 = load i64, i64* %__i, align 8
  %51 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %__bits32 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %51, i32 0, i32 0
  %arrayidx33 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits32, i32 0, i64 %50
  %52 = load i64, i64* %arrayidx33, align 8
  %or = or i64 %52, %49
  store i64 %or, i64* %arrayidx33, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body29
  %53 = load i64, i64* %__i, align 8
  %inc = add i64 %53, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond27

for.end:                                          ; preds = %for.cond27
  br label %do.end

do.end:                                           ; preds = %for.end
  %54 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_lock34 = getelementptr inbounds %struct.thread, %struct.thread* %54, i32 0, i32 0
  %55 = load volatile %struct.mtx*, %struct.mtx** %td_lock34, align 8
  %mtx_lock35 = getelementptr inbounds %struct.mtx, %struct.mtx* %55, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock35, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1022) #7
  br label %for.inc36

for.inc36:                                        ; preds = %do.end
  %56 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_plist = getelementptr inbounds %struct.thread, %struct.thread* %56, i32 0, i32 2
  %tqe_next = getelementptr inbounds %struct.anon.35, %struct.anon.35* %td_plist, i32 0, i32 0
  %57 = load %struct.thread*, %struct.thread** %tqe_next, align 8
  store %struct.thread* %57, %struct.thread** %ttd, align 8
  br label %for.cond

for.end37:                                        ; preds = %for.cond
  br label %sw.epilog43

sw.bb38:                                          ; preds = %sw.bb18, %sw.bb18
  %58 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %59 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_mask39 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %59, i32 0, i32 0
  %60 = bitcast %struct._cpuset* %58 to i8*
  %61 = bitcast %struct._cpuset* %cs_mask39 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %60, i8* %61, i64 8, i32 8, i1 false)
  br label %sw.epilog43

sw.bb40:                                          ; preds = %sw.bb18
  %62 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %id41 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %62, i32 0, i32 7
  %63 = load i64, i64* %id41, align 8
  %conv = trunc i64 %63 to i32
  %64 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %65 = bitcast %struct._cpuset* %64 to i8*
  %call42 = call i32 @intr_getaffinity(i32 %conv, i8* %65) #7
  store i32 %call42, i32* %error, align 4
  br label %sw.epilog43

sw.epilog43:                                      ; preds = %sw.bb40, %sw.bb38, %for.end37, %sw.bb20, %sw.bb18
  br label %sw.epilog44

sw.default:                                       ; preds = %if.end6
  store i32 22, i32* %error, align 4
  br label %sw.epilog44

sw.epilog44:                                      ; preds = %sw.default, %sw.epilog43, %if.end17
  %66 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %tobool45 = icmp ne %struct.cpuset* %66, null
  br i1 %tobool45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %sw.epilog44
  %67 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %67) #7
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %sw.epilog44
  %68 = load %struct.proc*, %struct.proc** %p, align 8
  %tobool48 = icmp ne %struct.proc* %68, null
  br i1 %tobool48, label %if.then49, label %if.end51

if.then49:                                        ; preds = %if.end47
  %69 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %69, i32 0, i32 18
  %mtx_lock50 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock50, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1041) #7
  br label %if.end51

if.end51:                                         ; preds = %if.then49, %if.end47
  %70 = load i32, i32* %error, align 4
  %cmp52 = icmp eq i32 %70, 0
  br i1 %cmp52, label %if.then54, label %if.end57

if.then54:                                        ; preds = %if.end51
  %71 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %72 = bitcast %struct._cpuset* %71 to i8*
  %73 = load %struct.cpuset_getaffinity_args*, %struct.cpuset_getaffinity_args** %uap.addr, align 8
  %mask55 = getelementptr inbounds %struct.cpuset_getaffinity_args, %struct.cpuset_getaffinity_args* %73, i32 0, i32 13
  %74 = load %struct._cpuset*, %struct._cpuset** %mask55, align 8
  %75 = bitcast %struct._cpuset* %74 to i8*
  %76 = load i64, i64* %size, align 8
  %call56 = call i32 @copyout(i8* %72, i8* %75, i64 %76) #7
  store i32 %call56, i32* %error, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then54, %if.end51
  br label %out

out:                                              ; preds = %if.end57, %sw.bb11, %if.then5
  %77 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %78 = bitcast %struct._cpuset* %77 to i8*
  call void @free(i8* %78, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0)) #7
  %79 = load i32, i32* %error, align 4
  store i32 %79, i32* %retval
  br label %return

return:                                           ; preds = %out, %if.then
  %80 = load i32, i32* %retval
  ret i32 %80
}

; Function Attrs: noimplicitfloat noredzone
declare noalias i8* @malloc(i64, %struct.malloc_type*, i32) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: noimplicitfloat noredzone
declare i32 @intr_getaffinity(i32, i8*) #2

; Function Attrs: noimplicitfloat noredzone
declare void @free(i8*, %struct.malloc_type*) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_cpuset_setaffinity(%struct.thread* %td, %struct.cpuset_setaffinity_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.cpuset_setaffinity_args*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %set = alloca %struct.cpuset*, align 8
  %ttd = alloca %struct.thread*, align 8
  %p = alloca %struct.proc*, align 8
  %mask = alloca %struct._cpuset*, align 8
  %error = alloca i32, align 4
  %end = alloca i8*, align 8
  %cp = alloca i8*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.cpuset_setaffinity_args* %uap, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %0 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %cpusetsize = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %0, i32 0, i32 10
  %1 = load i64, i64* %cpusetsize, align 8
  %cmp = icmp ult i64 %1, 8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %cpusetsize1 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %2, i32 0, i32 10
  %3 = load i64, i64* %cpusetsize1, align 8
  %cmp2 = icmp ugt i64 %3, 16
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 34, i32* %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %cpusetsize3 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %4, i32 0, i32 10
  %5 = load i64, i64* %cpusetsize3, align 8
  %call = call noalias i8* @malloc(i64 %5, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0), i32 258) #7
  %6 = bitcast i8* %call to %struct._cpuset*
  store %struct._cpuset* %6, %struct._cpuset** %mask, align 8
  %7 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %mask4 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %7, i32 0, i32 13
  %8 = load %struct._cpuset*, %struct._cpuset** %mask4, align 8
  %9 = bitcast %struct._cpuset* %8 to i8*
  %10 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %11 = bitcast %struct._cpuset* %10 to i8*
  %12 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %cpusetsize5 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %12, i32 0, i32 10
  %13 = load i64, i64* %cpusetsize5, align 8
  %call6 = call i32 @copyin(i8* %9, i8* %11, i64 %13) #7
  store i32 %call6, i32* %error, align 4
  %14 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %14, 0
  br i1 %tobool, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  br label %out

if.end8:                                          ; preds = %if.end
  %15 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %cpusetsize9 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %15, i32 0, i32 10
  %16 = load i64, i64* %cpusetsize9, align 8
  %cmp10 = icmp ugt i64 %16, 8
  br i1 %cmp10, label %if.then11, label %if.end19

if.then11:                                        ; preds = %if.end8
  %17 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %17, i32 0, i32 0
  %18 = bitcast [1 x i64]* %__bits to i8*
  store i8* %18, i8** %cp, align 8
  store i8* %18, i8** %end, align 8
  %19 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %cpusetsize12 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %19, i32 0, i32 10
  %20 = load i64, i64* %cpusetsize12, align 8
  %21 = load i8*, i8** %end, align 8
  %add.ptr = getelementptr inbounds i8, i8* %21, i64 %20
  store i8* %add.ptr, i8** %end, align 8
  %22 = load i8*, i8** %cp, align 8
  %add.ptr13 = getelementptr inbounds i8, i8* %22, i64 8
  store i8* %add.ptr13, i8** %cp, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end18, %if.then11
  %23 = load i8*, i8** %cp, align 8
  %24 = load i8*, i8** %end, align 8
  %cmp14 = icmp ne i8* %23, %24
  br i1 %cmp14, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %25 = load i8*, i8** %cp, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr, i8** %cp, align 8
  %26 = load i8, i8* %25, align 1
  %conv = sext i8 %26 to i32
  %cmp15 = icmp ne i32 %conv, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %while.body
  store i32 22, i32* %error, align 4
  br label %out

if.end18:                                         ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end19

if.end19:                                         ; preds = %while.end, %if.end8
  %27 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %level = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %27, i32 0, i32 1
  %28 = load i32, i32* %level, align 4
  switch i32 %28, label %sw.default62 [
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 3, label %sw.bb38
  ]

sw.bb:                                            ; preds = %if.end19, %if.end19
  %29 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %which = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %29, i32 0, i32 4
  %30 = load i32, i32* %which, align 4
  %31 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %id = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %31, i32 0, i32 7
  %32 = load i64, i64* %id, align 8
  %call20 = call i32 @cpuset_which(i32 %30, i64 %32, %struct.proc** %p, %struct.thread** %ttd, %struct.cpuset** %set) #7
  store i32 %call20, i32* %error, align 4
  %33 = load i32, i32* %error, align 4
  %tobool21 = icmp ne i32 %33, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %sw.bb
  br label %sw.epilog63

if.end23:                                         ; preds = %sw.bb
  %34 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %which24 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %34, i32 0, i32 4
  %35 = load i32, i32* %which24, align 4
  switch i32 %35, label %sw.epilog [
    i32 1, label %sw.bb25
    i32 2, label %sw.bb25
    i32 3, label %sw.bb28
    i32 5, label %sw.bb28
    i32 4, label %sw.bb29
  ]

sw.bb25:                                          ; preds = %if.end23, %if.end23
  %36 = load %struct.thread*, %struct.thread** %ttd, align 8
  call void @thread_lock_flags_(%struct.thread* %36, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1101) #7
  %37 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_cpuset = getelementptr inbounds %struct.thread, %struct.thread* %37, i32 0, i32 7
  %38 = load %struct.cpuset*, %struct.cpuset** %td_cpuset, align 8
  %call26 = call %struct.cpuset* @cpuset_ref(%struct.cpuset* %38) #7
  store %struct.cpuset* %call26, %struct.cpuset** %set, align 8
  %39 = load %struct.thread*, %struct.thread** %ttd, align 8
  %td_lock = getelementptr inbounds %struct.thread, %struct.thread* %39, i32 0, i32 0
  %40 = load volatile %struct.mtx*, %struct.mtx** %td_lock, align 8
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %40, i32 0, i32 1
  call void @__mtx_unlock_spin_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1103) #7
  %41 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %41, i32 0, i32 18
  %mtx_lock27 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock27, i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 1104) #7
  br label %sw.epilog

sw.bb28:                                          ; preds = %if.end23, %if.end23
  br label %sw.epilog

sw.bb29:                                          ; preds = %if.end23
  store i32 22, i32* %error, align 4
  br label %out

sw.epilog:                                        ; preds = %sw.bb28, %sw.bb25, %if.end23
  %42 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %level30 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %42, i32 0, i32 1
  %43 = load i32, i32* %level30, align 4
  %cmp31 = icmp eq i32 %43, 1
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %sw.epilog
  %44 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call34 = call %struct.cpuset* @cpuset_refroot(%struct.cpuset* %44) #7
  store %struct.cpuset* %call34, %struct.cpuset** %nset, align 8
  br label %if.end36

if.else:                                          ; preds = %sw.epilog
  %45 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %call35 = call %struct.cpuset* @cpuset_refbase(%struct.cpuset* %45) #7
  store %struct.cpuset* %call35, %struct.cpuset** %nset, align 8
  br label %if.end36

if.end36:                                         ; preds = %if.else, %if.then33
  %46 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %47 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %call37 = call i32 @cpuset_modify(%struct.cpuset* %46, %struct._cpuset* %47) #7
  store i32 %call37, i32* %error, align 4
  %48 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  call void @cpuset_rel(%struct.cpuset* %48) #7
  %49 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %49) #7
  br label %sw.epilog63

sw.bb38:                                          ; preds = %if.end19
  %50 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %which39 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %50, i32 0, i32 4
  %51 = load i32, i32* %which39, align 4
  switch i32 %51, label %sw.default [
    i32 1, label %sw.bb40
    i32 2, label %sw.bb44
    i32 3, label %sw.bb48
    i32 5, label %sw.bb48
    i32 4, label %sw.bb57
  ]

sw.bb40:                                          ; preds = %sw.bb38
  %52 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %id41 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %52, i32 0, i32 7
  %53 = load i64, i64* %id41, align 8
  %conv42 = trunc i64 %53 to i32
  %54 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %call43 = call i32 @cpuset_setthread(i32 %conv42, %struct._cpuset* %54) #7
  store i32 %call43, i32* %error, align 4
  br label %sw.epilog61

sw.bb44:                                          ; preds = %sw.bb38
  %55 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %id45 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %55, i32 0, i32 7
  %56 = load i64, i64* %id45, align 8
  %conv46 = trunc i64 %56 to i32
  %57 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %call47 = call i32 @cpuset_setproc(i32 %conv46, %struct.cpuset* null, %struct._cpuset* %57) #7
  store i32 %call47, i32* %error, align 4
  br label %sw.epilog61

sw.bb48:                                          ; preds = %sw.bb38, %sw.bb38
  %58 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %which49 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %58, i32 0, i32 4
  %59 = load i32, i32* %which49, align 4
  %60 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %id50 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %60, i32 0, i32 7
  %61 = load i64, i64* %id50, align 8
  %call51 = call i32 @cpuset_which(i32 %59, i64 %61, %struct.proc** %p, %struct.thread** %ttd, %struct.cpuset** %set) #7
  store i32 %call51, i32* %error, align 4
  %62 = load i32, i32* %error, align 4
  %cmp52 = icmp eq i32 %62, 0
  br i1 %cmp52, label %if.then54, label %if.end56

if.then54:                                        ; preds = %sw.bb48
  %63 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %64 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %call55 = call i32 @cpuset_modify(%struct.cpuset* %63, %struct._cpuset* %64) #7
  store i32 %call55, i32* %error, align 4
  %65 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  call void @cpuset_rel(%struct.cpuset* %65) #7
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %sw.bb48
  br label %sw.epilog61

sw.bb57:                                          ; preds = %sw.bb38
  %66 = load %struct.cpuset_setaffinity_args*, %struct.cpuset_setaffinity_args** %uap.addr, align 8
  %id58 = getelementptr inbounds %struct.cpuset_setaffinity_args, %struct.cpuset_setaffinity_args* %66, i32 0, i32 7
  %67 = load i64, i64* %id58, align 8
  %conv59 = trunc i64 %67 to i32
  %68 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %69 = bitcast %struct._cpuset* %68 to i8*
  %call60 = call i32 @intr_setaffinity(i32 %conv59, i8* %69) #7
  store i32 %call60, i32* %error, align 4
  br label %sw.epilog61

sw.default:                                       ; preds = %sw.bb38
  store i32 22, i32* %error, align 4
  br label %sw.epilog61

sw.epilog61:                                      ; preds = %sw.default, %sw.bb57, %if.end56, %sw.bb44, %sw.bb40
  br label %sw.epilog63

sw.default62:                                     ; preds = %if.end19
  store i32 22, i32* %error, align 4
  br label %sw.epilog63

sw.epilog63:                                      ; preds = %sw.default62, %sw.epilog61, %if.end36, %if.then22
  br label %out

out:                                              ; preds = %sw.epilog63, %sw.bb29, %if.then17, %if.then7
  %70 = load %struct._cpuset*, %struct._cpuset** %mask, align 8
  %71 = bitcast %struct._cpuset* %70 to i8*
  call void @free(i8* %71, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0)) #7
  %72 = load i32, i32* %error, align 4
  store i32 %72, i32* %retval
  br label %return

return:                                           ; preds = %out, %if.then
  %73 = load i32, i32* %retval
  ret i32 %73
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @copyin(i8*, i8*, i64) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cpuset_modify(%struct.cpuset* %set, %struct._cpuset* %mask) #0 {
entry:
  %retval = alloca i32, align 4
  %set.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %root = alloca %struct.cpuset*, align 8
  %error = alloca i32, align 4
  %__i = alloca i64, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  %call = call %struct.thread* @__curthread() #9
  %call1 = call i32 @priv_check(%struct.thread* %call, i32 206) #7
  store i32 %call1, i32* %error, align 4
  %0 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %error, align 4
  store i32 %1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %call2 = call %struct.thread* @__curthread() #9
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %call2, i32 0, i32 37
  %2 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %call3 = call i32 @jailed(%struct.ucred* %2) #7
  %tobool4 = icmp ne i32 %call3, 0
  br i1 %tobool4, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end
  %3 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %3, i32 0, i32 2
  %4 = load i32, i32* %cs_flags, align 4
  %and = and i32 %4, 1
  %tobool5 = icmp ne i32 %and, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.end7:                                          ; preds = %land.lhs.true, %if.end
  %5 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %5, i32 0, i32 4
  %6 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  store %struct.cpuset* %6, %struct.cpuset** %root, align 8
  %7 = load %struct.cpuset*, %struct.cpuset** %root, align 8
  %tobool8 = icmp ne %struct.cpuset* %7, null
  br i1 %tobool8, label %land.lhs.true9, label %if.end20

land.lhs.true9:                                   ; preds = %if.end7
  store i64 0, i64* %__i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %land.lhs.true9
  %8 = load i64, i64* %__i, align 8
  %cmp = icmp ult i64 %8, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %__i, align 8
  %10 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %10, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %9
  %11 = load i64, i64* %arrayidx, align 8
  %12 = load i64, i64* %__i, align 8
  %13 = load %struct.cpuset*, %struct.cpuset** %root, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 0
  %__bits10 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx11 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits10, i32 0, i64 %12
  %14 = load i64, i64* %arrayidx11, align 8
  %and12 = and i64 %11, %14
  %15 = load i64, i64* %__i, align 8
  %16 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits13 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %16, i32 0, i32 0
  %arrayidx14 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits13, i32 0, i64 %15
  %17 = load i64, i64* %arrayidx14, align 8
  %cmp15 = icmp ne i64 %and12, %17
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %for.body
  br label %for.end

if.end17:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %18 = load i64, i64* %__i, align 8
  %inc = add i64 %18, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then16, %for.cond
  %19 = load i64, i64* %__i, align 8
  %cmp18 = icmp eq i64 %19, 1
  br i1 %cmp18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %for.end
  store i32 22, i32* %retval
  br label %return

if.end20:                                         ; preds = %for.end, %if.end7
  call void @__mtx_lock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 375) #7
  %20 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %21 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %call21 = call i32 @cpuset_testupdate(%struct.cpuset* %20, %struct._cpuset* %21) #7
  store i32 %call21, i32* %error, align 4
  %22 = load i32, i32* %error, align 4
  %tobool22 = icmp ne i32 %22, 0
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  br label %out

if.end24:                                         ; preds = %if.end20
  %23 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %24 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  call void @cpuset_update(%struct.cpuset* %23, %struct._cpuset* %24) #7
  %25 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask25 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %25, i32 0, i32 0
  %26 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %27 = bitcast %struct._cpuset* %cs_mask25 to i8*
  %28 = bitcast %struct._cpuset* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 8, i32 8, i1 false)
  br label %out

out:                                              ; preds = %if.end24, %if.then23
  call void @__mtx_unlock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 382) #7
  %29 = load i32, i32* %error, align 4
  store i32 %29, i32* %retval
  br label %return

return:                                           ; preds = %out, %if.then19, %if.then6, %if.then
  %30 = load i32, i32* %retval
  ret i32 %30
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @intr_setaffinity(i32, i8*) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @cpusets_show_del(i8* %arg) #0 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @db_command_unregister(%struct.command_table* @db_show_table, %struct.command* @cpusets_show) #7
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @db_command_unregister(%struct.command_table*, %struct.command*) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @db_show_cpusets(i64 %addr, i32 %have_addr, i64 %count, i8* %modif) #0 {
entry:
  %addr.addr = alloca i64, align 8
  %have_addr.addr = alloca i32, align 4
  %count.addr = alloca i64, align 8
  %modif.addr = alloca i8*, align 8
  %set = alloca %struct.cpuset*, align 8
  %cpu = alloca i32, align 4
  %once = alloca i32, align 4
  store i64 %addr, i64* %addr.addr, align 8
  store i32 %have_addr, i32* %have_addr.addr, align 4
  store i64 %count, i64* %count.addr, align 8
  store i8* %modif, i8** %modif.addr, align 8
  %0 = load %struct.cpuset*, %struct.cpuset** getelementptr inbounds (%struct.setlist, %struct.setlist* @cpuset_ids, i32 0, i32 0), align 8
  store %struct.cpuset* %0, %struct.cpuset** %set, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %1 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %tobool = icmp ne %struct.cpuset* %1, null
  br i1 %tobool, label %for.body, label %for.end20

for.body:                                         ; preds = %for.cond
  %2 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %3 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %3, i32 0, i32 3
  %4 = load i32, i32* %cs_id, align 4
  %5 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_ref = getelementptr inbounds %struct.cpuset, %struct.cpuset* %5, i32 0, i32 1
  %6 = load volatile i32, i32* %cs_ref, align 4
  %7 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %7, i32 0, i32 2
  %8 = load i32, i32* %cs_flags, align 4
  %9 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %9, i32 0, i32 4
  %10 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  %cmp = icmp ne %struct.cpuset* %10, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %11 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_parent1 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %11, i32 0, i32 4
  %12 = load %struct.cpuset*, %struct.cpuset** %cs_parent1, align 8
  %cs_id2 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %12, i32 0, i32 3
  %13 = load i32, i32* %cs_id2, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %13, %cond.true ], [ 0, %cond.false ]
  %call = call i32 (i8*, ...) @db_printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str15, i32 0, i32 0), %struct.cpuset* %2, i32 %4, i32 %6, i32 %8, i32 %cond) #7
  %call3 = call i32 (i8*, ...) @db_printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str16, i32 0, i32 0)) #7
  store i32 0, i32* %once, align 4
  store i32 0, i32* %cpu, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %cond.end
  %14 = load i32, i32* %cpu, align 4
  %cmp5 = icmp slt i32 %14, 64
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %15 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %15, i32 0, i32 0
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 0
  %16 = load i64, i64* %arrayidx, align 8
  %17 = load i32, i32* %cpu, align 4
  %conv = sext i32 %17 to i64
  %shl = shl i64 1, %conv
  %and = and i64 %16, %shl
  %cmp7 = icmp ne i64 %and, 0
  br i1 %cmp7, label %if.then, label %if.end14

if.then:                                          ; preds = %for.body6
  %18 = load i32, i32* %once, align 4
  %cmp9 = icmp eq i32 %18, 0
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.then
  %19 = load i32, i32* %cpu, align 4
  %call12 = call i32 (i8*, ...) @db_printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str17, i32 0, i32 0), i32 %19) #7
  store i32 1, i32* %once, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %20 = load i32, i32* %cpu, align 4
  %call13 = call i32 (i8*, ...) @db_printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str18, i32 0, i32 0), i32 %20) #7
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then11
  br label %if.end14

if.end14:                                         ; preds = %if.end, %for.body6
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %21 = load i32, i32* %cpu, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %cpu, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %call15 = call i32 (i8*, ...) @db_printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str19, i32 0, i32 0)) #7
  %22 = load volatile i32, i32* @db_pager_quit, align 4
  %tobool16 = icmp ne i32 %22, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %for.end
  br label %for.end20

if.end18:                                         ; preds = %for.end
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %23 = load %struct.cpuset*, %struct.cpuset** %set, align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %23, i32 0, i32 5
  %le_next = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 0
  %24 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  store %struct.cpuset* %24, %struct.cpuset** %set, align 8
  br label %for.cond

for.end20:                                        ; preds = %if.then17, %for.cond
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @db_printf(i8*, ...) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @cpusets_show_add(i8* %arg) #0 {
entry:
  %arg.addr = alloca i8*, align 8
  store i8* %arg, i8** %arg.addr, align 8
  call void @db_command_register(%struct.command_table* @db_show_table, %struct.command* @cpusets_show) #7
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @db_command_register(%struct.command_table*, %struct.command*) #2

; Function Attrs: noimplicitfloat noredzone
declare i32 @priv_check(%struct.thread*, i32) #2

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind readnone ssp
define internal %struct.thread* @__curthread() #6 {
entry:
  %td = alloca %struct.thread*, align 8
  %0 = call %struct.thread* asm "movq %gs:$1,$0", "=r,*m,~{dirflag},~{fpsr},~{flags}"(i8* null) #10, !srcloc !0
  store %struct.thread* %0, %struct.thread** %td, align 8
  %1 = load %struct.thread*, %struct.thread** %td, align 8
  ret %struct.thread* %1
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @jailed(%struct.ucred*) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cpuset_testupdate(%struct.cpuset* %set, %struct._cpuset* %mask) #0 {
entry:
  %retval = alloca i32, align 4
  %set.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %newmask = alloca %struct._cpuset, align 8
  %error = alloca i32, align 4
  %__i = alloca i64, align 8
  %__i11 = alloca i64, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  call void @__mtx_assert(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 4, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 315) #7
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 2
  %1 = load i32, i32* %cs_flags, align 4
  %and = and i32 %1, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, i64* %__i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %__i, align 8
  %cmp = icmp ult i64 %2, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %__i, align 8
  %4 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %4, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %3
  %5 = load i64, i64* %arrayidx, align 8
  %6 = load i64, i64* %__i, align 8
  %7 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %7, i32 0, i32 0
  %__bits1 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits1, i32 0, i64 %6
  %8 = load i64, i64* %arrayidx2, align 8
  %and3 = and i64 %5, %8
  %cmp4 = icmp ne i64 %and3, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %for.body
  br label %for.end

if.end6:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end6
  %9 = load i64, i64* %__i, align 8
  %inc = add i64 %9, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond

for.end:                                          ; preds = %if.then5, %for.cond
  %10 = load i64, i64* %__i, align 8
  %cmp7 = icmp ne i64 %10, 1
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %for.end
  store i32 11, i32* %retval
  br label %return

if.end9:                                          ; preds = %for.end
  %11 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask10 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %11, i32 0, i32 0
  %12 = bitcast %struct._cpuset* %newmask to i8*
  %13 = bitcast %struct._cpuset* %cs_mask10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 8, i32 8, i1 false)
  br label %do.body

do.body:                                          ; preds = %if.end9
  store i64 0, i64* %__i11, align 8
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc20, %do.body
  %14 = load i64, i64* %__i11, align 8
  %cmp13 = icmp ult i64 %14, 1
  br i1 %cmp13, label %for.body14, label %for.end22

for.body14:                                       ; preds = %for.cond12
  %15 = load i64, i64* %__i11, align 8
  %16 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits15 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %16, i32 0, i32 0
  %arrayidx16 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits15, i32 0, i64 %15
  %17 = load i64, i64* %arrayidx16, align 8
  %18 = load i64, i64* %__i11, align 8
  %__bits17 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %newmask, i32 0, i32 0
  %arrayidx18 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits17, i32 0, i64 %18
  %19 = load i64, i64* %arrayidx18, align 8
  %and19 = and i64 %19, %17
  store i64 %and19, i64* %arrayidx18, align 8
  br label %for.inc20

for.inc20:                                        ; preds = %for.body14
  %20 = load i64, i64* %__i11, align 8
  %inc21 = add i64 %20, 1
  store i64 %inc21, i64* %__i11, align 8
  br label %for.cond12

for.end22:                                        ; preds = %for.cond12
  br label %do.end

do.end:                                           ; preds = %for.end22
  store i32 0, i32* %error, align 4
  %21 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_children = getelementptr inbounds %struct.cpuset, %struct.cpuset* %21, i32 0, i32 7
  %lh_first = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children, i32 0, i32 0
  %22 = load %struct.cpuset*, %struct.cpuset** %lh_first, align 8
  store %struct.cpuset* %22, %struct.cpuset** %nset, align 8
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc29, %do.end
  %23 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %tobool24 = icmp ne %struct.cpuset* %23, null
  br i1 %tobool24, label %for.body25, label %for.end30

for.body25:                                       ; preds = %for.cond23
  %24 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %call = call i32 @cpuset_testupdate(%struct.cpuset* %24, %struct._cpuset* %newmask) #7
  store i32 %call, i32* %error, align 4
  %cmp26 = icmp ne i32 %call, 0
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %for.body25
  br label %for.end30

if.end28:                                         ; preds = %for.body25
  br label %for.inc29

for.inc29:                                        ; preds = %if.end28
  %25 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_siblings = getelementptr inbounds %struct.cpuset, %struct.cpuset* %25, i32 0, i32 6
  %le_next = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings, i32 0, i32 0
  %26 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  store %struct.cpuset* %26, %struct.cpuset** %nset, align 8
  br label %for.cond23

for.end30:                                        ; preds = %if.then27, %for.cond23
  %27 = load i32, i32* %error, align 4
  store i32 %27, i32* %retval
  br label %return

return:                                           ; preds = %for.end30, %if.then8, %if.then
  %28 = load i32, i32* %retval
  ret i32 %28
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @cpuset_update(%struct.cpuset* %set, %struct._cpuset* %mask) #0 {
entry:
  %set.addr = alloca %struct.cpuset*, align 8
  %mask.addr = alloca %struct._cpuset*, align 8
  %nset = alloca %struct.cpuset*, align 8
  %__i = alloca i64, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  store %struct._cpuset* %mask, %struct._cpuset** %mask.addr, align 8
  call void @__mtx_assert(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 4, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 337) #7
  br label %do.body

do.body:                                          ; preds = %entry
  store i64 0, i64* %__i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %0 = load i64, i64* %__i, align 8
  %cmp = icmp ult i64 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %__i, align 8
  %2 = load %struct._cpuset*, %struct._cpuset** %mask.addr, align 8
  %__bits = getelementptr inbounds %struct._cpuset, %struct._cpuset* %2, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i64], [1 x i64]* %__bits, i32 0, i64 %1
  %3 = load i64, i64* %arrayidx, align 8
  %4 = load i64, i64* %__i, align 8
  %5 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask = getelementptr inbounds %struct.cpuset, %struct.cpuset* %5, i32 0, i32 0
  %__bits1 = getelementptr inbounds %struct._cpuset, %struct._cpuset* %cs_mask, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [1 x i64], [1 x i64]* %__bits1, i32 0, i64 %4
  %6 = load i64, i64* %arrayidx2, align 8
  %and = and i64 %6, %3
  store i64 %and, i64* %arrayidx2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %__i, align 8
  %inc = add i64 %7, 1
  store i64 %inc, i64* %__i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  %8 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_children = getelementptr inbounds %struct.cpuset, %struct.cpuset* %8, i32 0, i32 7
  %lh_first = getelementptr inbounds %struct.setlist, %struct.setlist* %cs_children, i32 0, i32 0
  %9 = load %struct.cpuset*, %struct.cpuset** %lh_first, align 8
  store %struct.cpuset* %9, %struct.cpuset** %nset, align 8
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc6, %do.end
  %10 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %tobool = icmp ne %struct.cpuset* %10, null
  br i1 %tobool, label %for.body4, label %for.end7

for.body4:                                        ; preds = %for.cond3
  %11 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %12 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_mask5 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %12, i32 0, i32 0
  call void @cpuset_update(%struct.cpuset* %11, %struct._cpuset* %cs_mask5) #7
  br label %for.inc6

for.inc6:                                         ; preds = %for.body4
  %13 = load %struct.cpuset*, %struct.cpuset** %nset, align 8
  %cs_siblings = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 6
  %le_next = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings, i32 0, i32 0
  %14 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  store %struct.cpuset* %14, %struct.cpuset** %nset, align 8
  br label %for.cond3

for.end7:                                         ; preds = %for.cond3
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_assert(i64*, i32, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @cpuset_init(i8* %arg) #0 {
entry:
  %arg.addr = alloca i8*, align 8
  %mask = alloca %struct._cpuset, align 8
  store i8* %arg, i8** %arg.addr, align 8
  %0 = bitcast %struct._cpuset* %mask to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct._cpuset* @all_cpus to i8*), i64 8, i32 8, i1 false)
  %1 = load %struct.cpuset*, %struct.cpuset** @cpuset_zero, align 8
  %call = call i32 @cpuset_modify(%struct.cpuset* %1, %struct._cpuset* %mask) #7
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str21, i32 0, i32 0)) #8
  unreachable

if.end:                                           ; preds = %entry
  %2 = load %struct.cpuset*, %struct.cpuset** @cpuset_zero, align 8
  %cs_flags = getelementptr inbounds %struct.cpuset, %struct.cpuset* %2, i32 0, i32 2
  %3 = load i32, i32* %cs_flags, align 4
  %or = or i32 %3, 2
  store i32 %or, i32* %cs_flags, align 4
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @cpuset_rel_defer(%struct.setlist* %head, %struct.cpuset* %set) #0 {
entry:
  %head.addr = alloca %struct.setlist*, align 8
  %set.addr = alloca %struct.cpuset*, align 8
  store %struct.setlist* %head, %struct.setlist** %head.addr, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_ref = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 1
  %call = call i32 @refcount_release(i32* %cs_ref) #7
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  call void @__mtx_lock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 195) #7
  br label %do.body

do.body:                                          ; preds = %if.end
  br label %do.body1

do.body1:                                         ; preds = %do.body
  %1 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings = getelementptr inbounds %struct.cpuset, %struct.cpuset* %1, i32 0, i32 6
  %le_next = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings, i32 0, i32 0
  %2 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  %cmp2 = icmp ne %struct.cpuset* %2, null
  br i1 %cmp2, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %do.body1
  %3 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings3 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %3, i32 0, i32 6
  %le_next4 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings3, i32 0, i32 0
  %4 = load %struct.cpuset*, %struct.cpuset** %le_next4, align 8
  %cs_siblings5 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %4, i32 0, i32 6
  %le_prev = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings5, i32 0, i32 1
  %5 = load %struct.cpuset**, %struct.cpuset*** %le_prev, align 8
  %6 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings6 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %6, i32 0, i32 6
  %le_next7 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings6, i32 0, i32 0
  %cmp8 = icmp ne %struct.cpuset** %5, %le_next7
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true
  %7 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %7) #8
  unreachable

if.end10:                                         ; preds = %land.lhs.true, %do.body1
  br label %do.end

do.end:                                           ; preds = %if.end10
  br label %do.body11

do.body11:                                        ; preds = %do.end
  %8 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings12 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %8, i32 0, i32 6
  %le_prev13 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings12, i32 0, i32 1
  %9 = load %struct.cpuset**, %struct.cpuset*** %le_prev13, align 8
  %10 = load %struct.cpuset*, %struct.cpuset** %9, align 8
  %11 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cmp14 = icmp ne %struct.cpuset* %10, %11
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.body11
  %12 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %12) #8
  unreachable

if.end16:                                         ; preds = %do.body11
  br label %do.end17

do.end17:                                         ; preds = %if.end16
  %13 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings18 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %13, i32 0, i32 6
  %le_next19 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings18, i32 0, i32 0
  %14 = load %struct.cpuset*, %struct.cpuset** %le_next19, align 8
  %cmp20 = icmp ne %struct.cpuset* %14, null
  br i1 %cmp20, label %if.then21, label %if.end28

if.then21:                                        ; preds = %do.end17
  %15 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings22 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %15, i32 0, i32 6
  %le_prev23 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings22, i32 0, i32 1
  %16 = load %struct.cpuset**, %struct.cpuset*** %le_prev23, align 8
  %17 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings24 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %17, i32 0, i32 6
  %le_next25 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings24, i32 0, i32 0
  %18 = load %struct.cpuset*, %struct.cpuset** %le_next25, align 8
  %cs_siblings26 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %18, i32 0, i32 6
  %le_prev27 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings26, i32 0, i32 1
  store %struct.cpuset** %16, %struct.cpuset*** %le_prev27, align 8
  br label %if.end28

if.end28:                                         ; preds = %if.then21, %do.end17
  %19 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings29 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %19, i32 0, i32 6
  %le_next30 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings29, i32 0, i32 0
  %20 = load %struct.cpuset*, %struct.cpuset** %le_next30, align 8
  %21 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_siblings31 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %21, i32 0, i32 6
  %le_prev32 = getelementptr inbounds %struct.anon.8, %struct.anon.8* %cs_siblings31, i32 0, i32 1
  %22 = load %struct.cpuset**, %struct.cpuset*** %le_prev32, align 8
  store %struct.cpuset* %20, %struct.cpuset** %22, align 8
  br label %do.end33

do.end33:                                         ; preds = %if.end28
  %23 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_id = getelementptr inbounds %struct.cpuset, %struct.cpuset* %23, i32 0, i32 3
  %24 = load i32, i32* %cs_id, align 4
  %cmp34 = icmp ne i32 %24, -1
  br i1 %cmp34, label %if.then35, label %if.end74

if.then35:                                        ; preds = %do.end33
  br label %do.body36

do.body36:                                        ; preds = %if.then35
  br label %do.body37

do.body37:                                        ; preds = %do.body36
  %25 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %25, i32 0, i32 5
  %le_next38 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 0
  %26 = load %struct.cpuset*, %struct.cpuset** %le_next38, align 8
  %cmp39 = icmp ne %struct.cpuset* %26, null
  br i1 %cmp39, label %land.lhs.true40, label %if.end49

land.lhs.true40:                                  ; preds = %do.body37
  %27 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link41 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %27, i32 0, i32 5
  %le_next42 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link41, i32 0, i32 0
  %28 = load %struct.cpuset*, %struct.cpuset** %le_next42, align 8
  %cs_link43 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %28, i32 0, i32 5
  %le_prev44 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link43, i32 0, i32 1
  %29 = load %struct.cpuset**, %struct.cpuset*** %le_prev44, align 8
  %30 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link45 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %30, i32 0, i32 5
  %le_next46 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link45, i32 0, i32 0
  %cmp47 = icmp ne %struct.cpuset** %29, %le_next46
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %land.lhs.true40
  %31 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %31) #8
  unreachable

if.end49:                                         ; preds = %land.lhs.true40, %do.body37
  br label %do.end50

do.end50:                                         ; preds = %if.end49
  br label %do.body51

do.body51:                                        ; preds = %do.end50
  %32 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link52 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %32, i32 0, i32 5
  %le_prev53 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link52, i32 0, i32 1
  %33 = load %struct.cpuset**, %struct.cpuset*** %le_prev53, align 8
  %34 = load %struct.cpuset*, %struct.cpuset** %33, align 8
  %35 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cmp54 = icmp ne %struct.cpuset* %34, %35
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %do.body51
  %36 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %36) #8
  unreachable

if.end56:                                         ; preds = %do.body51
  br label %do.end57

do.end57:                                         ; preds = %if.end56
  %37 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link58 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %37, i32 0, i32 5
  %le_next59 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link58, i32 0, i32 0
  %38 = load %struct.cpuset*, %struct.cpuset** %le_next59, align 8
  %cmp60 = icmp ne %struct.cpuset* %38, null
  br i1 %cmp60, label %if.then61, label %if.end68

if.then61:                                        ; preds = %do.end57
  %39 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link62 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %39, i32 0, i32 5
  %le_prev63 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link62, i32 0, i32 1
  %40 = load %struct.cpuset**, %struct.cpuset*** %le_prev63, align 8
  %41 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link64 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %41, i32 0, i32 5
  %le_next65 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link64, i32 0, i32 0
  %42 = load %struct.cpuset*, %struct.cpuset** %le_next65, align 8
  %cs_link66 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %42, i32 0, i32 5
  %le_prev67 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link66, i32 0, i32 1
  store %struct.cpuset** %40, %struct.cpuset*** %le_prev67, align 8
  br label %if.end68

if.end68:                                         ; preds = %if.then61, %do.end57
  %43 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link69 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %43, i32 0, i32 5
  %le_next70 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link69, i32 0, i32 0
  %44 = load %struct.cpuset*, %struct.cpuset** %le_next70, align 8
  %45 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link71 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %45, i32 0, i32 5
  %le_prev72 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link71, i32 0, i32 1
  %46 = load %struct.cpuset**, %struct.cpuset*** %le_prev72, align 8
  store %struct.cpuset* %44, %struct.cpuset** %46, align 8
  br label %do.end73

do.end73:                                         ; preds = %if.end68
  br label %if.end74

if.end74:                                         ; preds = %do.end73, %do.end33
  br label %do.body75

do.body75:                                        ; preds = %if.end74
  br label %do.body76

do.body76:                                        ; preds = %do.body75
  %47 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first = getelementptr inbounds %struct.setlist, %struct.setlist* %47, i32 0, i32 0
  %48 = load %struct.cpuset*, %struct.cpuset** %lh_first, align 8
  %cmp77 = icmp ne %struct.cpuset* %48, null
  br i1 %cmp77, label %land.lhs.true78, label %if.end85

land.lhs.true78:                                  ; preds = %do.body76
  %49 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first79 = getelementptr inbounds %struct.setlist, %struct.setlist* %49, i32 0, i32 0
  %50 = load %struct.cpuset*, %struct.cpuset** %lh_first79, align 8
  %cs_link80 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %50, i32 0, i32 5
  %le_prev81 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link80, i32 0, i32 1
  %51 = load %struct.cpuset**, %struct.cpuset*** %le_prev81, align 8
  %52 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first82 = getelementptr inbounds %struct.setlist, %struct.setlist* %52, i32 0, i32 0
  %cmp83 = icmp ne %struct.cpuset** %51, %lh_first82
  br i1 %cmp83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %land.lhs.true78
  %53 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str7, i32 0, i32 0), %struct.setlist* %53) #8
  unreachable

if.end85:                                         ; preds = %land.lhs.true78, %do.body76
  br label %do.end86

do.end86:                                         ; preds = %if.end85
  %54 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first87 = getelementptr inbounds %struct.setlist, %struct.setlist* %54, i32 0, i32 0
  %55 = load %struct.cpuset*, %struct.cpuset** %lh_first87, align 8
  %56 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link88 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %56, i32 0, i32 5
  %le_next89 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link88, i32 0, i32 0
  store %struct.cpuset* %55, %struct.cpuset** %le_next89, align 8
  %cmp90 = icmp ne %struct.cpuset* %55, null
  br i1 %cmp90, label %if.then91, label %if.end97

if.then91:                                        ; preds = %do.end86
  %57 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link92 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %57, i32 0, i32 5
  %le_next93 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link92, i32 0, i32 0
  %58 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first94 = getelementptr inbounds %struct.setlist, %struct.setlist* %58, i32 0, i32 0
  %59 = load %struct.cpuset*, %struct.cpuset** %lh_first94, align 8
  %cs_link95 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %59, i32 0, i32 5
  %le_prev96 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link95, i32 0, i32 1
  store %struct.cpuset** %le_next93, %struct.cpuset*** %le_prev96, align 8
  br label %if.end97

if.end97:                                         ; preds = %if.then91, %do.end86
  %60 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %61 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first98 = getelementptr inbounds %struct.setlist, %struct.setlist* %61, i32 0, i32 0
  store %struct.cpuset* %60, %struct.cpuset** %lh_first98, align 8
  %62 = load %struct.setlist*, %struct.setlist** %head.addr, align 8
  %lh_first99 = getelementptr inbounds %struct.setlist, %struct.setlist* %62, i32 0, i32 0
  %63 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link100 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %63, i32 0, i32 5
  %le_prev101 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link100, i32 0, i32 1
  store %struct.cpuset** %lh_first99, %struct.cpuset*** %le_prev101, align 8
  br label %do.end102

do.end102:                                        ; preds = %if.end97
  call void @__mtx_unlock_spin_flags(i64* getelementptr inbounds (%struct.mtx, %struct.mtx* @cpuset_lock, i32 0, i32 1), i32 0, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), i32 200) #7
  br label %return

return:                                           ; preds = %do.end102, %if.then
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @cpuset_rel_complete(%struct.cpuset* %set) #0 {
entry:
  %set.addr = alloca %struct.cpuset*, align 8
  store %struct.cpuset* %set, %struct.cpuset** %set.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  br label %do.body1

do.body1:                                         ; preds = %do.body
  %0 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link = getelementptr inbounds %struct.cpuset, %struct.cpuset* %0, i32 0, i32 5
  %le_next = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link, i32 0, i32 0
  %1 = load %struct.cpuset*, %struct.cpuset** %le_next, align 8
  %cmp = icmp ne %struct.cpuset* %1, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body1
  %2 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link2 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %2, i32 0, i32 5
  %le_next3 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link2, i32 0, i32 0
  %3 = load %struct.cpuset*, %struct.cpuset** %le_next3, align 8
  %cs_link4 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %3, i32 0, i32 5
  %le_prev = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link4, i32 0, i32 1
  %4 = load %struct.cpuset**, %struct.cpuset*** %le_prev, align 8
  %5 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link5 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %5, i32 0, i32 5
  %le_next6 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link5, i32 0, i32 0
  %cmp7 = icmp ne %struct.cpuset** %4, %le_next6
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str1, i32 0, i32 0), %struct.cpuset* %6) #8
  unreachable

if.end:                                           ; preds = %land.lhs.true, %do.body1
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body8

do.body8:                                         ; preds = %do.end
  %7 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link9 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %7, i32 0, i32 5
  %le_prev10 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link9, i32 0, i32 1
  %8 = load %struct.cpuset**, %struct.cpuset*** %le_prev10, align 8
  %9 = load %struct.cpuset*, %struct.cpuset** %8, align 8
  %10 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cmp11 = icmp ne %struct.cpuset* %9, %10
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %do.body8
  %11 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  call void (i8*, ...) @panic(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str2, i32 0, i32 0), %struct.cpuset* %11) #8
  unreachable

if.end13:                                         ; preds = %do.body8
  br label %do.end14

do.end14:                                         ; preds = %if.end13
  %12 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link15 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %12, i32 0, i32 5
  %le_next16 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link15, i32 0, i32 0
  %13 = load %struct.cpuset*, %struct.cpuset** %le_next16, align 8
  %cmp17 = icmp ne %struct.cpuset* %13, null
  br i1 %cmp17, label %if.then18, label %if.end25

if.then18:                                        ; preds = %do.end14
  %14 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link19 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %14, i32 0, i32 5
  %le_prev20 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link19, i32 0, i32 1
  %15 = load %struct.cpuset**, %struct.cpuset*** %le_prev20, align 8
  %16 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link21 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %16, i32 0, i32 5
  %le_next22 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link21, i32 0, i32 0
  %17 = load %struct.cpuset*, %struct.cpuset** %le_next22, align 8
  %cs_link23 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %17, i32 0, i32 5
  %le_prev24 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link23, i32 0, i32 1
  store %struct.cpuset** %15, %struct.cpuset*** %le_prev24, align 8
  br label %if.end25

if.end25:                                         ; preds = %if.then18, %do.end14
  %18 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link26 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %18, i32 0, i32 5
  %le_next27 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link26, i32 0, i32 0
  %19 = load %struct.cpuset*, %struct.cpuset** %le_next27, align 8
  %20 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_link28 = getelementptr inbounds %struct.cpuset, %struct.cpuset* %20, i32 0, i32 5
  %le_prev29 = getelementptr inbounds %struct.anon.7, %struct.anon.7* %cs_link28, i32 0, i32 1
  %21 = load %struct.cpuset**, %struct.cpuset*** %le_prev29, align 8
  store %struct.cpuset* %19, %struct.cpuset** %21, align 8
  br label %do.end30

do.end30:                                         ; preds = %if.end25
  %22 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %cs_parent = getelementptr inbounds %struct.cpuset, %struct.cpuset* %22, i32 0, i32 4
  %23 = load %struct.cpuset*, %struct.cpuset** %cs_parent, align 8
  call void @cpuset_rel(%struct.cpuset* %23) #7
  %24 = load %struct.uma_zone*, %struct.uma_zone** @cpuset_zone, align 8
  %25 = load %struct.cpuset*, %struct.cpuset** %set.addr, align 8
  %26 = bitcast %struct.cpuset* %25 to i8*
  call void @uma_zfree(%struct.uma_zone* %24, i8* %26) #7
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @alloc_unr(%struct.unrhdr*) #2

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @refcount_init(i32* %count, i32 %value) #1 {
entry:
  %count.addr = alloca i32*, align 8
  %value.addr = alloca i32, align 4
  store i32* %count, i32** %count.addr, align 8
  store i32 %value, i32* %value.addr, align 4
  %0 = load i32, i32* %value.addr, align 4
  %1 = load i32*, i32** %count.addr, align 8
  store volatile i32 %0, i32* %1, align 4
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_lock_flags(i64*, i32, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone
declare %struct.proc* @pfind(i32) #2

; Function Attrs: noimplicitfloat noredzone
declare %struct.thread* @tdfind(i32, i32) #2

; Function Attrs: noimplicitfloat noredzone
declare i32 @_sx_slock(%struct.sx*, i32, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone
declare %struct.prison* @prison_find_child(%struct.prison*, i32) #2

; Function Attrs: noimplicitfloat noredzone
declare void @_sx_sunlock(%struct.sx*, i8*, i32) #2

; Function Attrs: noimplicitfloat noredzone
declare i32 @p_cansched(%struct.thread*, %struct.proc*) #2

; Function Attrs: noimplicitfloat noredzone
declare i8* @uma_zalloc_arg(%struct.uma_zone*, i8*, i32) #2

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i64 @bsfq(i64 %mask) #1 {
entry:
  %mask.addr = alloca i64, align 8
  %result = alloca i64, align 8
  store i64 %mask, i64* %mask.addr, align 8
  %0 = load i64, i64* %mask.addr, align 8
  %1 = call i64 asm sideeffect "bsfq $1,$0", "=r,rm,~{dirflag},~{fpsr},~{flags}"(i64 %0) #10, !srcloc !1
  store i64 %1, i64* %result, align 8
  %2 = load i64, i64* %result, align 8
  ret i64 %2
}

; Function Attrs: noimplicitfloat noredzone
declare void @uma_zfree_arg(%struct.uma_zone*, i8*, i8*) #2

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i32 @atomic_fetchadd_int(i32* %p, i32 %v) #1 {
entry:
  %p.addr = alloca i32*, align 8
  %v.addr = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32, i32* %v.addr, align 4
  %1 = load i32*, i32** %p.addr, align 8
  %2 = load i32*, i32** %p.addr, align 8
  %3 = call i32 asm sideeffect "\09lock ; \09\09\09xaddl\09$0, $1 ;\09# atomic_fetchadd_int", "=r,=*m,*m,0,~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %1, i32* %2, i32 %0) #10, !srcloc !2
  store i32 %3, i32* %v.addr, align 4
  %4 = load i32, i32* %v.addr, align 4
  ret i32 %4
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @atomic_add_barr_int(i32* %p, i32 %v) #1 {
entry:
  %p.addr = alloca i32*, align 8
  %v.addr = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32*, i32** %p.addr, align 8
  %1 = load i32, i32* %v.addr, align 4
  %2 = load i32*, i32** %p.addr, align 8
  call void asm sideeffect "lock ; addl $1,$0", "=*m,ir,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %0, i32 %1, i32* %2) #10, !srcloc !3
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @sysctl_handle_int(%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*) #2

attributes #0 = { noimplicitfloat noredzone nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint noimplicitfloat noredzone nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noimplicitfloat noredzone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noimplicitfloat noredzone noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { argmemonly nounwind }
attributes #6 = { inlinehint noimplicitfloat noredzone nounwind readnone ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin noimplicitfloat noredzone }
attributes #8 = { nobuiltin noimplicitfloat noredzone noreturn }
attributes #9 = { nobuiltin noimplicitfloat noredzone nounwind readnone }
attributes #10 = { nounwind }

!0 = !{i32 779808}
!1 = !{i32 203831}
!2 = !{i32 178088}
!3 = !{i32 -2147288497}
