; RUN: tesla instrument -S %s -tesla-manifest %p/Inputs/kern_prot.tesla -o %t

; ModuleID = 'kern_prot.bc'
source_filename = "kern_prot.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd11.0"

module asm ".ident\09\22$FreeBSD: head/sys/kern/kern_prot.c 243022 2012-11-14 10:33:12Z bapt $\22"
module asm ".globl __start_set_pcpu"
module asm ".globl __stop_set_pcpu"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysctl_set"
module asm ".globl __stop_set_sysctl_set"
module asm ".globl __start_set_sysctl_set"
module asm ".globl __stop_set_sysctl_set"
module asm ".globl __start_set_sysctl_set"
module asm ".globl __stop_set_sysctl_set"
module asm ".globl __start_set_sysctl_set"
module asm ".globl __stop_set_sysctl_set"
module asm ".globl __start_set_sysctl_set"
module asm ".globl __stop_set_sysctl_set"

%struct.sysinit = type { i32, i32, void (i8*)*, i8* }
%struct.sysctl_oid = type { %struct.sysctl_oid_list*, %struct.anon, i32, i32, i8*, i64, i8*, i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)*, i8*, i32, i32, i8* }
%struct.sysctl_oid_list = type { %struct.sysctl_oid* }
%struct.anon = type { %struct.sysctl_oid* }
%struct.sysctl_req = type { %struct.thread*, i32, i8*, i64, i64, i32 (%struct.sysctl_req*, i8*, i64)*, i8*, i64, i64, i32 (%struct.sysctl_req*, i8*, i64)*, i64, i32 }
%struct.thread = type { %struct.mtx*, %struct.proc*, %struct.anon.41, %struct.anon.42, %struct.anon.43, %struct.anon.44, %struct.anon.45, %struct.cpuset*, %struct.seltd*, %struct.sleepqueue*, %struct.turnstile*, %struct.rl_q_entry*, %struct.umtx_q*, i32, %struct.sigqueue, i8, i32, i32, i32, i32, i32, i8*, i8*, i8, i8, i8, i8, i16, i16, i16, i16, %struct.turnstile*, i8*, %struct.anon.46, %struct.lock_list_entry*, i32, i32, %struct.ucred*, i32, i32, i32, i32, i32, %struct.rusage, %struct.rusage_ext, i64, i64, i32, i32, i32, i32, i32, %struct.__sigset, i32, %struct.sigaltstack, i32, i64, i32, [20 x i8], %struct.file*, i32, %struct.ksiginfo, i32, %struct.osd, %struct.vm_map_entry*, i32, i32, i32, i32, %struct.__sigset, i8, i8, i8, i8, i8, i8, %struct.pcb*, i32, [2 x i64], %struct.callout, %struct.trapframe*, %struct.vm_object*, i64, i32, i32, %struct.mdthread, %struct.td_sched*, %struct.kaudit_record*, [2 x %struct.lpohead], %struct.kdtrace_thread*, i32, %struct.vnet*, i8*, %struct.trapframe*, %struct.proc*, %struct.vm_page**, i32, %struct.tesla_store* }
%struct.mtx = type { %struct.lock_object, i64 }
%struct.lock_object = type { i8*, i32, i32, %struct.witness* }
%struct.witness = type opaque
%struct.anon.41 = type { %struct.thread*, %struct.thread** }
%struct.anon.42 = type { %struct.thread*, %struct.thread** }
%struct.anon.43 = type { %struct.thread*, %struct.thread** }
%struct.anon.44 = type { %struct.thread*, %struct.thread** }
%struct.anon.45 = type { %struct.thread*, %struct.thread** }
%struct.cpuset = type { %struct._cpuset, i32, i32, i32, %struct.cpuset*, %struct.anon.9, %struct.anon.10, %struct.setlist }
%struct._cpuset = type { [1 x i64] }
%struct.anon.9 = type { %struct.cpuset*, %struct.cpuset** }
%struct.anon.10 = type { %struct.cpuset*, %struct.cpuset** }
%struct.setlist = type { %struct.cpuset* }
%struct.seltd = type opaque
%struct.sleepqueue = type opaque
%struct.rl_q_entry = type opaque
%struct.umtx_q = type opaque
%struct.sigqueue = type { %struct.__sigset, %struct.__sigset, %struct.anon.29, %struct.proc*, i32 }
%struct.anon.29 = type { %struct.ksiginfo*, %struct.ksiginfo** }
%struct.turnstile = type opaque
%struct.anon.46 = type { %struct.turnstile* }
%struct.lock_list_entry = type opaque
%struct.ucred = type { i32, i32, i32, i32, i32, i32, i32, %struct.uidinfo*, %struct.uidinfo*, %struct.prison*, %struct.loginclass*, i32, [2 x i8*], %struct.label*, %struct.auditinfo_addr, i32*, i32 }
%struct.uidinfo = type { %struct.anon.2, %struct.mtx, i64, i64, i64, i64, i32, i32, %struct.racct* }
%struct.anon.2 = type { %struct.uidinfo*, %struct.uidinfo** }
%struct.racct = type { [21 x i64], %struct.anon.3 }
%struct.anon.3 = type { %struct.rctl_rule_link* }
%struct.rctl_rule_link = type opaque
%struct.prison = type { %struct.anon.4, i32, i32, i32, i32, %struct.anon.5, %struct.anon.6, %struct.prison*, %struct.mtx, %struct.task, %struct.osd, %struct.cpuset*, %struct.vnet*, %struct.vnode*, i32, i32, %struct.in_addr*, %struct.in6_addr*, %struct.prison_racct*, [3 x i8*], i32, i32, i32, i32, i32, i32, [4 x i32], i64, [256 x i8], [1024 x i8], [256 x i8], [256 x i8], [64 x i8] }
%struct.anon.4 = type { %struct.prison*, %struct.prison** }
%struct.anon.5 = type { %struct.prison* }
%struct.anon.6 = type { %struct.prison*, %struct.prison** }
%struct.task = type { %struct.anon.7, i16, i16, void (i8*, i32)*, i8* }
%struct.anon.7 = type { %struct.task* }
%struct.vnode = type opaque
%struct.in_addr = type { i32 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.prison_racct = type { %struct.anon.12, [256 x i8], i32, %struct.racct* }
%struct.anon.12 = type { %struct.prison_racct*, %struct.prison_racct** }
%struct.loginclass = type { %struct.anon.13, [33 x i8], i32, %struct.racct* }
%struct.anon.13 = type { %struct.loginclass*, %struct.loginclass** }
%struct.label = type opaque
%struct.auditinfo_addr = type { i32, %struct.au_mask, %struct.au_tid_addr, i32, i64 }
%struct.au_mask = type { i32, i32 }
%struct.au_tid_addr = type { i32, i32, [4 x i32] }
%struct.rusage = type { %struct.timeval, %struct.timeval, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.rusage_ext = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.sigaltstack = type { i8*, i64, i32 }
%struct.file = type { i8*, %struct.fileops*, %struct.ucred*, %struct.vnode*, i16, i16, i32, i32, i32, i64, %union.anon.36, i64, i8* }
%struct.fileops = type { i32 (%struct.file*, %struct.uio*, %struct.ucred*, i32, %struct.thread*)*, i32 (%struct.file*, %struct.uio*, %struct.ucred*, i32, %struct.thread*)*, i32 (%struct.file*, i64, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, i64, i8*, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, i32, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, %struct.knote*)*, i32 (%struct.file*, %struct.stat*, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, %struct.thread*)*, i32 (%struct.file*, i16, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, i32, i32, %struct.ucred*, %struct.thread*)*, i32 }
%struct.uio = type { %struct.iovec*, i32, i64, i64, i32, i32, %struct.thread* }
%struct.iovec = type { i8*, i64 }
%struct.knote = type { %struct.anon.32, %struct.anon.33, %struct.knlist*, %struct.anon.34, %struct.kqueue*, %struct.kevent, i32, i32, i64, %union.anon.35, %struct.filterops*, i8*, i32 }
%struct.anon.32 = type { %struct.knote* }
%struct.anon.33 = type { %struct.knote* }
%struct.knlist = type { %struct.klist, void (i8*)*, void (i8*)*, void (i8*)*, void (i8*)*, i8* }
%struct.klist = type { %struct.knote* }
%struct.anon.34 = type { %struct.knote*, %struct.knote** }
%struct.kqueue = type opaque
%struct.kevent = type { i64, i16, i16, i32, i64, i8* }
%union.anon.35 = type { %struct.file* }
%struct.filterops = type { i32, i32 (%struct.knote*)*, void (%struct.knote*)*, i32 (%struct.knote*, i64)*, void (%struct.knote*, %struct.kevent*, i64)* }
%struct.stat = type opaque
%union.anon.36 = type { %struct.cdev_privdata* }
%struct.cdev_privdata = type opaque
%struct.ksiginfo = type { %struct.anon.22, %struct.__siginfo, i32, %struct.sigqueue* }
%struct.anon.22 = type { %struct.ksiginfo*, %struct.ksiginfo** }
%struct.__siginfo = type { i32, i32, i32, i32, i32, i32, i8*, %union.sigval, %union.anon.23 }
%union.sigval = type { i8* }
%union.anon.23 = type { %struct.anon.28 }
%struct.anon.28 = type { i64, [7 x i32] }
%struct.osd = type { i32, i8**, %struct.anon.8 }
%struct.anon.8 = type { %struct.osd*, %struct.osd** }
%struct.vm_map_entry = type opaque
%struct.__sigset = type { [4 x i32] }
%struct.pcb = type opaque
%struct.callout = type { %union.anon.14, i64, i64, i8*, void (i8*)*, %struct.lock_object*, i32, i32 }
%union.anon.14 = type { %struct.anon.15 }
%struct.anon.15 = type { %struct.callout*, %struct.callout** }
%struct.vm_object = type opaque
%struct.mdthread = type { i32, i64, i64 }
%struct.td_sched = type opaque
%struct.kaudit_record = type opaque
%struct.lpohead = type { %struct.lock_profile_object* }
%struct.lock_profile_object = type opaque
%struct.kdtrace_thread = type opaque
%struct.vnet = type { %struct.anon.11, i32, i32, i32, i8*, i64 }
%struct.anon.11 = type { %struct.vnet*, %struct.vnet** }
%struct.trapframe = type opaque
%struct.proc = type { %struct.anon.0, %struct.anon.1, %struct.mtx, %struct.ucred*, %struct.filedesc*, %struct.filedesc_to_leader*, %struct.pstats*, %struct.plimit*, %struct.callout, %struct.sigacts*, i32, i32, i32, %struct.anon.18, %struct.anon.19, %struct.proc*, %struct.anon.20, %struct.anon.21, %struct.mtx, %struct.ksiginfo*, %struct.sigqueue, i32, %struct.vmspace*, i32, %struct.itimerval, %struct.rusage, %struct.rusage_ext, %struct.rusage_ext, i32, i32, i32, %struct.vnode*, %struct.ucred*, %struct.vnode*, i32, %struct.sigiolst, i32, i32, i64, i32, i32, i8, i8, %struct.nlminfo*, %struct.kaioinfo*, %struct.thread*, i32, %struct.thread*, i32, i32, %struct.itimers*, %struct.procdesc*, i32, i32, [20 x i8], %struct.pgrp*, %struct.sysentvec*, %struct.pargs*, i64, i8, i32, i16, %struct.knlist, i32, %struct.mdproc, %struct.callout, i16, %struct.proc*, %struct.proc*, i8*, %struct.label*, %struct.p_sched*, %struct.anon.37, %struct.anon.38, %struct.kdtrace_proc*, %struct.cv, %struct.cv, i64, %struct.racct*, i8, %struct.anon.39, %struct.anon.40 }
%struct.anon.0 = type { %struct.proc*, %struct.proc** }
%struct.anon.1 = type { %struct.thread*, %struct.thread** }
%struct.filedesc = type opaque
%struct.filedesc_to_leader = type opaque
%struct.pstats = type { %struct.rusage, [3 x %struct.itimerval], %struct.uprof, %struct.timeval }
%struct.uprof = type { i8*, i64, i64, i64 }
%struct.plimit = type { [13 x %struct.rlimit], i32 }
%struct.rlimit = type { i64, i64 }
%struct.sigacts = type { [128 x void (i32)*], [128 x %struct.__sigset], %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, i32, i32, %struct.mtx }
%struct.anon.18 = type { %struct.proc*, %struct.proc** }
%struct.anon.19 = type { %struct.proc*, %struct.proc** }
%struct.anon.20 = type { %struct.proc*, %struct.proc** }
%struct.anon.21 = type { %struct.proc* }
%struct.vmspace = type opaque
%struct.itimerval = type { %struct.timeval, %struct.timeval }
%struct.sigiolst = type { %struct.sigio* }
%struct.sigio = type { %union.anon.30, %struct.anon.31, %struct.sigio**, %struct.ucred*, i32 }
%union.anon.30 = type { %struct.proc* }
%struct.anon.31 = type { %struct.sigio* }
%struct.nlminfo = type opaque
%struct.kaioinfo = type opaque
%struct.itimers = type opaque
%struct.procdesc = type opaque
%struct.pgrp = type { %struct.anon.47, %struct.anon.48, %struct.session*, %struct.sigiolst, i32, i32, %struct.mtx }
%struct.anon.47 = type { %struct.pgrp*, %struct.pgrp** }
%struct.anon.48 = type { %struct.proc* }
%struct.session = type { i32, %struct.proc*, %struct.vnode*, %struct.cdev_priv*, %struct.tty*, i32, [40 x i8], %struct.mtx }
%struct.cdev_priv = type opaque
%struct.tty = type opaque
%struct.sysentvec = type opaque
%struct.pargs = type { i32, i32, [1 x i8] }
%struct.mdproc = type { %struct.proc_ldt*, %struct.system_segment_descriptor }
%struct.proc_ldt = type { i8*, i32 }
%struct.system_segment_descriptor = type <{ [16 x i8] }>
%struct.p_sched = type opaque
%struct.anon.37 = type { %struct.ktr_request*, %struct.ktr_request** }
%struct.ktr_request = type opaque
%struct.anon.38 = type { %struct.mqueue_notifier* }
%struct.mqueue_notifier = type opaque
%struct.kdtrace_proc = type opaque
%struct.cv = type { i8*, i32 }
%struct.anon.39 = type { %struct.proc*, %struct.proc** }
%struct.anon.40 = type { %struct.proc* }
%struct.vm_page = type opaque
%struct.tesla_store = type opaque
%struct.malloc_type = type { %struct.malloc_type*, i64, i8*, i8* }
%struct.sx = type { %struct.lock_object, i64 }
%struct.getpid_args = type { i64 }
%struct.getppid_args = type { i64 }
%struct.getpgrp_args = type { i64 }
%struct.getpgid_args = type { [0 x i8], i32, [4 x i8] }
%struct.getsid_args = type { [0 x i8], i32, [4 x i8] }
%struct.getuid_args = type { i64 }
%struct.geteuid_args = type { i64 }
%struct.getgid_args = type { i64 }
%struct.getegid_args = type { i64 }
%struct.getgroups_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32*, [0 x i8] }
%struct.setsid_args = type { i64 }
%struct.setpgid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8] }
%struct.setuid_args = type { [0 x i8], i32, [4 x i8] }
%struct.__tesla_locality = type {}
%struct.seteuid_args = type { [0 x i8], i32, [4 x i8] }
%struct.setgid_args = type { [0 x i8], i32, [4 x i8] }
%struct.setegid_args = type { [0 x i8], i32, [4 x i8] }
%struct.setgroups_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32*, [0 x i8] }
%struct.setreuid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8] }
%struct.setregid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8] }
%struct.setresuid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8] }
%struct.setresgid_args = type { [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8], [0 x i8], i32, [4 x i8] }
%struct.getresuid_args = type { [0 x i8], i32*, [0 x i8], [0 x i8], i32*, [0 x i8], [0 x i8], i32*, [0 x i8] }
%struct.getresgid_args = type { [0 x i8], i32*, [0 x i8], [0 x i8], i32*, [0 x i8], [0 x i8], i32*, [0 x i8] }
%struct.issetugid_args = type { i64 }
%struct.__setugid_args = type { [0 x i8], i32, [4 x i8] }
%struct.socket = type { i32, i16, i16, i16, i16, i32, i8*, %struct.vnet*, %struct.protosw*, %struct.socket*, %struct.anon.49, %struct.anon.50, %struct.anon.51, i16, i16, i16, i16, i16, %struct.sigio*, i64, %struct.anon.52, %struct.sockbuf, %struct.sockbuf, %struct.ucred*, %struct.label*, %struct.label*, i64, i8*, %struct.so_accf*, i32, i32 }
%struct.protosw = type opaque
%struct.anon.49 = type { %struct.socket*, %struct.socket** }
%struct.anon.50 = type { %struct.socket*, %struct.socket** }
%struct.anon.51 = type { %struct.socket*, %struct.socket** }
%struct.anon.52 = type { %struct.aiocblist*, %struct.aiocblist** }
%struct.aiocblist = type opaque
%struct.sockbuf = type { %struct.selinfo, %struct.mtx, %struct.sx, i16, %struct.mbuf*, %struct.mbuf*, %struct.mbuf*, %struct.mbuf*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16, i32 (%struct.socket*, i8*, i32)*, i8* }
%struct.selinfo = type { %struct.selfdlist, %struct.knlist, %struct.mtx* }
%struct.selfdlist = type { %struct.selfd*, %struct.selfd** }
%struct.selfd = type opaque
%struct.mbuf = type opaque
%struct.so_accf = type { %struct.accept_filter*, i8*, i8* }
%struct.accept_filter = type { [16 x i8], i32 (%struct.socket*, i8*, i32)*, i8* (%struct.socket*, i8*)*, void (%struct.socket*)*, %struct.anon.53 }
%struct.anon.53 = type { %struct.accept_filter* }
%struct.inpcb = type { %struct.anon.54, %struct.anon.55, %struct.anon.56, i8*, %struct.inpcbinfo*, %struct.inpcbgroup*, %struct.anon.58, %struct.socket*, %struct.ucred*, i32, i32, i32, i8, i8, i8, i8, i32, i32, [5 x i8*], [6 x i32], %struct.in_conninfo, %struct.label*, %struct.inpcbpolicy*, %struct.anon.61, %struct.anon.62, %struct.anon.63, %struct.inpcbport*, i64, %struct.llentry*, %struct.rtentry*, %struct.rwlock }
%struct.anon.54 = type { %struct.inpcb*, %struct.inpcb** }
%struct.anon.55 = type { %struct.inpcb*, %struct.inpcb** }
%struct.anon.56 = type { %struct.inpcb*, %struct.inpcb** }
%struct.inpcbinfo = type { %struct.rwlock, %struct.inpcbhead*, i32, i64, i16, i16, i16, %struct.uma_zone*, %struct.inpcbgroup*, i32, i32, %struct.rwlock, %struct.inpcbhead*, i64, %struct.inpcbporthead*, i64, %struct.inpcbhead*, i64, %struct.vnet*, [2 x i8*] }
%struct.uma_zone = type opaque
%struct.inpcbporthead = type { %struct.inpcbport* }
%struct.inpcbhead = type { %struct.inpcb* }
%struct.inpcbgroup = type { %struct.inpcbhead*, i64, i32, %struct.mtx, [72 x i8] }
%struct.anon.58 = type { %struct.inpcb*, %struct.inpcb** }
%struct.in_conninfo = type { i8, i8, i16, %struct.in_endpoints }
%struct.in_endpoints = type { i16, i16, %union.anon.59, %union.anon.60 }
%union.anon.59 = type { %struct.in_addr_4in6 }
%struct.in_addr_4in6 = type { [3 x i32], %struct.in_addr }
%union.anon.60 = type { %struct.in_addr_4in6 }
%struct.inpcbpolicy = type opaque
%struct.anon.61 = type { i8, %struct.mbuf*, %struct.ip_moptions* }
%struct.ip_moptions = type opaque
%struct.anon.62 = type { %struct.mbuf*, %struct.ip6_pktopts*, %struct.ip6_moptions*, %struct.icmp6_filter*, i32, i16 }
%struct.ip6_pktopts = type opaque
%struct.ip6_moptions = type opaque
%struct.icmp6_filter = type opaque
%struct.anon.63 = type { %struct.inpcb*, %struct.inpcb** }
%struct.inpcbport = type { %struct.anon.57, %struct.inpcbhead, i16 }
%struct.anon.57 = type { %struct.inpcbport*, %struct.inpcbport** }
%struct.llentry = type opaque
%struct.rtentry = type opaque
%struct.rwlock = type { %struct.lock_object, i64 }
%struct.xucred = type { i32, i32, i16, [16 x i32], i8* }
%struct.getlogin_args = type { [0 x i8], i8*, [0 x i8], [0 x i8], i32, [4 x i8] }
%struct.setlogin_args = type { [0 x i8], i8*, [0 x i8] }

@M_CRED_init_sys_init = internal global %struct.sysinit { i32 25165824, i32 1, void (i8*)* @malloc_init, i8* bitcast ([1 x %struct.malloc_type]* @M_CRED to i8*) }, align 8
@__set_sysinit_set_sym_M_CRED_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @M_CRED_init_sys_init to i8*), section "set_sysinit_set", align 8
@M_CRED_uninit_sys_uninit = internal global %struct.sysinit { i32 25165824, i32 268435455, void (i8*)* @malloc_uninit, i8* bitcast ([1 x %struct.malloc_type]* @M_CRED to i8*) }, align 8
@__set_sysuninit_set_sym_M_CRED_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @M_CRED_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sysctl___security_bsd = internal global %struct.sysctl_oid { %struct.sysctl_oid_list* @sysctl__security_children, %struct.anon zeroinitializer, i32 -1, i32 -1073741823, i8* bitcast (%struct.sysctl_oid_list* @sysctl__security_bsd_children to i8*), i64 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)* null, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str20, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str21, i32 0, i32 0) }, align 8
@__set_sysctl_set_sym_sysctl___security_bsd = internal constant i8* bitcast (%struct.sysctl_oid* @sysctl___security_bsd to i8*), section "set_sysctl_set", align 8
@.emptystring = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str = private unnamed_addr constant [66 x i8] c"/usr/home/robert/p4/projects/ctsrd/tesla/src/sys/kern/kern_prot.c\00", align 1
@M_TEMP = external global [1 x %struct.malloc_type]
@M_PGRP = external global [1 x %struct.malloc_type]
@M_SESSION = external global [1 x %struct.malloc_type]
@proctree_lock = external global %struct.sx
@.str1 = private unnamed_addr constant [35 x i8] c"setpgid failed and newpgrp is NULL\00", align 1
@ngroups_max = external global i32
@sysctl___security_bsd_see_other_uids = internal global %struct.sysctl_oid { %struct.sysctl_oid_list* @sysctl__security_bsd_children, %struct.anon zeroinitializer, i32 -1, i32 -1073479678, i8* bitcast (i32* @see_other_uids to i8*), i64 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str17, i32 0, i32 0), i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)* @sysctl_handle_int, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str11, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str18, i32 0, i32 0) }, align 8
@__set_sysctl_set_sym_sysctl___security_bsd_see_other_uids = internal constant i8* bitcast (%struct.sysctl_oid* @sysctl___security_bsd_see_other_uids to i8*), section "set_sysctl_set", align 8
@sysctl___security_bsd_see_other_gids = internal global %struct.sysctl_oid { %struct.sysctl_oid_list* @sysctl__security_bsd_children, %struct.anon zeroinitializer, i32 -1, i32 -1073479678, i8* bitcast (i32* @see_other_gids to i8*), i64 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str15, i32 0, i32 0), i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)* @sysctl_handle_int, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str11, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str16, i32 0, i32 0) }, align 8
@__set_sysctl_set_sym_sysctl___security_bsd_see_other_gids = internal constant i8* bitcast (%struct.sysctl_oid* @sysctl___security_bsd_see_other_gids to i8*), section "set_sysctl_set", align 8
@.str2 = private unnamed_addr constant [21 x i8] c"%s: td not curthread\00", align 1
@__func__.p_cansee = private unnamed_addr constant [9 x i8] c"p_cansee\00", align 1
@sysctl___security_bsd_conservative_signals = internal global %struct.sysctl_oid { %struct.sysctl_oid_list* @sysctl__security_bsd_children, %struct.anon zeroinitializer, i32 -1, i32 -1073479678, i8* bitcast (i32* @conservative_signals to i8*), i64 0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str13, i32 0, i32 0), i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)* @sysctl_handle_int, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str11, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([106 x i8], [106 x i8]* @.str14, i32 0, i32 0) }, align 8
@__set_sysctl_set_sym_sysctl___security_bsd_conservative_signals = internal constant i8* bitcast (%struct.sysctl_oid* @sysctl___security_bsd_conservative_signals to i8*), section "set_sysctl_set", align 8
@conservative_signals = internal global i32 1, align 4
@__func__.p_cansignal = private unnamed_addr constant [12 x i8] c"p_cansignal\00", align 1
@__func__.p_cansched = private unnamed_addr constant [11 x i8] c"p_cansched\00", align 1
@sysctl___security_bsd_unprivileged_proc_debug = internal global %struct.sysctl_oid { %struct.sysctl_oid_list* @sysctl__security_bsd_children, %struct.anon zeroinitializer, i32 -1, i32 -1073479678, i8* bitcast (i32* @unprivileged_proc_debug to i8*), i64 0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str10, i32 0, i32 0), i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)* @sysctl_handle_int, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str11, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str12, i32 0, i32 0) }, align 8
@__set_sysctl_set_sym_sysctl___security_bsd_unprivileged_proc_debug = internal constant i8* bitcast (%struct.sysctl_oid* @sysctl___security_bsd_unprivileged_proc_debug to i8*), section "set_sysctl_set", align 8
@__func__.p_candebug = private unnamed_addr constant [11 x i8] c"p_candebug\00", align 1
@unprivileged_proc_debug = internal global i32 1, align 4
@initproc = external global %struct.proc*
@__func__.p_canwait = private unnamed_addr constant [10 x i8] c"p_canwait\00", align 1
@M_CRED = internal global [1 x %struct.malloc_type] [%struct.malloc_type { %struct.malloc_type* null, i64 877983977, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str9, i32 0, i32 0), i8* null }], align 16
@.str3 = private unnamed_addr constant [23 x i8] c"bad ucred refcount: %d\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"dangling reference to ucred\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"crcopy of shared ucred\00", align 1
@sysctl__security_bsd_children = common global %struct.sysctl_oid_list zeroinitializer, align 8
@.str6 = private unnamed_addr constant [24 x i8] c"cr_ngroups is too small\00", align 1
@.str7 = private unnamed_addr constant [21 x i8] c"negative refcount %p\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"refcount %p overflowed\00", align 1
@.str9 = private unnamed_addr constant [5 x i8] c"cred\00", align 1
@.str10 = private unnamed_addr constant [24 x i8] c"unprivileged_proc_debug\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str12 = private unnamed_addr constant [60 x i8] c"Unprivileged processes may use process debugging facilities\00", align 1
@.str13 = private unnamed_addr constant [21 x i8] c"conservative_signals\00", align 1
@.str14 = private unnamed_addr constant [106 x i8] c"Unprivileged processes prevented from sending certain signals to processes whose credentials have changed\00", align 1
@see_other_gids = internal global i32 1, align 4
@see_other_uids = internal global i32 1, align 4
@.str15 = private unnamed_addr constant [15 x i8] c"see_other_gids\00", align 1
@.str16 = private unnamed_addr constant [72 x i8] c"Unprivileged processes may see subjects/objects with different real gid\00", align 1
@.str17 = private unnamed_addr constant [15 x i8] c"see_other_uids\00", align 1
@.str18 = private unnamed_addr constant [72 x i8] c"Unprivileged processes may see subjects/objects with different real uid\00", align 1
@sysctl__security_children = external global %struct.sysctl_oid_list
@.str19 = private unnamed_addr constant [4 x i8] c"bsd\00", align 1
@.str20 = private unnamed_addr constant [2 x i8] c"N\00", align 1
@.str21 = private unnamed_addr constant [20 x i8] c"BSD security policy\00", align 1
@llvm.used = appending global [7 x i8*] [i8* bitcast (i8** @__set_sysinit_set_sym_M_CRED_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_M_CRED_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysctl_set_sym_sysctl___security_bsd to i8*), i8* bitcast (i8** @__set_sysctl_set_sym_sysctl___security_bsd_see_other_uids to i8*), i8* bitcast (i8** @__set_sysctl_set_sym_sysctl___security_bsd_see_other_gids to i8*), i8* bitcast (i8** @__set_sysctl_set_sym_sysctl___security_bsd_conservative_signals to i8*), i8* bitcast (i8** @__set_sysctl_set_sym_sysctl___security_bsd_unprivileged_proc_debug to i8*)], section "llvm.metadata"

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getpid(%struct.thread* %td, %struct.getpid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getpid_args*, align 8
  %p = alloca %struct.proc*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getpid_args* %uap, %struct.getpid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pid = getelementptr inbounds %struct.proc, %struct.proc* %2, i32 0, i32 12
  %3 = load i32, i32* %p_pid, align 4
  %conv = sext i32 %3 to i64
  %4 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %4, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getppid(%struct.thread* %td, %struct.getppid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getppid_args*, align 8
  %p = alloca %struct.proc*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getppid_args* %uap, %struct.getppid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %2, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 128) #5
  %3 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pptr = getelementptr inbounds %struct.proc, %struct.proc* %3, i32 0, i32 15
  %4 = load %struct.proc*, %struct.proc** %p_pptr, align 8
  %p_pid = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 12
  %5 = load i32, i32* %p_pid, align 4
  %conv = sext i32 %5 to i64
  %6 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %6, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx1 = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 18
  %mtx_lock2 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx1, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock2, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 130) #5
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_lock_flags(i64*, i32, i8*, i32) #1

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_unlock_flags(i64*, i32, i8*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getpgrp(%struct.thread* %td, %struct.getpgrp_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getpgrp_args*, align 8
  %p = alloca %struct.proc*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getpgrp_args* %uap, %struct.getpgrp_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %2, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 147) #5
  %3 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %3, i32 0, i32 55
  %4 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_id = getelementptr inbounds %struct.pgrp, %struct.pgrp* %4, i32 0, i32 4
  %5 = load i32, i32* %pg_id, align 4
  %conv = sext i32 %5 to i64
  %6 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %6, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx1 = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 18
  %mtx_lock2 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx1, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock2, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 149) #5
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getpgid(%struct.thread* %td, %struct.getpgid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getpgid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getpgid_args* %uap, %struct.getpgid_args** %uap.addr, align 8
  %0 = load %struct.getpgid_args*, %struct.getpgid_args** %uap.addr, align 8
  %pid = getelementptr inbounds %struct.getpgid_args, %struct.getpgid_args* %0, i32 0, i32 1
  %1 = load i32, i32* %pid, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 1
  %3 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %3, %struct.proc** %p, align 8
  %4 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 167) #5
  br label %if.end9

if.else:                                          ; preds = %entry
  %5 = load %struct.getpgid_args*, %struct.getpgid_args** %uap.addr, align 8
  %pid1 = getelementptr inbounds %struct.getpgid_args, %struct.getpgid_args* %5, i32 0, i32 1
  %6 = load i32, i32* %pid1, align 4
  %call = call %struct.proc* @pfind(i32 %6) #5
  store %struct.proc* %call, %struct.proc** %p, align 8
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %cmp2 = icmp eq %struct.proc* %7, null
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  store i32 3, i32* %retval
  br label %return

if.end:                                           ; preds = %if.else
  %8 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %9 = load %struct.proc*, %struct.proc** %p, align 8
  %call4 = call i32 @p_cansee(%struct.thread* %8, %struct.proc* %9) #5
  store i32 %call4, i32* %error, align 4
  %10 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %11 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx6 = getelementptr inbounds %struct.proc, %struct.proc* %11, i32 0, i32 18
  %mtx_lock7 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx6, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock7, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 174) #5
  %12 = load i32, i32* %error, align 4
  store i32 %12, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then
  %13 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %13, i32 0, i32 55
  %14 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_id = getelementptr inbounds %struct.pgrp, %struct.pgrp* %14, i32 0, i32 4
  %15 = load i32, i32* %pg_id, align 4
  %conv = sext i32 %15 to i64
  %16 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %16, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  %17 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx10 = getelementptr inbounds %struct.proc, %struct.proc* %17, i32 0, i32 18
  %mtx_lock11 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx10, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock11, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 179) #5
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end9, %if.then5, %if.then3
  %18 = load i32, i32* %retval
  ret i32 %18
}

; Function Attrs: noimplicitfloat noredzone
declare %struct.proc* @pfind(i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @p_cansee(%struct.thread* %td, %struct.proc* %p) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %p.addr = alloca %struct.proc*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call %struct.thread* @__curthread() #6
  %cmp = icmp eq %struct.thread* %0, %call
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @__func__.p_cansee, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1434) #5
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 37
  %3 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %4 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 3
  %5 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  %call1 = call i32 @cr_cansee(%struct.ucred* %3, %struct.ucred* %5) #5
  ret i32 %call1
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getsid(%struct.thread* %td, %struct.getsid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getsid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getsid_args* %uap, %struct.getsid_args** %uap.addr, align 8
  %0 = load %struct.getsid_args*, %struct.getsid_args** %uap.addr, align 8
  %pid = getelementptr inbounds %struct.getsid_args, %struct.getsid_args* %0, i32 0, i32 1
  %1 = load i32, i32* %pid, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 1
  %3 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %3, %struct.proc** %p, align 8
  %4 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 199) #5
  br label %if.end9

if.else:                                          ; preds = %entry
  %5 = load %struct.getsid_args*, %struct.getsid_args** %uap.addr, align 8
  %pid1 = getelementptr inbounds %struct.getsid_args, %struct.getsid_args* %5, i32 0, i32 1
  %6 = load i32, i32* %pid1, align 4
  %call = call %struct.proc* @pfind(i32 %6) #5
  store %struct.proc* %call, %struct.proc** %p, align 8
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %cmp2 = icmp eq %struct.proc* %7, null
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  store i32 3, i32* %retval
  br label %return

if.end:                                           ; preds = %if.else
  %8 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %9 = load %struct.proc*, %struct.proc** %p, align 8
  %call4 = call i32 @p_cansee(%struct.thread* %8, %struct.proc* %9) #5
  store i32 %call4, i32* %error, align 4
  %10 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then5, label %if.end8

if.then5:                                         ; preds = %if.end
  %11 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx6 = getelementptr inbounds %struct.proc, %struct.proc* %11, i32 0, i32 18
  %mtx_lock7 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx6, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock7, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 206) #5
  %12 = load i32, i32* %error, align 4
  store i32 %12, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then
  %13 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %13, i32 0, i32 55
  %14 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_session = getelementptr inbounds %struct.pgrp, %struct.pgrp* %14, i32 0, i32 2
  %15 = load %struct.session*, %struct.session** %pg_session, align 8
  %s_sid = getelementptr inbounds %struct.session, %struct.session* %15, i32 0, i32 5
  %16 = load i32, i32* %s_sid, align 4
  %conv = sext i32 %16 to i64
  %17 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %17, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  %18 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx10 = getelementptr inbounds %struct.proc, %struct.proc* %18, i32 0, i32 18
  %mtx_lock11 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx10, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock11, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 211) #5
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end9, %if.then5, %if.then3
  %19 = load i32, i32* %retval
  ret i32 %19
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getuid(%struct.thread* %td, %struct.getuid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getuid_args*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getuid_args* %uap, %struct.getuid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 2
  %2 = load i32, i32* %cr_ruid, align 4
  %conv = zext i32 %2 to i64
  %3 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %3, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_geteuid(%struct.thread* %td, %struct.geteuid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.geteuid_args*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.geteuid_args* %uap, %struct.geteuid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 1
  %2 = load i32, i32* %cr_uid, align 4
  %conv = zext i32 %2 to i64
  %3 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %3, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getgid(%struct.thread* %td, %struct.getgid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getgid_args*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getgid_args* %uap, %struct.getgid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 5
  %2 = load i32, i32* %cr_rgid, align 4
  %conv = zext i32 %2 to i64
  %3 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %3, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getegid(%struct.thread* %td, %struct.getegid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getegid_args*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getegid_args* %uap, %struct.getegid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 15
  %2 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0
  %3 = load i32, i32* %arrayidx, align 4
  %conv = zext i32 %3 to i64
  %4 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %4, i32 0, i32 78
  %arrayidx1 = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx1, align 8
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getgroups(%struct.thread* %td, %struct.getgroups_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getgroups_args*, align 8
  %groups = alloca i32*, align 8
  %ngrp = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getgroups_args* %uap, %struct.getgroups_args** %uap.addr, align 8
  %0 = load %struct.getgroups_args*, %struct.getgroups_args** %uap.addr, align 8
  %gidsetsize = getelementptr inbounds %struct.getgroups_args, %struct.getgroups_args* %0, i32 0, i32 1
  %1 = load i32, i32* %gidsetsize, align 4
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 37
  %3 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %3, i32 0, i32 4
  %4 = load i32, i32* %cr_ngroups, align 4
  %cmp = icmp ult i32 %1, %4
  br i1 %cmp, label %if.then, label %if.else4

if.then:                                          ; preds = %entry
  %5 = load %struct.getgroups_args*, %struct.getgroups_args** %uap.addr, align 8
  %gidsetsize1 = getelementptr inbounds %struct.getgroups_args, %struct.getgroups_args* %5, i32 0, i32 1
  %6 = load i32, i32* %gidsetsize1, align 4
  %cmp2 = icmp eq i32 %6, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  store i32 0, i32* %ngrp, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  store i32 22, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then3
  br label %if.end7

if.else4:                                         ; preds = %entry
  %7 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred5 = getelementptr inbounds %struct.thread, %struct.thread* %7, i32 0, i32 37
  %8 = load %struct.ucred*, %struct.ucred** %td_ucred5, align 8
  %cr_ngroups6 = getelementptr inbounds %struct.ucred, %struct.ucred* %8, i32 0, i32 4
  %9 = load i32, i32* %cr_ngroups6, align 4
  store i32 %9, i32* %ngrp, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else4, %if.end
  %10 = load i32, i32* %ngrp, align 4
  %conv = zext i32 %10 to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0), i32 2) #5
  %11 = bitcast i8* %call to i32*
  store i32* %11, i32** %groups, align 8
  %12 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %13 = load i32*, i32** %groups, align 8
  %call8 = call i32 @kern_getgroups(%struct.thread* %12, i32* %ngrp, i32* %13) #5
  store i32 %call8, i32* %error, align 4
  %14 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %14, 0
  br i1 %tobool, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  br label %out

if.end10:                                         ; preds = %if.end7
  %15 = load %struct.getgroups_args*, %struct.getgroups_args** %uap.addr, align 8
  %gidsetsize11 = getelementptr inbounds %struct.getgroups_args, %struct.getgroups_args* %15, i32 0, i32 1
  %16 = load i32, i32* %gidsetsize11, align 4
  %cmp12 = icmp ugt i32 %16, 0
  br i1 %cmp12, label %if.then14, label %if.end18

if.then14:                                        ; preds = %if.end10
  %17 = load i32*, i32** %groups, align 8
  %18 = bitcast i32* %17 to i8*
  %19 = load %struct.getgroups_args*, %struct.getgroups_args** %uap.addr, align 8
  %gidset = getelementptr inbounds %struct.getgroups_args, %struct.getgroups_args* %19, i32 0, i32 4
  %20 = load i32*, i32** %gidset, align 8
  %21 = bitcast i32* %20 to i8*
  %22 = load i32, i32* %ngrp, align 4
  %conv15 = zext i32 %22 to i64
  %mul16 = mul i64 %conv15, 4
  %call17 = call i32 @copyout(i8* %18, i8* %21, i64 %mul16) #5
  store i32 %call17, i32* %error, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then14, %if.end10
  %23 = load i32, i32* %error, align 4
  %cmp19 = icmp eq i32 %23, 0
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end18
  %24 = load i32, i32* %ngrp, align 4
  %conv22 = zext i32 %24 to i64
  %25 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %25, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv22, i64* %arrayidx, align 8
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end18
  br label %out

out:                                              ; preds = %if.end23, %if.then9
  %26 = load i32*, i32** %groups, align 8
  %27 = bitcast i32* %26 to i8*
  call void @free(i8* %27, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0)) #5
  %28 = load i32, i32* %error, align 4
  store i32 %28, i32* %retval
  br label %return

return:                                           ; preds = %out, %if.else
  %29 = load i32, i32* %retval
  ret i32 %29
}

; Function Attrs: noimplicitfloat noredzone
declare noalias i8* @malloc(i64, %struct.malloc_type*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @kern_getgroups(%struct.thread* %td, i32* %ngrp, i32* %groups) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %ngrp.addr = alloca i32*, align 8
  %groups.addr = alloca i32*, align 8
  %cred = alloca %struct.ucred*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store i32* %ngrp, i32** %ngrp.addr, align 8
  store i32* %groups, i32** %groups.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  store %struct.ucred* %1, %struct.ucred** %cred, align 8
  %2 = load i32*, i32** %ngrp.addr, align 8
  %3 = load i32, i32* %2, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %4, i32 0, i32 4
  %5 = load i32, i32* %cr_ngroups, align 4
  %6 = load i32*, i32** %ngrp.addr, align 8
  store i32 %5, i32* %6, align 4
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %7 = load i32*, i32** %ngrp.addr, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_ngroups1 = getelementptr inbounds %struct.ucred, %struct.ucred* %9, i32 0, i32 4
  %10 = load i32, i32* %cr_ngroups1, align 4
  %cmp2 = icmp ult i32 %8, %10
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 22, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %11 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_ngroups5 = getelementptr inbounds %struct.ucred, %struct.ucred* %11, i32 0, i32 4
  %12 = load i32, i32* %cr_ngroups5, align 4
  %13 = load i32*, i32** %ngrp.addr, align 8
  store i32 %12, i32* %13, align 4
  %14 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %14, i32 0, i32 15
  %15 = load i32*, i32** %cr_groups, align 8
  %16 = bitcast i32* %15 to i8*
  %17 = load i32*, i32** %groups.addr, align 8
  %18 = bitcast i32* %17 to i8*
  %19 = load i32*, i32** %ngrp.addr, align 8
  %20 = load i32, i32* %19, align 4
  %conv = zext i32 %20 to i64
  %mul = mul i64 %conv, 4
  call void @bcopy(i8* %16, i8* %18, i64 %mul) #5
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %21 = load i32, i32* %retval
  ret i32 %21
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @copyout(i8*, i8*, i64) #1

; Function Attrs: noimplicitfloat noredzone
declare void @free(i8*, %struct.malloc_type*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @bcopy(i8*, i8*, i64) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setsid(%struct.thread* %td, %struct.setsid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setsid_args*, align 8
  %pgrp = alloca %struct.pgrp*, align 8
  %error = alloca i32, align 4
  %p = alloca %struct.proc*, align 8
  %newpgrp = alloca %struct.pgrp*, align 8
  %newsess = alloca %struct.session*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setsid_args* %uap, %struct.setsid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  store i32 0, i32* %error, align 4
  store %struct.pgrp* null, %struct.pgrp** %pgrp, align 8
  %call = call noalias i8* @malloc(i64 80, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_PGRP, i32 0, i32 0), i32 258) #5
  %2 = bitcast i8* %call to %struct.pgrp*
  store %struct.pgrp* %2, %struct.pgrp** %newpgrp, align 8
  %call1 = call noalias i8* @malloc(i64 120, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_SESSION, i32 0, i32 0), i32 258) #5
  %3 = bitcast i8* %call1 to %struct.session*
  store %struct.session* %3, %struct.session** %newsess, align 8
  %call2 = call i32 @_sx_xlock(%struct.sx* @proctree_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 353) #5
  %4 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 55
  %5 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_id = getelementptr inbounds %struct.pgrp, %struct.pgrp* %5, i32 0, i32 4
  %6 = load i32, i32* %pg_id, align 4
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pid = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 12
  %8 = load i32, i32* %p_pid, align 4
  %cmp = icmp eq i32 %6, %8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %9 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pid3 = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 12
  %10 = load i32, i32* %p_pid3, align 4
  %call4 = call %struct.pgrp* @pgfind(i32 %10) #5
  store %struct.pgrp* %call4, %struct.pgrp** %pgrp, align 8
  %cmp5 = icmp ne %struct.pgrp* %call4, null
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %11 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %cmp6 = icmp ne %struct.pgrp* %11, null
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  %12 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %pg_mtx = getelementptr inbounds %struct.pgrp, %struct.pgrp* %12, i32 0, i32 6
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %pg_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 357) #5
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  store i32 1, i32* %error, align 4
  br label %if.end11

if.else:                                          ; preds = %lor.lhs.false
  %13 = load %struct.proc*, %struct.proc** %p, align 8
  %14 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pid8 = getelementptr inbounds %struct.proc, %struct.proc* %14, i32 0, i32 12
  %15 = load i32, i32* %p_pid8, align 4
  %16 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %17 = load %struct.session*, %struct.session** %newsess, align 8
  %call9 = call i32 @enterpgrp(%struct.proc* %13, i32 %15, %struct.pgrp* %16, %struct.session* %17) #5
  %18 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pid10 = getelementptr inbounds %struct.proc, %struct.proc* %18, i32 0, i32 12
  %19 = load i32, i32* %p_pid10, align 4
  %conv = sext i32 %19 to i64
  %20 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %20, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  store %struct.pgrp* null, %struct.pgrp** %newpgrp, align 8
  store %struct.session* null, %struct.session** %newsess, align 8
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.end
  call void @_sx_xunlock(%struct.sx* @proctree_lock, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 366) #5
  %21 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %cmp12 = icmp ne %struct.pgrp* %21, null
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  %22 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %23 = bitcast %struct.pgrp* %22 to i8*
  call void @free(i8* %23, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_PGRP, i32 0, i32 0)) #5
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end11
  %24 = load %struct.session*, %struct.session** %newsess, align 8
  %cmp16 = icmp ne %struct.session* %24, null
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  %25 = load %struct.session*, %struct.session** %newsess, align 8
  %26 = bitcast %struct.session* %25 to i8*
  call void @free(i8* %26, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_SESSION, i32 0, i32 0)) #5
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end15
  %27 = load i32, i32* %error, align 4
  ret i32 %27
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @_sx_xlock(%struct.sx*, i32, i8*, i32) #1

; Function Attrs: noimplicitfloat noredzone
declare %struct.pgrp* @pgfind(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @enterpgrp(%struct.proc*, i32, %struct.pgrp*, %struct.session*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @_sx_xunlock(%struct.sx*, i8*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setpgid(%struct.thread* %td, %struct.setpgid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setpgid_args*, align 8
  %curp = alloca %struct.proc*, align 8
  %targp = alloca %struct.proc*, align 8
  %pgrp = alloca %struct.pgrp*, align 8
  %error = alloca i32, align 4
  %newpgrp = alloca %struct.pgrp*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setpgid_args* %uap, %struct.setpgid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %curp, align 8
  %2 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pgid = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %2, i32 0, i32 4
  %3 = load i32, i32* %pgid, align 4
  %cmp = icmp slt i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 22, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %error, align 4
  %call = call noalias i8* @malloc(i64 80, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_PGRP, i32 0, i32 0), i32 258) #5
  %4 = bitcast i8* %call to %struct.pgrp*
  store %struct.pgrp* %4, %struct.pgrp** %newpgrp, align 8
  %call1 = call i32 @_sx_xlock(%struct.sx* @proctree_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 412) #5
  %5 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pid = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %5, i32 0, i32 1
  %6 = load i32, i32* %pid, align 4
  %cmp2 = icmp ne i32 %6, 0
  br i1 %cmp2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %7 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pid3 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %7, i32 0, i32 1
  %8 = load i32, i32* %pid3, align 4
  %9 = load %struct.proc*, %struct.proc** %curp, align 8
  %p_pid = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 12
  %10 = load i32, i32* %p_pid, align 4
  %cmp4 = icmp ne i32 %8, %10
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %land.lhs.true
  %11 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pid6 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %11, i32 0, i32 1
  %12 = load i32, i32* %pid6, align 4
  %call7 = call %struct.proc* @pfind(i32 %12) #5
  store %struct.proc* %call7, %struct.proc** %targp, align 8
  %cmp8 = icmp eq %struct.proc* %call7, null
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then5
  store i32 3, i32* %error, align 4
  br label %done

if.end10:                                         ; preds = %if.then5
  %13 = load %struct.proc*, %struct.proc** %targp, align 8
  %call11 = call i32 @inferior(%struct.proc* %13) #5
  %tobool = icmp ne i32 %call11, 0
  br i1 %tobool, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end10
  %14 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %14, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 419) #5
  store i32 3, i32* %error, align 4
  br label %done

if.end13:                                         ; preds = %if.end10
  %15 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %16 = load %struct.proc*, %struct.proc** %targp, align 8
  %call14 = call i32 @p_cansee(%struct.thread* %15, %struct.proc* %16) #5
  store i32 %call14, i32* %error, align 4
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end13
  %17 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_mtx17 = getelementptr inbounds %struct.proc, %struct.proc* %17, i32 0, i32 18
  %mtx_lock18 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx17, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock18, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 424) #5
  br label %done

if.end19:                                         ; preds = %if.end13
  %18 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %18, i32 0, i32 55
  %19 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %cmp20 = icmp eq %struct.pgrp* %19, null
  br i1 %cmp20, label %if.then25, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end19
  %20 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pgrp21 = getelementptr inbounds %struct.proc, %struct.proc* %20, i32 0, i32 55
  %21 = load %struct.pgrp*, %struct.pgrp** %p_pgrp21, align 8
  %pg_session = getelementptr inbounds %struct.pgrp, %struct.pgrp* %21, i32 0, i32 2
  %22 = load %struct.session*, %struct.session** %pg_session, align 8
  %23 = load %struct.proc*, %struct.proc** %curp, align 8
  %p_pgrp22 = getelementptr inbounds %struct.proc, %struct.proc* %23, i32 0, i32 55
  %24 = load %struct.pgrp*, %struct.pgrp** %p_pgrp22, align 8
  %pg_session23 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %24, i32 0, i32 2
  %25 = load %struct.session*, %struct.session** %pg_session23, align 8
  %cmp24 = icmp ne %struct.session* %22, %25
  br i1 %cmp24, label %if.then25, label %if.end28

if.then25:                                        ; preds = %lor.lhs.false, %if.end19
  %26 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_mtx26 = getelementptr inbounds %struct.proc, %struct.proc* %26, i32 0, i32 18
  %mtx_lock27 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx26, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock27, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 429) #5
  store i32 1, i32* %error, align 4
  br label %done

if.end28:                                         ; preds = %lor.lhs.false
  %27 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_flag = getelementptr inbounds %struct.proc, %struct.proc* %27, i32 0, i32 10
  %28 = load i32, i32* %p_flag, align 4
  %and = and i32 %28, 16384
  %tobool29 = icmp ne i32 %and, 0
  br i1 %tobool29, label %if.then30, label %if.end33

if.then30:                                        ; preds = %if.end28
  %29 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_mtx31 = getelementptr inbounds %struct.proc, %struct.proc* %29, i32 0, i32 18
  %mtx_lock32 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx31, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock32, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 434) #5
  store i32 13, i32* %error, align 4
  br label %done

if.end33:                                         ; preds = %if.end28
  %30 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_mtx34 = getelementptr inbounds %struct.proc, %struct.proc* %30, i32 0, i32 18
  %mtx_lock35 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx34, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock35, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 438) #5
  br label %if.end36

if.else:                                          ; preds = %land.lhs.true, %if.end
  %31 = load %struct.proc*, %struct.proc** %curp, align 8
  store %struct.proc* %31, %struct.proc** %targp, align 8
  br label %if.end36

if.end36:                                         ; preds = %if.else, %if.end33
  %32 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pgrp37 = getelementptr inbounds %struct.proc, %struct.proc* %32, i32 0, i32 55
  %33 = load %struct.pgrp*, %struct.pgrp** %p_pgrp37, align 8
  %pg_session38 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %33, i32 0, i32 2
  %34 = load %struct.session*, %struct.session** %pg_session38, align 8
  %s_leader = getelementptr inbounds %struct.session, %struct.session* %34, i32 0, i32 1
  %35 = load %struct.proc*, %struct.proc** %s_leader, align 8
  %36 = load %struct.proc*, %struct.proc** %targp, align 8
  %cmp39 = icmp eq %struct.proc* %35, %36
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end36
  store i32 1, i32* %error, align 4
  br label %done

if.end41:                                         ; preds = %if.end36
  %37 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pgid42 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %37, i32 0, i32 4
  %38 = load i32, i32* %pgid42, align 4
  %cmp43 = icmp eq i32 %38, 0
  br i1 %cmp43, label %if.then44, label %if.end47

if.then44:                                        ; preds = %if.end41
  %39 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pid45 = getelementptr inbounds %struct.proc, %struct.proc* %39, i32 0, i32 12
  %40 = load i32, i32* %p_pid45, align 4
  %41 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pgid46 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %41, i32 0, i32 4
  store i32 %40, i32* %pgid46, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then44, %if.end41
  %42 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pgid48 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %42, i32 0, i32 4
  %43 = load i32, i32* %pgid48, align 4
  %call49 = call %struct.pgrp* @pgfind(i32 %43) #5
  store %struct.pgrp* %call49, %struct.pgrp** %pgrp, align 8
  %cmp50 = icmp eq %struct.pgrp* %call49, null
  br i1 %cmp50, label %if.then51, label %if.else63

if.then51:                                        ; preds = %if.end47
  %44 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pgid52 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %44, i32 0, i32 4
  %45 = load i32, i32* %pgid52, align 4
  %46 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pid53 = getelementptr inbounds %struct.proc, %struct.proc* %46, i32 0, i32 12
  %47 = load i32, i32* %p_pid53, align 4
  %cmp54 = icmp eq i32 %45, %47
  br i1 %cmp54, label %if.then55, label %if.else61

if.then55:                                        ; preds = %if.then51
  %48 = load %struct.proc*, %struct.proc** %targp, align 8
  %49 = load %struct.setpgid_args*, %struct.setpgid_args** %uap.addr, align 8
  %pgid56 = getelementptr inbounds %struct.setpgid_args, %struct.setpgid_args* %49, i32 0, i32 4
  %50 = load i32, i32* %pgid56, align 4
  %51 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %call57 = call i32 @enterpgrp(%struct.proc* %48, i32 %50, %struct.pgrp* %51, %struct.session* null) #5
  store i32 %call57, i32* %error, align 4
  %52 = load i32, i32* %error, align 4
  %cmp58 = icmp eq i32 %52, 0
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.then55
  store %struct.pgrp* null, %struct.pgrp** %newpgrp, align 8
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.then55
  br label %if.end62

if.else61:                                        ; preds = %if.then51
  store i32 1, i32* %error, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.else61, %if.end60
  br label %if.end83

if.else63:                                        ; preds = %if.end47
  %53 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %54 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pgrp64 = getelementptr inbounds %struct.proc, %struct.proc* %54, i32 0, i32 55
  %55 = load %struct.pgrp*, %struct.pgrp** %p_pgrp64, align 8
  %cmp65 = icmp eq %struct.pgrp* %53, %55
  br i1 %cmp65, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.else63
  %56 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %pg_mtx = getelementptr inbounds %struct.pgrp, %struct.pgrp* %56, i32 0, i32 6
  %mtx_lock67 = getelementptr inbounds %struct.mtx, %struct.mtx* %pg_mtx, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock67, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 457) #5
  br label %done

if.end68:                                         ; preds = %if.else63
  %57 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %pg_id = getelementptr inbounds %struct.pgrp, %struct.pgrp* %57, i32 0, i32 4
  %58 = load i32, i32* %pg_id, align 4
  %59 = load %struct.proc*, %struct.proc** %targp, align 8
  %p_pid69 = getelementptr inbounds %struct.proc, %struct.proc* %59, i32 0, i32 12
  %60 = load i32, i32* %p_pid69, align 4
  %cmp70 = icmp ne i32 %58, %60
  br i1 %cmp70, label %land.lhs.true71, label %if.end79

land.lhs.true71:                                  ; preds = %if.end68
  %61 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %pg_session72 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %61, i32 0, i32 2
  %62 = load %struct.session*, %struct.session** %pg_session72, align 8
  %63 = load %struct.proc*, %struct.proc** %curp, align 8
  %p_pgrp73 = getelementptr inbounds %struct.proc, %struct.proc* %63, i32 0, i32 55
  %64 = load %struct.pgrp*, %struct.pgrp** %p_pgrp73, align 8
  %pg_session74 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %64, i32 0, i32 2
  %65 = load %struct.session*, %struct.session** %pg_session74, align 8
  %cmp75 = icmp ne %struct.session* %62, %65
  br i1 %cmp75, label %if.then76, label %if.end79

if.then76:                                        ; preds = %land.lhs.true71
  %66 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %pg_mtx77 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %66, i32 0, i32 6
  %mtx_lock78 = getelementptr inbounds %struct.mtx, %struct.mtx* %pg_mtx77, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock78, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 462) #5
  store i32 1, i32* %error, align 4
  br label %done

if.end79:                                         ; preds = %land.lhs.true71, %if.end68
  %67 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %pg_mtx80 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %67, i32 0, i32 6
  %mtx_lock81 = getelementptr inbounds %struct.mtx, %struct.mtx* %pg_mtx80, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock81, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 466) #5
  %68 = load %struct.proc*, %struct.proc** %targp, align 8
  %69 = load %struct.pgrp*, %struct.pgrp** %pgrp, align 8
  %call82 = call i32 @enterthispgrp(%struct.proc* %68, %struct.pgrp* %69) #5
  store i32 %call82, i32* %error, align 4
  br label %if.end83

if.end83:                                         ; preds = %if.end79, %if.end62
  br label %done

done:                                             ; preds = %if.end83, %if.then76, %if.then66, %if.then40, %if.then30, %if.then25, %if.then16, %if.then12, %if.then9
  call void @_sx_xunlock(%struct.sx* @proctree_lock, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 470) #5
  br label %do.body

do.body:                                          ; preds = %done
  %70 = load i32, i32* %error, align 4
  %cmp84 = icmp eq i32 %70, 0
  br i1 %cmp84, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %do.body
  %71 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %cmp85 = icmp ne %struct.pgrp* %71, null
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %do.body
  %72 = phi i1 [ true, %do.body ], [ %cmp85, %lor.rhs ]
  %lnot = xor i1 %72, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool86 = icmp ne i64 %expval, 0
  br i1 %tobool86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %lor.end
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str1, i32 0, i32 0)) #5
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %lor.end
  br label %do.end

do.end:                                           ; preds = %if.end88
  %73 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %cmp89 = icmp ne %struct.pgrp* %73, null
  br i1 %cmp89, label %if.then91, label %if.end92

if.then91:                                        ; preds = %do.end
  %74 = load %struct.pgrp*, %struct.pgrp** %newpgrp, align 8
  %75 = bitcast %struct.pgrp* %74 to i8*
  call void @free(i8* %75, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_PGRP, i32 0, i32 0)) #5
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %do.end
  %76 = load i32, i32* %error, align 4
  store i32 %76, i32* %retval
  br label %return

return:                                           ; preds = %if.end92, %if.then
  %77 = load i32, i32* %retval
  ret i32 %77
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @inferior(%struct.proc*) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @enterthispgrp(%struct.proc*, %struct.pgrp*) #1

; Function Attrs: nounwind readnone
declare i64 @llvm.expect.i64(i64, i64) #2

; Function Attrs: noimplicitfloat noredzone
declare void @kassert_panic(i8*, ...) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setuid(%struct.thread* %td, %struct.setuid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setuid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %uid = alloca i32, align 4
  %uip = alloca %struct.uidinfo*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setuid_args* %uap, %struct.setuid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setuid_args*, %struct.setuid_args** %uap.addr, align 8
  %uid1 = getelementptr inbounds %struct.setuid_args, %struct.setuid_args* %2, i32 0, i32 1
  %3 = load i32, i32* %uid1, align 4
  store i32 %3, i32* %uid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %4 = load i32, i32* %td_pflags, align 4
  %and = and i32 %4, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %5 = load i32, i32* %uid, align 4
  call void @audit_arg_uid(i32 %5) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call2 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call2, %struct.ucred** %newcred, align 8
  %6 = load i32, i32* %uid, align 4
  %call3 = call %struct.uidinfo* @uifind(i32 %6) #5
  store %struct.uidinfo* %call3, %struct.uidinfo** %uip, align 8
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 509) #5
  %8 = load %struct.proc*, %struct.proc** %p, align 8
  %9 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call4 = call %struct.ucred* @crcopysafe(%struct.proc* %8, %struct.ucred* %9) #5
  store %struct.ucred* %call4, %struct.ucred** %oldcred, align 8
  %10 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %11 = load i32, i32* %uid, align 4
  %call5 = call i32 @mac_cred_check_setuid(%struct.ucred* %10, i32 %11) #5
  store i32 %call5, i32* %error, align 4
  %12 = load i32, i32* %error, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %do.end
  br label %fail

if.end8:                                          ; preds = %do.end
  %13 = load i32, i32* %uid, align 4
  %14 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %14, i32 0, i32 2
  %15 = load i32, i32* %cr_ruid, align 4
  %cmp = icmp ne i32 %13, %15
  br i1 %cmp, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.end8
  %16 = load i32, i32* %uid, align 4
  %17 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %17, i32 0, i32 1
  %18 = load i32, i32* %cr_uid, align 4
  %cmp9 = icmp ne i32 %16, %18
  br i1 %cmp9, label %land.lhs.true10, label %if.end14

land.lhs.true10:                                  ; preds = %land.lhs.true
  %19 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call11 = call i32 @priv_check_cred(%struct.ucred* %19, i32 50, i32 0) #5
  store i32 %call11, i32* %error, align 4
  %cmp12 = icmp ne i32 %call11, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %land.lhs.true10
  br label %fail

if.end14:                                         ; preds = %land.lhs.true10, %land.lhs.true, %if.end8
  %20 = load i32, i32* %uid, align 4
  %21 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid15 = getelementptr inbounds %struct.ucred, %struct.ucred* %21, i32 0, i32 2
  %22 = load i32, i32* %cr_ruid15, align 4
  %cmp16 = icmp ne i32 %20, %22
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end14
  %23 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %24 = load %struct.uidinfo*, %struct.uidinfo** %uip, align 8
  call void @change_ruid(%struct.ucred* %23, %struct.uidinfo* %24) #5
  %25 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %25) #5
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end14
  %26 = load i32, i32* %uid, align 4
  %27 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %27, i32 0, i32 3
  %28 = load i32, i32* %cr_svuid, align 4
  %cmp19 = icmp ne i32 %26, %28
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  %29 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %30 = load i32, i32* %uid, align 4
  call void @change_svuid(%struct.ucred* %29, i32 %30) #5
  %31 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %31) #5
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end18
  %32 = load i32, i32* %uid, align 4
  %33 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid22 = getelementptr inbounds %struct.ucred, %struct.ucred* %33, i32 0, i32 1
  %34 = load i32, i32* %cr_uid22, align 4
  %cmp23 = icmp ne i32 %32, %34
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end21
  %35 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %36 = load %struct.uidinfo*, %struct.uidinfo** %uip, align 8
  call void @change_euid(%struct.ucred* %35, %struct.uidinfo* %36) #5
  %37 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %37) #5
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end21
  %38 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %39 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %39, i32 0, i32 3
  store %struct.ucred* %38, %struct.ucred** %p_ucred, align 8
  %40 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx26 = getelementptr inbounds %struct.proc, %struct.proc* %40, i32 0, i32 18
  %mtx_lock27 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx26, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock27, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 589) #5
  %41 = load %struct.uidinfo*, %struct.uidinfo** %uip, align 8
  call void @uifree(%struct.uidinfo* %41) #5
  %42 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %42) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then13, %if.then7
  %43 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx28 = getelementptr inbounds %struct.proc, %struct.proc* %43, i32 0, i32 18
  %mtx_lock29 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx28, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock29, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 598) #5
  %44 = load %struct.uidinfo*, %struct.uidinfo** %uip, align 8
  call void @uifree(%struct.uidinfo* %44) #5
  %45 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %45) #5
  %46 = load i32, i32* %error, align 4
  store i32 %46, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end25
  %47 = load i32, i32* %retval
  ret i32 %47
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind readnone ssp
define internal %struct.thread* @__curthread() #3 {
entry:
  %td = alloca %struct.thread*, align 8
  %0 = call %struct.thread* asm "movq %gs:$1,$0", "=r,*m,~{dirflag},~{fpsr},~{flags}"(i8* null) #7, !srcloc !0
  store %struct.thread* %0, %struct.thread** %td, align 8
  %1 = load %struct.thread*, %struct.thread** %td, align 8
  ret %struct.thread* %1
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_uid(i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.ucred* @crget() #0 {
entry:
  %cr = alloca %struct.ucred*, align 8
  %call = call noalias i8* @malloc(i64 160, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_CRED, i32 0, i32 0), i32 258) #5
  %0 = bitcast i8* %call to %struct.ucred*
  store %struct.ucred* %0, %struct.ucred** %cr, align 8
  %1 = load %struct.ucred*, %struct.ucred** %cr, align 8
  %cr_ref = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 0
  call void @refcount_init(i32* %cr_ref, i32 1) #5
  %2 = load %struct.ucred*, %struct.ucred** %cr, align 8
  call void @audit_cred_init(%struct.ucred* %2) #5
  %3 = load %struct.ucred*, %struct.ucred** %cr, align 8
  call void @mac_cred_init(%struct.ucred* %3) #5
  %4 = load %struct.ucred*, %struct.ucred** %cr, align 8
  call void @crextend(%struct.ucred* %4, i32 16) #5
  %5 = load %struct.ucred*, %struct.ucred** %cr, align 8
  ret %struct.ucred* %5
}

; Function Attrs: noimplicitfloat noredzone
declare %struct.uidinfo* @uifind(i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.ucred* @crcopysafe(%struct.proc* %p, %struct.ucred* %cr) #0 {
entry:
  %p.addr = alloca %struct.proc*, align 8
  %cr.addr = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %groups = alloca i32, align 4
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  %0 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %0, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1961) #5
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 3
  %2 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  store %struct.ucred* %2, %struct.ucred** %oldcred, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_agroups = getelementptr inbounds %struct.ucred, %struct.ucred* %3, i32 0, i32 16
  %4 = load i32, i32* %cr_agroups, align 4
  %5 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_agroups1 = getelementptr inbounds %struct.ucred, %struct.ucred* %5, i32 0, i32 16
  %6 = load i32, i32* %cr_agroups1, align 4
  %cmp = icmp slt i32 %4, %6
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_agroups2 = getelementptr inbounds %struct.ucred, %struct.ucred* %7, i32 0, i32 16
  %8 = load i32, i32* %cr_agroups2, align 4
  store i32 %8, i32* %groups, align 4
  %9 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx3 = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 18
  %mtx_lock4 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx3, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock4, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1966) #5
  %10 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %11 = load i32, i32* %groups, align 4
  call void @crextend(%struct.ucred* %10, i32 %11) #5
  %12 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx5 = getelementptr inbounds %struct.proc, %struct.proc* %12, i32 0, i32 18
  %mtx_lock6 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx5, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock6, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1968) #5
  %13 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred7 = getelementptr inbounds %struct.proc, %struct.proc* %13, i32 0, i32 3
  %14 = load %struct.ucred*, %struct.ucred** %p_ucred7, align 8
  store %struct.ucred* %14, %struct.ucred** %oldcred, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %15 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %16 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crcopy(%struct.ucred* %15, %struct.ucred* %16) #5
  %17 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  ret %struct.ucred* %17
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setuid(%struct.ucred*, i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @priv_check_cred(%struct.ucred*, i32, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @change_ruid(%struct.ucred* %newcred, %struct.uidinfo* %ruip) #0 {
entry:
  %newcred.addr = alloca %struct.ucred*, align 8
  %ruip.addr = alloca %struct.uidinfo*, align 8
  %ruid = alloca i32, align 4
  store %struct.ucred* %newcred, %struct.ucred** %newcred.addr, align 8
  store %struct.uidinfo* %ruip, %struct.uidinfo** %ruip.addr, align 8
  %0 = load %struct.uidinfo*, %struct.uidinfo** %ruip.addr, align 8
  %ui_uid = getelementptr inbounds %struct.uidinfo, %struct.uidinfo* %0, i32 0, i32 6
  %1 = load i32, i32* %ui_uid, align 4
  store i32 %1, i32* %ruid, align 4
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2206, i32 4, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2208, i32 5, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  %2 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_ruidinfo = getelementptr inbounds %struct.ucred, %struct.ucred* %2, i32 0, i32 8
  %3 = load %struct.uidinfo*, %struct.uidinfo** %cr_ruidinfo, align 8
  %call = call i32 @chgproccnt(%struct.uidinfo* %3, i32 -1, i64 0) #5
  %4 = load i32, i32* %ruid, align 4
  %5 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %5, i32 0, i32 2
  store i32 %4, i32* %cr_ruid, align 4
  %6 = load %struct.uidinfo*, %struct.uidinfo** %ruip.addr, align 8
  call void @uihold(%struct.uidinfo* %6) #5
  %7 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_ruidinfo1 = getelementptr inbounds %struct.ucred, %struct.ucred* %7, i32 0, i32 8
  %8 = load %struct.uidinfo*, %struct.uidinfo** %cr_ruidinfo1, align 8
  call void @uifree(%struct.uidinfo* %8) #5
  %9 = load %struct.uidinfo*, %struct.uidinfo** %ruip.addr, align 8
  %10 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_ruidinfo2 = getelementptr inbounds %struct.ucred, %struct.ucred* %10, i32 0, i32 8
  store %struct.uidinfo* %9, %struct.uidinfo** %cr_ruidinfo2, align 8
  %11 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_ruidinfo3 = getelementptr inbounds %struct.ucred, %struct.ucred* %11, i32 0, i32 8
  %12 = load %struct.uidinfo*, %struct.uidinfo** %cr_ruidinfo3, align 8
  %call4 = call i32 @chgproccnt(%struct.uidinfo* %12, i32 1, i64 0) #5
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @setsugid(%struct.proc* %p) #0 {
entry:
  %p.addr = alloca %struct.proc*, align 8
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  %0 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %0, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2132) #5
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_flag = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 10
  %2 = load i32, i32* %p_flag, align 4
  %or = or i32 %2, 256
  store i32 %or, i32* %p_flag, align 4
  %3 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_pfsflags = getelementptr inbounds %struct.proc, %struct.proc* %3, i32 0, i32 42
  %4 = load i8, i8* %p_pfsflags, align 1
  %conv = zext i8 %4 to i32
  %and = and i32 %conv, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %5 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_stops = getelementptr inbounds %struct.proc, %struct.proc* %5, i32 0, i32 39
  store i32 0, i32* %p_stops, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @change_svuid(%struct.ucred* %newcred, i32 %svuid) #0 {
entry:
  %newcred.addr = alloca %struct.ucred*, align 8
  %svuid.addr = alloca i32, align 4
  store %struct.ucred* %newcred, %struct.ucred** %newcred.addr, align 8
  store i32 %svuid, i32* %svuid.addr, align 4
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2255, i32 8, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2257, i32 9, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  %0 = load i32, i32* %svuid.addr, align 4
  %1 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 3
  store i32 %0, i32* %cr_svuid, align 4
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @change_euid(%struct.ucred* %newcred, %struct.uidinfo* %euip) #0 {
entry:
  %newcred.addr = alloca %struct.ucred*, align 8
  %euip.addr = alloca %struct.uidinfo*, align 8
  %euid = alloca i32, align 4
  store %struct.ucred* %newcred, %struct.ucred** %newcred.addr, align 8
  store %struct.uidinfo* %euip, %struct.uidinfo** %euip.addr, align 8
  %0 = load %struct.uidinfo*, %struct.uidinfo** %euip.addr, align 8
  %ui_uid = getelementptr inbounds %struct.uidinfo, %struct.uidinfo* %0, i32 0, i32 6
  %1 = load i32, i32* %ui_uid, align 4
  store i32 %1, i32* %euid, align 4
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2156, i32 0, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2158, i32 1, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  %2 = load i32, i32* %euid, align 4
  %3 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %3, i32 0, i32 1
  store i32 %2, i32* %cr_uid, align 4
  %4 = load %struct.uidinfo*, %struct.uidinfo** %euip.addr, align 8
  call void @uihold(%struct.uidinfo* %4) #5
  %5 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_uidinfo = getelementptr inbounds %struct.ucred, %struct.ucred* %5, i32 0, i32 7
  %6 = load %struct.uidinfo*, %struct.uidinfo** %cr_uidinfo, align 8
  call void @uifree(%struct.uidinfo* %6) #5
  %7 = load %struct.uidinfo*, %struct.uidinfo** %euip.addr, align 8
  %8 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_uidinfo1 = getelementptr inbounds %struct.ucred, %struct.ucred* %8, i32 0, i32 7
  store %struct.uidinfo* %7, %struct.uidinfo** %cr_uidinfo1, align 8
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @uifree(%struct.uidinfo*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @crfree(%struct.ucred* %cr) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ref = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 0
  %1 = load i32, i32* %cr_ref, align 4
  %cmp = icmp ugt i32 %1, 0
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ref1 = getelementptr inbounds %struct.ucred, %struct.ucred* %2, i32 0, i32 0
  %3 = load i32, i32* %cr_ref1, align 4
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str3, i32 0, i32 0), i32 %3) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %4 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ref3 = getelementptr inbounds %struct.ucred, %struct.ucred* %4, i32 0, i32 0
  %5 = load i32, i32* %cr_ref3, align 4
  %cmp4 = icmp ne i32 %5, -559038242
  %lnot6 = xor i1 %cmp4, true
  %lnot.ext7 = zext i1 %lnot6 to i32
  %conv8 = sext i32 %lnot.ext7 to i64
  %expval9 = call i64 @llvm.expect.i64(i64 %conv8, i64 0)
  %tobool10 = icmp ne i64 %expval9, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %do.body2
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str4, i32 0, i32 0)) #5
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %do.body2
  br label %do.end13

do.end13:                                         ; preds = %if.end12
  %6 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ref14 = getelementptr inbounds %struct.ucred, %struct.ucred* %6, i32 0, i32 0
  %call = call i32 @refcount_release(i32* %cr_ref14) #5
  %tobool15 = icmp ne i32 %call, 0
  br i1 %tobool15, label %if.then16, label %if.end37

if.then16:                                        ; preds = %do.end13
  %7 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_uidinfo = getelementptr inbounds %struct.ucred, %struct.ucred* %7, i32 0, i32 7
  %8 = load %struct.uidinfo*, %struct.uidinfo** %cr_uidinfo, align 8
  %cmp17 = icmp ne %struct.uidinfo* %8, null
  br i1 %cmp17, label %if.then19, label %if.end21

if.then19:                                        ; preds = %if.then16
  %9 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_uidinfo20 = getelementptr inbounds %struct.ucred, %struct.ucred* %9, i32 0, i32 7
  %10 = load %struct.uidinfo*, %struct.uidinfo** %cr_uidinfo20, align 8
  call void @uifree(%struct.uidinfo* %10) #5
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %if.then16
  %11 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ruidinfo = getelementptr inbounds %struct.ucred, %struct.ucred* %11, i32 0, i32 8
  %12 = load %struct.uidinfo*, %struct.uidinfo** %cr_ruidinfo, align 8
  %cmp22 = icmp ne %struct.uidinfo* %12, null
  br i1 %cmp22, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.end21
  %13 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ruidinfo25 = getelementptr inbounds %struct.ucred, %struct.ucred* %13, i32 0, i32 8
  %14 = load %struct.uidinfo*, %struct.uidinfo** %cr_ruidinfo25, align 8
  call void @uifree(%struct.uidinfo* %14) #5
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.end21
  %15 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_prison = getelementptr inbounds %struct.ucred, %struct.ucred* %15, i32 0, i32 9
  %16 = load %struct.prison*, %struct.prison** %cr_prison, align 8
  %cmp27 = icmp ne %struct.prison* %16, null
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end26
  %17 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_prison30 = getelementptr inbounds %struct.ucred, %struct.ucred* %17, i32 0, i32 9
  %18 = load %struct.prison*, %struct.prison** %cr_prison30, align 8
  call void @prison_free(%struct.prison* %18) #5
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.end26
  %19 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_loginclass = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 10
  %20 = load %struct.loginclass*, %struct.loginclass** %cr_loginclass, align 8
  %cmp32 = icmp ne %struct.loginclass* %20, null
  br i1 %cmp32, label %if.then34, label %if.end36

if.then34:                                        ; preds = %if.end31
  %21 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_loginclass35 = getelementptr inbounds %struct.ucred, %struct.ucred* %21, i32 0, i32 10
  %22 = load %struct.loginclass*, %struct.loginclass** %cr_loginclass35, align 8
  call void @loginclass_free(%struct.loginclass* %22) #5
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.end31
  %23 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  call void @audit_cred_destroy(%struct.ucred* %23) #5
  %24 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  call void @mac_cred_destroy(%struct.ucred* %24) #5
  %25 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %25, i32 0, i32 15
  %26 = load i32*, i32** %cr_groups, align 8
  %27 = bitcast i32* %26 to i8*
  call void @free(i8* %27, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_CRED, i32 0, i32 0)) #5
  %28 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %29 = bitcast %struct.ucred* %28 to i8*
  call void @free(i8* %29, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_CRED, i32 0, i32 0)) #5
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %do.end13
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_seteuid(%struct.thread* %td, %struct.seteuid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.seteuid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %euid = alloca i32, align 4
  %euip = alloca %struct.uidinfo*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.seteuid_args* %uap, %struct.seteuid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.seteuid_args*, %struct.seteuid_args** %uap.addr, align 8
  %euid1 = getelementptr inbounds %struct.seteuid_args, %struct.seteuid_args* %2, i32 0, i32 1
  %3 = load i32, i32* %euid1, align 4
  store i32 %3, i32* %euid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %4 = load i32, i32* %td_pflags, align 4
  %and = and i32 %4, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %5 = load i32, i32* %euid, align 4
  call void @audit_arg_euid(i32 %5) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call2 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call2, %struct.ucred** %newcred, align 8
  %6 = load i32, i32* %euid, align 4
  %call3 = call %struct.uidinfo* @uifind(i32 %6) #5
  store %struct.uidinfo* %call3, %struct.uidinfo** %euip, align 8
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 623) #5
  %8 = load %struct.proc*, %struct.proc** %p, align 8
  %9 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call4 = call %struct.ucred* @crcopysafe(%struct.proc* %8, %struct.ucred* %9) #5
  store %struct.ucred* %call4, %struct.ucred** %oldcred, align 8
  %10 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %11 = load i32, i32* %euid, align 4
  %call5 = call i32 @mac_cred_check_seteuid(%struct.ucred* %10, i32 %11) #5
  store i32 %call5, i32* %error, align 4
  %12 = load i32, i32* %error, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %do.end
  br label %fail

if.end8:                                          ; preds = %do.end
  %13 = load i32, i32* %euid, align 4
  %14 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %14, i32 0, i32 2
  %15 = load i32, i32* %cr_ruid, align 4
  %cmp = icmp ne i32 %13, %15
  br i1 %cmp, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.end8
  %16 = load i32, i32* %euid, align 4
  %17 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %17, i32 0, i32 3
  %18 = load i32, i32* %cr_svuid, align 4
  %cmp9 = icmp ne i32 %16, %18
  br i1 %cmp9, label %land.lhs.true10, label %if.end14

land.lhs.true10:                                  ; preds = %land.lhs.true
  %19 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call11 = call i32 @priv_check_cred(%struct.ucred* %19, i32 51, i32 0) #5
  store i32 %call11, i32* %error, align 4
  %cmp12 = icmp ne i32 %call11, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %land.lhs.true10
  br label %fail

if.end14:                                         ; preds = %land.lhs.true10, %land.lhs.true, %if.end8
  %20 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %20, i32 0, i32 1
  %21 = load i32, i32* %cr_uid, align 4
  %22 = load i32, i32* %euid, align 4
  %cmp15 = icmp ne i32 %21, %22
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  %23 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %24 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @change_euid(%struct.ucred* %23, %struct.uidinfo* %24) #5
  %25 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %25) #5
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end14
  %26 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %27 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %27, i32 0, i32 3
  store %struct.ucred* %26, %struct.ucred** %p_ucred, align 8
  %28 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx18 = getelementptr inbounds %struct.proc, %struct.proc* %28, i32 0, i32 18
  %mtx_lock19 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx18, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock19, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 648) #5
  %29 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @uifree(%struct.uidinfo* %29) #5
  %30 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %30) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then13, %if.then7
  %31 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx20 = getelementptr inbounds %struct.proc, %struct.proc* %31, i32 0, i32 18
  %mtx_lock21 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx20, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock21, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 654) #5
  %32 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @uifree(%struct.uidinfo* %32) #5
  %33 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %33) #5
  %34 = load i32, i32* %error, align 4
  store i32 %34, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end17
  %35 = load i32, i32* %retval
  ret i32 %35
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_euid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_seteuid(%struct.ucred*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setgid(%struct.thread* %td, %struct.setgid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setgid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %gid = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setgid_args* %uap, %struct.setgid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setgid_args*, %struct.setgid_args** %uap.addr, align 8
  %gid1 = getelementptr inbounds %struct.setgid_args, %struct.setgid_args* %2, i32 0, i32 1
  %3 = load i32, i32* %gid1, align 4
  store i32 %3, i32* %gid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %4 = load i32, i32* %td_pflags, align 4
  %and = and i32 %4, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %5 = load i32, i32* %gid, align 4
  call void @audit_arg_gid(i32 %5) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call2 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call2, %struct.ucred** %newcred, align 8
  %6 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %6, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 677) #5
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %8 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call3 = call %struct.ucred* @crcopysafe(%struct.proc* %7, %struct.ucred* %8) #5
  store %struct.ucred* %call3, %struct.ucred** %oldcred, align 8
  %9 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %10 = load i32, i32* %gid, align 4
  %call4 = call i32 @mac_cred_check_setgid(%struct.ucred* %9, i32 %10) #5
  store i32 %call4, i32* %error, align 4
  %11 = load i32, i32* %error, align 4
  %tobool5 = icmp ne i32 %11, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.end
  br label %fail

if.end7:                                          ; preds = %do.end
  %12 = load i32, i32* %gid, align 4
  %13 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %13, i32 0, i32 5
  %14 = load i32, i32* %cr_rgid, align 4
  %cmp = icmp ne i32 %12, %14
  br i1 %cmp, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end7
  %15 = load i32, i32* %gid, align 4
  %16 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %16, i32 0, i32 15
  %17 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %17, i64 0
  %18 = load i32, i32* %arrayidx, align 4
  %cmp8 = icmp ne i32 %15, %18
  br i1 %cmp8, label %land.lhs.true9, label %if.end13

land.lhs.true9:                                   ; preds = %land.lhs.true
  %19 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call10 = call i32 @priv_check_cred(%struct.ucred* %19, i32 52, i32 0) #5
  store i32 %call10, i32* %error, align 4
  %cmp11 = icmp ne i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true9
  br label %fail

if.end13:                                         ; preds = %land.lhs.true9, %land.lhs.true, %if.end7
  %20 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid14 = getelementptr inbounds %struct.ucred, %struct.ucred* %20, i32 0, i32 5
  %21 = load i32, i32* %cr_rgid14, align 4
  %22 = load i32, i32* %gid, align 4
  %cmp15 = icmp ne i32 %21, %22
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end13
  %23 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %24 = load i32, i32* %gid, align 4
  call void @change_rgid(%struct.ucred* %23, i32 %24) #5
  %25 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %25) #5
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end13
  %26 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %26, i32 0, i32 6
  %27 = load i32, i32* %cr_svgid, align 4
  %28 = load i32, i32* %gid, align 4
  %cmp18 = icmp ne i32 %27, %28
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end17
  %29 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %30 = load i32, i32* %gid, align 4
  call void @change_svgid(%struct.ucred* %29, i32 %30) #5
  %31 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %31) #5
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end17
  %32 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups21 = getelementptr inbounds %struct.ucred, %struct.ucred* %32, i32 0, i32 15
  %33 = load i32*, i32** %cr_groups21, align 8
  %arrayidx22 = getelementptr inbounds i32, i32* %33, i64 0
  %34 = load i32, i32* %arrayidx22, align 4
  %35 = load i32, i32* %gid, align 4
  %cmp23 = icmp ne i32 %34, %35
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end20
  %36 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %37 = load i32, i32* %gid, align 4
  call void @change_egid(%struct.ucred* %36, i32 %37) #5
  %38 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %38) #5
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end20
  %39 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %40 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %40, i32 0, i32 3
  store %struct.ucred* %39, %struct.ucred** %p_ucred, align 8
  %41 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx26 = getelementptr inbounds %struct.proc, %struct.proc* %41, i32 0, i32 18
  %mtx_lock27 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx26, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock27, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 748) #5
  %42 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %42) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then12, %if.then6
  %43 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx28 = getelementptr inbounds %struct.proc, %struct.proc* %43, i32 0, i32 18
  %mtx_lock29 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx28, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock29, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 753) #5
  %44 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %44) #5
  %45 = load i32, i32* %error, align 4
  store i32 %45, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end25
  %46 = load i32, i32* %retval
  ret i32 %46
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_gid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setgid(%struct.ucred*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @change_rgid(%struct.ucred* %newcred, i32 %rgid) #0 {
entry:
  %newcred.addr = alloca %struct.ucred*, align 8
  %rgid.addr = alloca i32, align 4
  store %struct.ucred* %newcred, %struct.ucred** %newcred.addr, align 8
  store i32 %rgid, i32* %rgid.addr, align 4
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2233, i32 6, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2235, i32 7, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  %0 = load i32, i32* %rgid.addr, align 4
  %1 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 5
  store i32 %0, i32* %cr_rgid, align 4
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @change_svgid(%struct.ucred* %newcred, i32 %svgid) #0 {
entry:
  %newcred.addr = alloca %struct.ucred*, align 8
  %svgid.addr = alloca i32, align 4
  store %struct.ucred* %newcred, %struct.ucred** %newcred.addr, align 8
  store i32 %svgid, i32* %svgid.addr, align 4
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2277, i32 10, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2279, i32 11, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  %0 = load i32, i32* %svgid.addr, align 4
  %1 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 6
  store i32 %0, i32* %cr_svgid, align 4
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @change_egid(%struct.ucred* %newcred, i32 %egid) #0 {
entry:
  %newcred.addr = alloca %struct.ucred*, align 8
  %egid.addr = alloca i32, align 4
  store %struct.ucred* %newcred, %struct.ucred** %newcred.addr, align 8
  store i32 %egid, i32* %egid.addr, align 4
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2181, i32 2, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  call void (i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) @__tesla_inline_assertion(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.emptystring, i32 0, i32 0), i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2183, i32 3, %struct.__tesla_locality* null, i32 0, i32 0, i32 1) #5
  %0 = load i32, i32* %egid.addr, align 4
  %1 = load %struct.ucred*, %struct.ucred** %newcred.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 15
  %2 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0
  store i32 %0, i32* %arrayidx, align 4
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setegid(%struct.thread* %td, %struct.setegid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setegid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %egid = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setegid_args* %uap, %struct.setegid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setegid_args*, %struct.setegid_args** %uap.addr, align 8
  %egid1 = getelementptr inbounds %struct.setegid_args, %struct.setegid_args* %2, i32 0, i32 1
  %3 = load i32, i32* %egid1, align 4
  store i32 %3, i32* %egid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %4 = load i32, i32* %td_pflags, align 4
  %and = and i32 %4, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %5 = load i32, i32* %egid, align 4
  call void @audit_arg_egid(i32 %5) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call2 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call2, %struct.ucred** %newcred, align 8
  %6 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %6, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 775) #5
  %7 = load %struct.proc*, %struct.proc** %p, align 8
  %8 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call3 = call %struct.ucred* @crcopysafe(%struct.proc* %7, %struct.ucred* %8) #5
  store %struct.ucred* %call3, %struct.ucred** %oldcred, align 8
  %9 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %10 = load i32, i32* %egid, align 4
  %call4 = call i32 @mac_cred_check_setegid(%struct.ucred* %9, i32 %10) #5
  store i32 %call4, i32* %error, align 4
  %11 = load i32, i32* %error, align 4
  %tobool5 = icmp ne i32 %11, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.end
  br label %fail

if.end7:                                          ; preds = %do.end
  %12 = load i32, i32* %egid, align 4
  %13 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %13, i32 0, i32 5
  %14 = load i32, i32* %cr_rgid, align 4
  %cmp = icmp ne i32 %12, %14
  br i1 %cmp, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end7
  %15 = load i32, i32* %egid, align 4
  %16 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %16, i32 0, i32 6
  %17 = load i32, i32* %cr_svgid, align 4
  %cmp8 = icmp ne i32 %15, %17
  br i1 %cmp8, label %land.lhs.true9, label %if.end13

land.lhs.true9:                                   ; preds = %land.lhs.true
  %18 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call10 = call i32 @priv_check_cred(%struct.ucred* %18, i32 53, i32 0) #5
  store i32 %call10, i32* %error, align 4
  %cmp11 = icmp ne i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true9
  br label %fail

if.end13:                                         ; preds = %land.lhs.true9, %land.lhs.true, %if.end7
  %19 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 15
  %20 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %20, i64 0
  %21 = load i32, i32* %arrayidx, align 4
  %22 = load i32, i32* %egid, align 4
  %cmp14 = icmp ne i32 %21, %22
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %23 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %24 = load i32, i32* %egid, align 4
  call void @change_egid(%struct.ucred* %23, i32 %24) #5
  %25 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %25) #5
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %26 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %27 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %27, i32 0, i32 3
  store %struct.ucred* %26, %struct.ucred** %p_ucred, align 8
  %28 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx17 = getelementptr inbounds %struct.proc, %struct.proc* %28, i32 0, i32 18
  %mtx_lock18 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx17, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock18, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 794) #5
  %29 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %29) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then12, %if.then6
  %30 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx19 = getelementptr inbounds %struct.proc, %struct.proc* %30, i32 0, i32 18
  %mtx_lock20 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx19, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock20, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 799) #5
  %31 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %31) #5
  %32 = load i32, i32* %error, align 4
  store i32 %32, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end16
  %33 = load i32, i32* %retval
  ret i32 %33
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_egid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setegid(%struct.ucred*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setgroups(%struct.thread* %td, %struct.setgroups_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setgroups_args*, align 8
  %groups = alloca i32*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setgroups_args* %uap, %struct.setgroups_args** %uap.addr, align 8
  store i32* null, i32** %groups, align 8
  %0 = load %struct.setgroups_args*, %struct.setgroups_args** %uap.addr, align 8
  %gidsetsize = getelementptr inbounds %struct.setgroups_args, %struct.setgroups_args* %0, i32 0, i32 1
  %1 = load i32, i32* %gidsetsize, align 4
  %2 = load i32, i32* @ngroups_max, align 4
  %add = add nsw i32 %2, 1
  %cmp = icmp ugt i32 %1, %add
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 22, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.setgroups_args*, %struct.setgroups_args** %uap.addr, align 8
  %gidsetsize1 = getelementptr inbounds %struct.setgroups_args, %struct.setgroups_args* %3, i32 0, i32 1
  %4 = load i32, i32* %gidsetsize1, align 4
  %conv = zext i32 %4 to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0), i32 2) #5
  %5 = bitcast i8* %call to i32*
  store i32* %5, i32** %groups, align 8
  %6 = load %struct.setgroups_args*, %struct.setgroups_args** %uap.addr, align 8
  %gidset = getelementptr inbounds %struct.setgroups_args, %struct.setgroups_args* %6, i32 0, i32 4
  %7 = load i32*, i32** %gidset, align 8
  %8 = bitcast i32* %7 to i8*
  %9 = load i32*, i32** %groups, align 8
  %10 = bitcast i32* %9 to i8*
  %11 = load %struct.setgroups_args*, %struct.setgroups_args** %uap.addr, align 8
  %gidsetsize2 = getelementptr inbounds %struct.setgroups_args, %struct.setgroups_args* %11, i32 0, i32 1
  %12 = load i32, i32* %gidsetsize2, align 4
  %conv3 = zext i32 %12 to i64
  %mul4 = mul i64 %conv3, 4
  %call5 = call i32 @copyin(i8* %8, i8* %10, i64 %mul4) #5
  store i32 %call5, i32* %error, align 4
  %13 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  br label %out

if.end7:                                          ; preds = %if.end
  %14 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %15 = load %struct.setgroups_args*, %struct.setgroups_args** %uap.addr, align 8
  %gidsetsize8 = getelementptr inbounds %struct.setgroups_args, %struct.setgroups_args* %15, i32 0, i32 1
  %16 = load i32, i32* %gidsetsize8, align 4
  %17 = load i32*, i32** %groups, align 8
  %call9 = call i32 @kern_setgroups(%struct.thread* %14, i32 %16, i32* %17) #5
  store i32 %call9, i32* %error, align 4
  br label %out

out:                                              ; preds = %if.end7, %if.then6
  %18 = load i32*, i32** %groups, align 8
  %19 = bitcast i32* %18 to i8*
  call void @free(i8* %19, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_TEMP, i32 0, i32 0)) #5
  %20 = load i32, i32* %error, align 4
  store i32 %20, i32* %retval
  br label %return

return:                                           ; preds = %out, %if.then
  %21 = load i32, i32* %retval
  ret i32 %21
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @copyin(i8*, i8*, i64) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @kern_setgroups(%struct.thread* %td, i32 %ngrp, i32* %groups) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %ngrp.addr = alloca i32, align 4
  %groups.addr = alloca i32*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store i32 %ngrp, i32* %ngrp.addr, align 4
  store i32* %groups, i32** %groups.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load i32, i32* %ngrp.addr, align 4
  %3 = load i32, i32* @ngroups_max, align 4
  %add = add nsw i32 %3, 1
  %cmp = icmp ugt i32 %2, %add
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 22, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %4 = load i32, i32* %td_pflags, align 4
  %and = and i32 %4, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %do.body
  %5 = load i32*, i32** %groups.addr, align 8
  %6 = load i32, i32* %ngrp.addr, align 4
  call void @audit_arg_groupset(i32* %5, i32 %6) #5
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end2
  %call3 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call3, %struct.ucred** %newcred, align 8
  %7 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %8 = load i32, i32* %ngrp.addr, align 4
  call void @crextend(%struct.ucred* %7, i32 %8) #5
  %9 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 841) #5
  %10 = load %struct.proc*, %struct.proc** %p, align 8
  %11 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call4 = call %struct.ucred* @crcopysafe(%struct.proc* %10, %struct.ucred* %11) #5
  store %struct.ucred* %call4, %struct.ucred** %oldcred, align 8
  %12 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %13 = load i32, i32* %ngrp.addr, align 4
  %14 = load i32*, i32** %groups.addr, align 8
  %call5 = call i32 @mac_cred_check_setgroups(%struct.ucred* %12, i32 %13, i32* %14) #5
  store i32 %call5, i32* %error, align 4
  %15 = load i32, i32* %error, align 4
  %tobool6 = icmp ne i32 %15, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %do.end
  br label %fail

if.end8:                                          ; preds = %do.end
  %16 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call9 = call i32 @priv_check_cred(%struct.ucred* %16, i32 54, i32 0) #5
  store i32 %call9, i32* %error, align 4
  %17 = load i32, i32* %error, align 4
  %tobool10 = icmp ne i32 %17, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  br label %fail

if.end12:                                         ; preds = %if.end8
  %18 = load i32, i32* %ngrp.addr, align 4
  %cmp13 = icmp ult i32 %18, 1
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %if.end12
  %19 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 4
  store i32 1, i32* %cr_ngroups, align 4
  br label %if.end15

if.else:                                          ; preds = %if.end12
  %20 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %21 = load i32, i32* %ngrp.addr, align 4
  %22 = load i32*, i32** %groups.addr, align 8
  call void @crsetgroups_locked(%struct.ucred* %20, i32 %21, i32* %22) #5
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then14
  %23 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %23) #5
  %24 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %25 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %25, i32 0, i32 3
  store %struct.ucred* %24, %struct.ucred** %p_ucred, align 8
  %26 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx16 = getelementptr inbounds %struct.proc, %struct.proc* %26, i32 0, i32 18
  %mtx_lock17 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx16, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock17, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 867) #5
  %27 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %27) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then11, %if.then7
  %28 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx18 = getelementptr inbounds %struct.proc, %struct.proc* %28, i32 0, i32 18
  %mtx_lock19 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx18, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock19, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 872) #5
  %29 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %29) #5
  %30 = load i32, i32* %error, align 4
  store i32 %30, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end15, %if.then
  %31 = load i32, i32* %retval
  ret i32 %31
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_groupset(i32*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @crextend(%struct.ucred* %cr, i32 %n) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %n.addr = alloca i32, align 4
  %cnt = alloca i32, align 4
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %1 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_agroups = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 16
  %2 = load i32, i32* %cr_agroups, align 4
  %cmp = icmp sle i32 %0, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4
  %conv = sext i32 %3 to i64
  %cmp1 = icmp ult i64 %conv, 1024
  br i1 %cmp1, label %if.then3, label %if.else13

if.then3:                                         ; preds = %if.end
  %4 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_agroups4 = getelementptr inbounds %struct.ucred, %struct.ucred* %4, i32 0, i32 16
  %5 = load i32, i32* %cr_agroups4, align 4
  %cmp5 = icmp eq i32 %5, 0
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then3
  store i32 4, i32* %cnt, align 4
  br label %if.end9

if.else:                                          ; preds = %if.then3
  %6 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_agroups8 = getelementptr inbounds %struct.ucred, %struct.ucred* %6, i32 0, i32 16
  %7 = load i32, i32* %cr_agroups8, align 4
  %mul = mul nsw i32 %7, 2
  store i32 %mul, i32* %cnt, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then7
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end9
  %8 = load i32, i32* %cnt, align 4
  %9 = load i32, i32* %n.addr, align 4
  %cmp10 = icmp slt i32 %8, %9
  br i1 %cmp10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load i32, i32* %cnt, align 4
  %mul12 = mul nsw i32 %10, 2
  store i32 %mul12, i32* %cnt, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end16

if.else13:                                        ; preds = %if.end
  %11 = load i32, i32* %n.addr, align 4
  %conv14 = sext i32 %11 to i64
  %add = add i64 %conv14, 1023
  %and = and i64 %add, -1024
  %conv15 = trunc i64 %and to i32
  store i32 %conv15, i32* %cnt, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.else13, %while.end
  %12 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %12, i32 0, i32 15
  %13 = load i32*, i32** %cr_groups, align 8
  %tobool = icmp ne i32* %13, null
  br i1 %tobool, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end16
  %14 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups18 = getelementptr inbounds %struct.ucred, %struct.ucred* %14, i32 0, i32 15
  %15 = load i32*, i32** %cr_groups18, align 8
  %16 = bitcast i32* %15 to i8*
  call void @free(i8* %16, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_CRED, i32 0, i32 0)) #5
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end16
  %17 = load i32, i32* %cnt, align 4
  %conv20 = sext i32 %17 to i64
  %mul21 = mul i64 %conv20, 4
  %call = call noalias i8* @malloc(i64 %mul21, %struct.malloc_type* getelementptr inbounds ([1 x %struct.malloc_type], [1 x %struct.malloc_type]* @M_CRED, i32 0, i32 0), i32 258) #5
  %18 = bitcast i8* %call to i32*
  %19 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups22 = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 15
  store i32* %18, i32** %cr_groups22, align 8
  %20 = load i32, i32* %cnt, align 4
  %21 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_agroups23 = getelementptr inbounds %struct.ucred, %struct.ucred* %21, i32 0, i32 16
  store i32 %20, i32* %cr_agroups23, align 4
  br label %return

return:                                           ; preds = %if.end19, %if.then
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setgroups(%struct.ucred*, i32, i32*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal void @crsetgroups_locked(%struct.ucred* %cr, i32 %ngrp, i32* %groups) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %ngrp.addr = alloca i32, align 4
  %groups.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %g = alloca i32, align 4
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  store i32 %ngrp, i32* %ngrp.addr, align 4
  store i32* %groups, i32** %groups.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_agroups = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 16
  %1 = load i32, i32* %cr_agroups, align 4
  %2 = load i32, i32* %ngrp.addr, align 4
  %cmp = icmp sge i32 %1, %2
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str6, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32*, i32** %groups.addr, align 8
  %4 = bitcast i32* %3 to i8*
  %5 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %5, i32 0, i32 15
  %6 = load i32*, i32** %cr_groups, align 8
  %7 = bitcast i32* %6 to i8*
  %8 = load i32, i32* %ngrp.addr, align 4
  %conv1 = sext i32 %8 to i64
  %mul = mul i64 %conv1, 4
  call void @bcopy(i8* %4, i8* %7, i64 %mul) #5
  %9 = load i32, i32* %ngrp.addr, align 4
  %10 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %10, i32 0, i32 4
  store i32 %9, i32* %cr_ngroups, align 4
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %do.end
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %ngrp.addr, align 4
  %cmp2 = icmp slt i32 %11, %12
  br i1 %cmp2, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  %13 = load i32, i32* %i, align 4
  %idxprom = sext i32 %13 to i64
  %14 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups4 = getelementptr inbounds %struct.ucred, %struct.ucred* %14, i32 0, i32 15
  %15 = load i32*, i32** %cr_groups4, align 8
  %arrayidx = getelementptr inbounds i32, i32* %15, i64 %idxprom
  %16 = load i32, i32* %arrayidx, align 4
  store i32 %16, i32* %g, align 4
  %17 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %17, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %18 = load i32, i32* %j, align 4
  %cmp6 = icmp sge i32 %18, 1
  br i1 %cmp6, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond5
  %19 = load i32, i32* %g, align 4
  %20 = load i32, i32* %j, align 4
  %idxprom8 = sext i32 %20 to i64
  %21 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups9 = getelementptr inbounds %struct.ucred, %struct.ucred* %21, i32 0, i32 15
  %22 = load i32*, i32** %cr_groups9, align 8
  %arrayidx10 = getelementptr inbounds i32, i32* %22, i64 %idxprom8
  %23 = load i32, i32* %arrayidx10, align 4
  %cmp11 = icmp ult i32 %19, %23
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond5
  %24 = phi i1 [ false, %for.cond5 ], [ %cmp11, %land.rhs ]
  br i1 %24, label %for.body13, label %for.end

for.body13:                                       ; preds = %land.end
  %25 = load i32, i32* %j, align 4
  %idxprom14 = sext i32 %25 to i64
  %26 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups15 = getelementptr inbounds %struct.ucred, %struct.ucred* %26, i32 0, i32 15
  %27 = load i32*, i32** %cr_groups15, align 8
  %arrayidx16 = getelementptr inbounds i32, i32* %27, i64 %idxprom14
  %28 = load i32, i32* %arrayidx16, align 4
  %29 = load i32, i32* %j, align 4
  %add = add nsw i32 %29, 1
  %idxprom17 = sext i32 %add to i64
  %30 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups18 = getelementptr inbounds %struct.ucred, %struct.ucred* %30, i32 0, i32 15
  %31 = load i32*, i32** %cr_groups18, align 8
  %arrayidx19 = getelementptr inbounds i32, i32* %31, i64 %idxprom17
  store i32 %28, i32* %arrayidx19, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body13
  %32 = load i32, i32* %j, align 4
  %dec = add nsw i32 %32, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %land.end
  %33 = load i32, i32* %g, align 4
  %34 = load i32, i32* %j, align 4
  %add20 = add nsw i32 %34, 1
  %idxprom21 = sext i32 %add20 to i64
  %35 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups22 = getelementptr inbounds %struct.ucred, %struct.ucred* %35, i32 0, i32 15
  %36 = load i32*, i32** %cr_groups22, align 8
  %arrayidx23 = getelementptr inbounds i32, i32* %36, i64 %idxprom21
  store i32 %33, i32* %arrayidx23, align 4
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %37 = load i32, i32* %i, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setreuid(%struct.thread* %td, %struct.setreuid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setreuid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %euid = alloca i32, align 4
  %ruid = alloca i32, align 4
  %euip = alloca %struct.uidinfo*, align 8
  %ruip = alloca %struct.uidinfo*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setreuid_args* %uap, %struct.setreuid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setreuid_args*, %struct.setreuid_args** %uap.addr, align 8
  %euid1 = getelementptr inbounds %struct.setreuid_args, %struct.setreuid_args* %2, i32 0, i32 4
  %3 = load i32, i32* %euid1, align 4
  store i32 %3, i32* %euid, align 4
  %4 = load %struct.setreuid_args*, %struct.setreuid_args** %uap.addr, align 8
  %ruid2 = getelementptr inbounds %struct.setreuid_args, %struct.setreuid_args* %4, i32 0, i32 1
  %5 = load i32, i32* %ruid2, align 4
  store i32 %5, i32* %ruid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %6 = load i32, i32* %td_pflags, align 4
  %and = and i32 %6, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %7 = load i32, i32* %euid, align 4
  call void @audit_arg_euid(i32 %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body3

do.body3:                                         ; preds = %do.end
  %call4 = call %struct.thread* @__curthread() #6
  %td_pflags5 = getelementptr inbounds %struct.thread, %struct.thread* %call4, i32 0, i32 18
  %8 = load i32, i32* %td_pflags5, align 4
  %and6 = and i32 %8, 16777216
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %do.body3
  %9 = load i32, i32* %ruid, align 4
  call void @audit_arg_ruid(i32 %9) #5
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %do.body3
  br label %do.end10

do.end10:                                         ; preds = %if.end9
  %call11 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call11, %struct.ucred** %newcred, align 8
  %10 = load i32, i32* %euid, align 4
  %call12 = call %struct.uidinfo* @uifind(i32 %10) #5
  store %struct.uidinfo* %call12, %struct.uidinfo** %euip, align 8
  %11 = load i32, i32* %ruid, align 4
  %call13 = call %struct.uidinfo* @uifind(i32 %11) #5
  store %struct.uidinfo* %call13, %struct.uidinfo** %ruip, align 8
  %12 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %12, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 900) #5
  %13 = load %struct.proc*, %struct.proc** %p, align 8
  %14 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call14 = call %struct.ucred* @crcopysafe(%struct.proc* %13, %struct.ucred* %14) #5
  store %struct.ucred* %call14, %struct.ucred** %oldcred, align 8
  %15 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %16 = load i32, i32* %ruid, align 4
  %17 = load i32, i32* %euid, align 4
  %call15 = call i32 @mac_cred_check_setreuid(%struct.ucred* %15, i32 %16, i32 %17) #5
  store i32 %call15, i32* %error, align 4
  %18 = load i32, i32* %error, align 4
  %tobool16 = icmp ne i32 %18, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.end10
  br label %fail

if.end18:                                         ; preds = %do.end10
  %19 = load i32, i32* %ruid, align 4
  %cmp = icmp ne i32 %19, -1
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %if.end18
  %20 = load i32, i32* %ruid, align 4
  %21 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %21, i32 0, i32 2
  %22 = load i32, i32* %cr_ruid, align 4
  %cmp19 = icmp ne i32 %20, %22
  br i1 %cmp19, label %land.lhs.true20, label %lor.lhs.false

land.lhs.true20:                                  ; preds = %land.lhs.true
  %23 = load i32, i32* %ruid, align 4
  %24 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %24, i32 0, i32 3
  %25 = load i32, i32* %cr_svuid, align 4
  %cmp21 = icmp ne i32 %23, %25
  br i1 %cmp21, label %land.lhs.true31, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true20, %land.lhs.true, %if.end18
  %26 = load i32, i32* %euid, align 4
  %cmp22 = icmp ne i32 %26, -1
  br i1 %cmp22, label %land.lhs.true23, label %if.end35

land.lhs.true23:                                  ; preds = %lor.lhs.false
  %27 = load i32, i32* %euid, align 4
  %28 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %28, i32 0, i32 1
  %29 = load i32, i32* %cr_uid, align 4
  %cmp24 = icmp ne i32 %27, %29
  br i1 %cmp24, label %land.lhs.true25, label %if.end35

land.lhs.true25:                                  ; preds = %land.lhs.true23
  %30 = load i32, i32* %euid, align 4
  %31 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid26 = getelementptr inbounds %struct.ucred, %struct.ucred* %31, i32 0, i32 2
  %32 = load i32, i32* %cr_ruid26, align 4
  %cmp27 = icmp ne i32 %30, %32
  br i1 %cmp27, label %land.lhs.true28, label %if.end35

land.lhs.true28:                                  ; preds = %land.lhs.true25
  %33 = load i32, i32* %euid, align 4
  %34 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid29 = getelementptr inbounds %struct.ucred, %struct.ucred* %34, i32 0, i32 3
  %35 = load i32, i32* %cr_svuid29, align 4
  %cmp30 = icmp ne i32 %33, %35
  br i1 %cmp30, label %land.lhs.true31, label %if.end35

land.lhs.true31:                                  ; preds = %land.lhs.true28, %land.lhs.true20
  %36 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call32 = call i32 @priv_check_cred(%struct.ucred* %36, i32 55, i32 0) #5
  store i32 %call32, i32* %error, align 4
  %cmp33 = icmp ne i32 %call32, 0
  br i1 %cmp33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %land.lhs.true31
  br label %fail

if.end35:                                         ; preds = %land.lhs.true31, %land.lhs.true28, %land.lhs.true25, %land.lhs.true23, %lor.lhs.false
  %37 = load i32, i32* %euid, align 4
  %cmp36 = icmp ne i32 %37, -1
  br i1 %cmp36, label %land.lhs.true37, label %if.end41

land.lhs.true37:                                  ; preds = %if.end35
  %38 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid38 = getelementptr inbounds %struct.ucred, %struct.ucred* %38, i32 0, i32 1
  %39 = load i32, i32* %cr_uid38, align 4
  %40 = load i32, i32* %euid, align 4
  %cmp39 = icmp ne i32 %39, %40
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %land.lhs.true37
  %41 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %42 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @change_euid(%struct.ucred* %41, %struct.uidinfo* %42) #5
  %43 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %43) #5
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %land.lhs.true37, %if.end35
  %44 = load i32, i32* %ruid, align 4
  %cmp42 = icmp ne i32 %44, -1
  br i1 %cmp42, label %land.lhs.true43, label %if.end47

land.lhs.true43:                                  ; preds = %if.end41
  %45 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid44 = getelementptr inbounds %struct.ucred, %struct.ucred* %45, i32 0, i32 2
  %46 = load i32, i32* %cr_ruid44, align 4
  %47 = load i32, i32* %ruid, align 4
  %cmp45 = icmp ne i32 %46, %47
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %land.lhs.true43
  %48 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %49 = load %struct.uidinfo*, %struct.uidinfo** %ruip, align 8
  call void @change_ruid(%struct.ucred* %48, %struct.uidinfo* %49) #5
  %50 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %50) #5
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %land.lhs.true43, %if.end41
  %51 = load i32, i32* %ruid, align 4
  %cmp48 = icmp ne i32 %51, -1
  br i1 %cmp48, label %land.lhs.true53, label %lor.lhs.false49

lor.lhs.false49:                                  ; preds = %if.end47
  %52 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_uid50 = getelementptr inbounds %struct.ucred, %struct.ucred* %52, i32 0, i32 1
  %53 = load i32, i32* %cr_uid50, align 4
  %54 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_ruid51 = getelementptr inbounds %struct.ucred, %struct.ucred* %54, i32 0, i32 2
  %55 = load i32, i32* %cr_ruid51, align 4
  %cmp52 = icmp ne i32 %53, %55
  br i1 %cmp52, label %land.lhs.true53, label %if.end59

land.lhs.true53:                                  ; preds = %lor.lhs.false49, %if.end47
  %56 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_svuid54 = getelementptr inbounds %struct.ucred, %struct.ucred* %56, i32 0, i32 3
  %57 = load i32, i32* %cr_svuid54, align 4
  %58 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_uid55 = getelementptr inbounds %struct.ucred, %struct.ucred* %58, i32 0, i32 1
  %59 = load i32, i32* %cr_uid55, align 4
  %cmp56 = icmp ne i32 %57, %59
  br i1 %cmp56, label %if.then57, label %if.end59

if.then57:                                        ; preds = %land.lhs.true53
  %60 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %61 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_uid58 = getelementptr inbounds %struct.ucred, %struct.ucred* %61, i32 0, i32 1
  %62 = load i32, i32* %cr_uid58, align 4
  call void @change_svuid(%struct.ucred* %60, i32 %62) #5
  %63 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %63) #5
  br label %if.end59

if.end59:                                         ; preds = %if.then57, %land.lhs.true53, %lor.lhs.false49
  %64 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %65 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %65, i32 0, i32 3
  store %struct.ucred* %64, %struct.ucred** %p_ucred, align 8
  %66 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx60 = getelementptr inbounds %struct.proc, %struct.proc* %66, i32 0, i32 18
  %mtx_lock61 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx60, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock61, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 930) #5
  %67 = load %struct.uidinfo*, %struct.uidinfo** %ruip, align 8
  call void @uifree(%struct.uidinfo* %67) #5
  %68 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @uifree(%struct.uidinfo* %68) #5
  %69 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %69) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then34, %if.then17
  %70 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx62 = getelementptr inbounds %struct.proc, %struct.proc* %70, i32 0, i32 18
  %mtx_lock63 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx62, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock63, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 940) #5
  %71 = load %struct.uidinfo*, %struct.uidinfo** %ruip, align 8
  call void @uifree(%struct.uidinfo* %71) #5
  %72 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @uifree(%struct.uidinfo* %72) #5
  %73 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %73) #5
  %74 = load i32, i32* %error, align 4
  store i32 %74, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end59
  %75 = load i32, i32* %retval
  ret i32 %75
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_ruid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setreuid(%struct.ucred*, i32, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setregid(%struct.thread* %td, %struct.setregid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setregid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %egid = alloca i32, align 4
  %rgid = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setregid_args* %uap, %struct.setregid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setregid_args*, %struct.setregid_args** %uap.addr, align 8
  %egid1 = getelementptr inbounds %struct.setregid_args, %struct.setregid_args* %2, i32 0, i32 4
  %3 = load i32, i32* %egid1, align 4
  store i32 %3, i32* %egid, align 4
  %4 = load %struct.setregid_args*, %struct.setregid_args** %uap.addr, align 8
  %rgid2 = getelementptr inbounds %struct.setregid_args, %struct.setregid_args* %4, i32 0, i32 1
  %5 = load i32, i32* %rgid2, align 4
  store i32 %5, i32* %rgid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %6 = load i32, i32* %td_pflags, align 4
  %and = and i32 %6, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %7 = load i32, i32* %egid, align 4
  call void @audit_arg_egid(i32 %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body3

do.body3:                                         ; preds = %do.end
  %call4 = call %struct.thread* @__curthread() #6
  %td_pflags5 = getelementptr inbounds %struct.thread, %struct.thread* %call4, i32 0, i32 18
  %8 = load i32, i32* %td_pflags5, align 4
  %and6 = and i32 %8, 16777216
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %do.body3
  %9 = load i32, i32* %rgid, align 4
  call void @audit_arg_rgid(i32 %9) #5
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %do.body3
  br label %do.end10

do.end10:                                         ; preds = %if.end9
  %call11 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call11, %struct.ucred** %newcred, align 8
  %10 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %10, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 967) #5
  %11 = load %struct.proc*, %struct.proc** %p, align 8
  %12 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call12 = call %struct.ucred* @crcopysafe(%struct.proc* %11, %struct.ucred* %12) #5
  store %struct.ucred* %call12, %struct.ucred** %oldcred, align 8
  %13 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %14 = load i32, i32* %rgid, align 4
  %15 = load i32, i32* %egid, align 4
  %call13 = call i32 @mac_cred_check_setregid(%struct.ucred* %13, i32 %14, i32 %15) #5
  store i32 %call13, i32* %error, align 4
  %16 = load i32, i32* %error, align 4
  %tobool14 = icmp ne i32 %16, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.end10
  br label %fail

if.end16:                                         ; preds = %do.end10
  %17 = load i32, i32* %rgid, align 4
  %cmp = icmp ne i32 %17, -1
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %if.end16
  %18 = load i32, i32* %rgid, align 4
  %19 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 5
  %20 = load i32, i32* %cr_rgid, align 4
  %cmp17 = icmp ne i32 %18, %20
  br i1 %cmp17, label %land.lhs.true18, label %lor.lhs.false

land.lhs.true18:                                  ; preds = %land.lhs.true
  %21 = load i32, i32* %rgid, align 4
  %22 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %22, i32 0, i32 6
  %23 = load i32, i32* %cr_svgid, align 4
  %cmp19 = icmp ne i32 %21, %23
  br i1 %cmp19, label %land.lhs.true29, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true18, %land.lhs.true, %if.end16
  %24 = load i32, i32* %egid, align 4
  %cmp20 = icmp ne i32 %24, -1
  br i1 %cmp20, label %land.lhs.true21, label %if.end33

land.lhs.true21:                                  ; preds = %lor.lhs.false
  %25 = load i32, i32* %egid, align 4
  %26 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %26, i32 0, i32 15
  %27 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %27, i64 0
  %28 = load i32, i32* %arrayidx, align 4
  %cmp22 = icmp ne i32 %25, %28
  br i1 %cmp22, label %land.lhs.true23, label %if.end33

land.lhs.true23:                                  ; preds = %land.lhs.true21
  %29 = load i32, i32* %egid, align 4
  %30 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid24 = getelementptr inbounds %struct.ucred, %struct.ucred* %30, i32 0, i32 5
  %31 = load i32, i32* %cr_rgid24, align 4
  %cmp25 = icmp ne i32 %29, %31
  br i1 %cmp25, label %land.lhs.true26, label %if.end33

land.lhs.true26:                                  ; preds = %land.lhs.true23
  %32 = load i32, i32* %egid, align 4
  %33 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid27 = getelementptr inbounds %struct.ucred, %struct.ucred* %33, i32 0, i32 6
  %34 = load i32, i32* %cr_svgid27, align 4
  %cmp28 = icmp ne i32 %32, %34
  br i1 %cmp28, label %land.lhs.true29, label %if.end33

land.lhs.true29:                                  ; preds = %land.lhs.true26, %land.lhs.true18
  %35 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call30 = call i32 @priv_check_cred(%struct.ucred* %35, i32 56, i32 0) #5
  store i32 %call30, i32* %error, align 4
  %cmp31 = icmp ne i32 %call30, 0
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %land.lhs.true29
  br label %fail

if.end33:                                         ; preds = %land.lhs.true29, %land.lhs.true26, %land.lhs.true23, %land.lhs.true21, %lor.lhs.false
  %36 = load i32, i32* %egid, align 4
  %cmp34 = icmp ne i32 %36, -1
  br i1 %cmp34, label %land.lhs.true35, label %if.end40

land.lhs.true35:                                  ; preds = %if.end33
  %37 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups36 = getelementptr inbounds %struct.ucred, %struct.ucred* %37, i32 0, i32 15
  %38 = load i32*, i32** %cr_groups36, align 8
  %arrayidx37 = getelementptr inbounds i32, i32* %38, i64 0
  %39 = load i32, i32* %arrayidx37, align 4
  %40 = load i32, i32* %egid, align 4
  %cmp38 = icmp ne i32 %39, %40
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %land.lhs.true35
  %41 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %42 = load i32, i32* %egid, align 4
  call void @change_egid(%struct.ucred* %41, i32 %42) #5
  %43 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %43) #5
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %land.lhs.true35, %if.end33
  %44 = load i32, i32* %rgid, align 4
  %cmp41 = icmp ne i32 %44, -1
  br i1 %cmp41, label %land.lhs.true42, label %if.end46

land.lhs.true42:                                  ; preds = %if.end40
  %45 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid43 = getelementptr inbounds %struct.ucred, %struct.ucred* %45, i32 0, i32 5
  %46 = load i32, i32* %cr_rgid43, align 4
  %47 = load i32, i32* %rgid, align 4
  %cmp44 = icmp ne i32 %46, %47
  br i1 %cmp44, label %if.then45, label %if.end46

if.then45:                                        ; preds = %land.lhs.true42
  %48 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %49 = load i32, i32* %rgid, align 4
  call void @change_rgid(%struct.ucred* %48, i32 %49) #5
  %50 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %50) #5
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %land.lhs.true42, %if.end40
  %51 = load i32, i32* %rgid, align 4
  %cmp47 = icmp ne i32 %51, -1
  br i1 %cmp47, label %land.lhs.true53, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %if.end46
  %52 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_groups49 = getelementptr inbounds %struct.ucred, %struct.ucred* %52, i32 0, i32 15
  %53 = load i32*, i32** %cr_groups49, align 8
  %arrayidx50 = getelementptr inbounds i32, i32* %53, i64 0
  %54 = load i32, i32* %arrayidx50, align 4
  %55 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_rgid51 = getelementptr inbounds %struct.ucred, %struct.ucred* %55, i32 0, i32 5
  %56 = load i32, i32* %cr_rgid51, align 4
  %cmp52 = icmp ne i32 %54, %56
  br i1 %cmp52, label %land.lhs.true53, label %if.end61

land.lhs.true53:                                  ; preds = %lor.lhs.false48, %if.end46
  %57 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_svgid54 = getelementptr inbounds %struct.ucred, %struct.ucred* %57, i32 0, i32 6
  %58 = load i32, i32* %cr_svgid54, align 4
  %59 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_groups55 = getelementptr inbounds %struct.ucred, %struct.ucred* %59, i32 0, i32 15
  %60 = load i32*, i32** %cr_groups55, align 8
  %arrayidx56 = getelementptr inbounds i32, i32* %60, i64 0
  %61 = load i32, i32* %arrayidx56, align 4
  %cmp57 = icmp ne i32 %58, %61
  br i1 %cmp57, label %if.then58, label %if.end61

if.then58:                                        ; preds = %land.lhs.true53
  %62 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %63 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %cr_groups59 = getelementptr inbounds %struct.ucred, %struct.ucred* %63, i32 0, i32 15
  %64 = load i32*, i32** %cr_groups59, align 8
  %arrayidx60 = getelementptr inbounds i32, i32* %64, i64 0
  %65 = load i32, i32* %arrayidx60, align 4
  call void @change_svgid(%struct.ucred* %62, i32 %65) #5
  %66 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %66) #5
  br label %if.end61

if.end61:                                         ; preds = %if.then58, %land.lhs.true53, %lor.lhs.false48
  %67 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %68 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %68, i32 0, i32 3
  store %struct.ucred* %67, %struct.ucred** %p_ucred, align 8
  %69 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx62 = getelementptr inbounds %struct.proc, %struct.proc* %69, i32 0, i32 18
  %mtx_lock63 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx62, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock63, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 997) #5
  %70 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %70) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then32, %if.then15
  %71 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx64 = getelementptr inbounds %struct.proc, %struct.proc* %71, i32 0, i32 18
  %mtx_lock65 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx64, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock65, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1002) #5
  %72 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %72) #5
  %73 = load i32, i32* %error, align 4
  store i32 %73, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end61
  %74 = load i32, i32* %retval
  ret i32 %74
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_rgid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setregid(%struct.ucred*, i32, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setresuid(%struct.thread* %td, %struct.setresuid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setresuid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %euid = alloca i32, align 4
  %ruid = alloca i32, align 4
  %suid = alloca i32, align 4
  %euip = alloca %struct.uidinfo*, align 8
  %ruip = alloca %struct.uidinfo*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setresuid_args* %uap, %struct.setresuid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setresuid_args*, %struct.setresuid_args** %uap.addr, align 8
  %euid1 = getelementptr inbounds %struct.setresuid_args, %struct.setresuid_args* %2, i32 0, i32 4
  %3 = load i32, i32* %euid1, align 4
  store i32 %3, i32* %euid, align 4
  %4 = load %struct.setresuid_args*, %struct.setresuid_args** %uap.addr, align 8
  %ruid2 = getelementptr inbounds %struct.setresuid_args, %struct.setresuid_args* %4, i32 0, i32 1
  %5 = load i32, i32* %ruid2, align 4
  store i32 %5, i32* %ruid, align 4
  %6 = load %struct.setresuid_args*, %struct.setresuid_args** %uap.addr, align 8
  %suid3 = getelementptr inbounds %struct.setresuid_args, %struct.setresuid_args* %6, i32 0, i32 7
  %7 = load i32, i32* %suid3, align 4
  store i32 %7, i32* %suid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %8 = load i32, i32* %td_pflags, align 4
  %and = and i32 %8, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %9 = load i32, i32* %euid, align 4
  call void @audit_arg_euid(i32 %9) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body4

do.body4:                                         ; preds = %do.end
  %call5 = call %struct.thread* @__curthread() #6
  %td_pflags6 = getelementptr inbounds %struct.thread, %struct.thread* %call5, i32 0, i32 18
  %10 = load i32, i32* %td_pflags6, align 4
  %and7 = and i32 %10, 16777216
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body4
  %11 = load i32, i32* %ruid, align 4
  call void @audit_arg_ruid(i32 %11) #5
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body4
  br label %do.end11

do.end11:                                         ; preds = %if.end10
  br label %do.body12

do.body12:                                        ; preds = %do.end11
  %call13 = call %struct.thread* @__curthread() #6
  %td_pflags14 = getelementptr inbounds %struct.thread, %struct.thread* %call13, i32 0, i32 18
  %12 = load i32, i32* %td_pflags14, align 4
  %and15 = and i32 %12, 16777216
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body12
  %13 = load i32, i32* %suid, align 4
  call void @audit_arg_suid(i32 %13) #5
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body12
  br label %do.end19

do.end19:                                         ; preds = %if.end18
  %call20 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call20, %struct.ucred** %newcred, align 8
  %14 = load i32, i32* %euid, align 4
  %call21 = call %struct.uidinfo* @uifind(i32 %14) #5
  store %struct.uidinfo* %call21, %struct.uidinfo** %euip, align 8
  %15 = load i32, i32* %ruid, align 4
  %call22 = call %struct.uidinfo* @uifind(i32 %15) #5
  store %struct.uidinfo* %call22, %struct.uidinfo** %ruip, align 8
  %16 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %16, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1037) #5
  %17 = load %struct.proc*, %struct.proc** %p, align 8
  %18 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call23 = call %struct.ucred* @crcopysafe(%struct.proc* %17, %struct.ucred* %18) #5
  store %struct.ucred* %call23, %struct.ucred** %oldcred, align 8
  %19 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %20 = load i32, i32* %ruid, align 4
  %21 = load i32, i32* %euid, align 4
  %22 = load i32, i32* %suid, align 4
  %call24 = call i32 @mac_cred_check_setresuid(%struct.ucred* %19, i32 %20, i32 %21, i32 %22) #5
  store i32 %call24, i32* %error, align 4
  %23 = load i32, i32* %error, align 4
  %tobool25 = icmp ne i32 %23, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %do.end19
  br label %fail

if.end27:                                         ; preds = %do.end19
  %24 = load i32, i32* %ruid, align 4
  %cmp = icmp ne i32 %24, -1
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %if.end27
  %25 = load i32, i32* %ruid, align 4
  %26 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %26, i32 0, i32 2
  %27 = load i32, i32* %cr_ruid, align 4
  %cmp28 = icmp ne i32 %25, %27
  br i1 %cmp28, label %land.lhs.true29, label %lor.lhs.false

land.lhs.true29:                                  ; preds = %land.lhs.true
  %28 = load i32, i32* %ruid, align 4
  %29 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %29, i32 0, i32 3
  %30 = load i32, i32* %cr_svuid, align 4
  %cmp30 = icmp ne i32 %28, %30
  br i1 %cmp30, label %land.lhs.true31, label %lor.lhs.false

land.lhs.true31:                                  ; preds = %land.lhs.true29
  %31 = load i32, i32* %ruid, align 4
  %32 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %32, i32 0, i32 1
  %33 = load i32, i32* %cr_uid, align 4
  %cmp32 = icmp ne i32 %31, %33
  br i1 %cmp32, label %land.lhs.true54, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true31, %land.lhs.true29, %land.lhs.true, %if.end27
  %34 = load i32, i32* %euid, align 4
  %cmp33 = icmp ne i32 %34, -1
  br i1 %cmp33, label %land.lhs.true34, label %lor.lhs.false43

land.lhs.true34:                                  ; preds = %lor.lhs.false
  %35 = load i32, i32* %euid, align 4
  %36 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid35 = getelementptr inbounds %struct.ucred, %struct.ucred* %36, i32 0, i32 2
  %37 = load i32, i32* %cr_ruid35, align 4
  %cmp36 = icmp ne i32 %35, %37
  br i1 %cmp36, label %land.lhs.true37, label %lor.lhs.false43

land.lhs.true37:                                  ; preds = %land.lhs.true34
  %38 = load i32, i32* %euid, align 4
  %39 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid38 = getelementptr inbounds %struct.ucred, %struct.ucred* %39, i32 0, i32 3
  %40 = load i32, i32* %cr_svuid38, align 4
  %cmp39 = icmp ne i32 %38, %40
  br i1 %cmp39, label %land.lhs.true40, label %lor.lhs.false43

land.lhs.true40:                                  ; preds = %land.lhs.true37
  %41 = load i32, i32* %euid, align 4
  %42 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid41 = getelementptr inbounds %struct.ucred, %struct.ucred* %42, i32 0, i32 1
  %43 = load i32, i32* %cr_uid41, align 4
  %cmp42 = icmp ne i32 %41, %43
  br i1 %cmp42, label %land.lhs.true54, label %lor.lhs.false43

lor.lhs.false43:                                  ; preds = %land.lhs.true40, %land.lhs.true37, %land.lhs.true34, %lor.lhs.false
  %44 = load i32, i32* %suid, align 4
  %cmp44 = icmp ne i32 %44, -1
  br i1 %cmp44, label %land.lhs.true45, label %if.end58

land.lhs.true45:                                  ; preds = %lor.lhs.false43
  %45 = load i32, i32* %suid, align 4
  %46 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid46 = getelementptr inbounds %struct.ucred, %struct.ucred* %46, i32 0, i32 2
  %47 = load i32, i32* %cr_ruid46, align 4
  %cmp47 = icmp ne i32 %45, %47
  br i1 %cmp47, label %land.lhs.true48, label %if.end58

land.lhs.true48:                                  ; preds = %land.lhs.true45
  %48 = load i32, i32* %suid, align 4
  %49 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid49 = getelementptr inbounds %struct.ucred, %struct.ucred* %49, i32 0, i32 3
  %50 = load i32, i32* %cr_svuid49, align 4
  %cmp50 = icmp ne i32 %48, %50
  br i1 %cmp50, label %land.lhs.true51, label %if.end58

land.lhs.true51:                                  ; preds = %land.lhs.true48
  %51 = load i32, i32* %suid, align 4
  %52 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid52 = getelementptr inbounds %struct.ucred, %struct.ucred* %52, i32 0, i32 1
  %53 = load i32, i32* %cr_uid52, align 4
  %cmp53 = icmp ne i32 %51, %53
  br i1 %cmp53, label %land.lhs.true54, label %if.end58

land.lhs.true54:                                  ; preds = %land.lhs.true51, %land.lhs.true40, %land.lhs.true31
  %54 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call55 = call i32 @priv_check_cred(%struct.ucred* %54, i32 57, i32 0) #5
  store i32 %call55, i32* %error, align 4
  %cmp56 = icmp ne i32 %call55, 0
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true54
  br label %fail

if.end58:                                         ; preds = %land.lhs.true54, %land.lhs.true51, %land.lhs.true48, %land.lhs.true45, %lor.lhs.false43
  %55 = load i32, i32* %euid, align 4
  %cmp59 = icmp ne i32 %55, -1
  br i1 %cmp59, label %land.lhs.true60, label %if.end64

land.lhs.true60:                                  ; preds = %if.end58
  %56 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_uid61 = getelementptr inbounds %struct.ucred, %struct.ucred* %56, i32 0, i32 1
  %57 = load i32, i32* %cr_uid61, align 4
  %58 = load i32, i32* %euid, align 4
  %cmp62 = icmp ne i32 %57, %58
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %land.lhs.true60
  %59 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %60 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @change_euid(%struct.ucred* %59, %struct.uidinfo* %60) #5
  %61 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %61) #5
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %land.lhs.true60, %if.end58
  %62 = load i32, i32* %ruid, align 4
  %cmp65 = icmp ne i32 %62, -1
  br i1 %cmp65, label %land.lhs.true66, label %if.end70

land.lhs.true66:                                  ; preds = %if.end64
  %63 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_ruid67 = getelementptr inbounds %struct.ucred, %struct.ucred* %63, i32 0, i32 2
  %64 = load i32, i32* %cr_ruid67, align 4
  %65 = load i32, i32* %ruid, align 4
  %cmp68 = icmp ne i32 %64, %65
  br i1 %cmp68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %land.lhs.true66
  %66 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %67 = load %struct.uidinfo*, %struct.uidinfo** %ruip, align 8
  call void @change_ruid(%struct.ucred* %66, %struct.uidinfo* %67) #5
  %68 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %68) #5
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %land.lhs.true66, %if.end64
  %69 = load i32, i32* %suid, align 4
  %cmp71 = icmp ne i32 %69, -1
  br i1 %cmp71, label %land.lhs.true72, label %if.end76

land.lhs.true72:                                  ; preds = %if.end70
  %70 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svuid73 = getelementptr inbounds %struct.ucred, %struct.ucred* %70, i32 0, i32 3
  %71 = load i32, i32* %cr_svuid73, align 4
  %72 = load i32, i32* %suid, align 4
  %cmp74 = icmp ne i32 %71, %72
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %land.lhs.true72
  %73 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %74 = load i32, i32* %suid, align 4
  call void @change_svuid(%struct.ucred* %73, i32 %74) #5
  %75 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %75) #5
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %land.lhs.true72, %if.end70
  %76 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %77 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %77, i32 0, i32 3
  store %struct.ucred* %76, %struct.ucred** %p_ucred, align 8
  %78 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx77 = getelementptr inbounds %struct.proc, %struct.proc* %78, i32 0, i32 18
  %mtx_lock78 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx77, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock78, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1071) #5
  %79 = load %struct.uidinfo*, %struct.uidinfo** %ruip, align 8
  call void @uifree(%struct.uidinfo* %79) #5
  %80 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @uifree(%struct.uidinfo* %80) #5
  %81 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %81) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then57, %if.then26
  %82 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx79 = getelementptr inbounds %struct.proc, %struct.proc* %82, i32 0, i32 18
  %mtx_lock80 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx79, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock80, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1081) #5
  %83 = load %struct.uidinfo*, %struct.uidinfo** %ruip, align 8
  call void @uifree(%struct.uidinfo* %83) #5
  %84 = load %struct.uidinfo*, %struct.uidinfo** %euip, align 8
  call void @uifree(%struct.uidinfo* %84) #5
  %85 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %85) #5
  %86 = load i32, i32* %error, align 4
  store i32 %86, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end76
  %87 = load i32, i32* %retval
  ret i32 %87
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_suid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setresuid(%struct.ucred*, i32, i32, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setresgid(%struct.thread* %td, %struct.setresgid_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setresgid_args*, align 8
  %p = alloca %struct.proc*, align 8
  %newcred = alloca %struct.ucred*, align 8
  %oldcred = alloca %struct.ucred*, align 8
  %egid = alloca i32, align 4
  %rgid = alloca i32, align 4
  %sgid = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setresgid_args* %uap, %struct.setresgid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.setresgid_args*, %struct.setresgid_args** %uap.addr, align 8
  %egid1 = getelementptr inbounds %struct.setresgid_args, %struct.setresgid_args* %2, i32 0, i32 4
  %3 = load i32, i32* %egid1, align 4
  store i32 %3, i32* %egid, align 4
  %4 = load %struct.setresgid_args*, %struct.setresgid_args** %uap.addr, align 8
  %rgid2 = getelementptr inbounds %struct.setresgid_args, %struct.setresgid_args* %4, i32 0, i32 1
  %5 = load i32, i32* %rgid2, align 4
  store i32 %5, i32* %rgid, align 4
  %6 = load %struct.setresgid_args*, %struct.setresgid_args** %uap.addr, align 8
  %sgid3 = getelementptr inbounds %struct.setresgid_args, %struct.setresgid_args* %6, i32 0, i32 7
  %7 = load i32, i32* %sgid3, align 4
  store i32 %7, i32* %sgid, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call %struct.thread* @__curthread() #6
  %td_pflags = getelementptr inbounds %struct.thread, %struct.thread* %call, i32 0, i32 18
  %8 = load i32, i32* %td_pflags, align 4
  %and = and i32 %8, 16777216
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %9 = load i32, i32* %egid, align 4
  call void @audit_arg_egid(i32 %9) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body4

do.body4:                                         ; preds = %do.end
  %call5 = call %struct.thread* @__curthread() #6
  %td_pflags6 = getelementptr inbounds %struct.thread, %struct.thread* %call5, i32 0, i32 18
  %10 = load i32, i32* %td_pflags6, align 4
  %and7 = and i32 %10, 16777216
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body4
  %11 = load i32, i32* %rgid, align 4
  call void @audit_arg_rgid(i32 %11) #5
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body4
  br label %do.end11

do.end11:                                         ; preds = %if.end10
  br label %do.body12

do.body12:                                        ; preds = %do.end11
  %call13 = call %struct.thread* @__curthread() #6
  %td_pflags14 = getelementptr inbounds %struct.thread, %struct.thread* %call13, i32 0, i32 18
  %12 = load i32, i32* %td_pflags14, align 4
  %and15 = and i32 %12, 16777216
  %tobool16 = icmp ne i32 %and15, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body12
  %13 = load i32, i32* %sgid, align 4
  call void @audit_arg_sgid(i32 %13) #5
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body12
  br label %do.end19

do.end19:                                         ; preds = %if.end18
  %call20 = call %struct.ucred* @crget() #5
  store %struct.ucred* %call20, %struct.ucred** %newcred, align 8
  %14 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %14, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1116) #5
  %15 = load %struct.proc*, %struct.proc** %p, align 8
  %16 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %call21 = call %struct.ucred* @crcopysafe(%struct.proc* %15, %struct.ucred* %16) #5
  store %struct.ucred* %call21, %struct.ucred** %oldcred, align 8
  %17 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %18 = load i32, i32* %rgid, align 4
  %19 = load i32, i32* %egid, align 4
  %20 = load i32, i32* %sgid, align 4
  %call22 = call i32 @mac_cred_check_setresgid(%struct.ucred* %17, i32 %18, i32 %19, i32 %20) #5
  store i32 %call22, i32* %error, align 4
  %21 = load i32, i32* %error, align 4
  %tobool23 = icmp ne i32 %21, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %do.end19
  br label %fail

if.end25:                                         ; preds = %do.end19
  %22 = load i32, i32* %rgid, align 4
  %cmp = icmp ne i32 %22, -1
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %if.end25
  %23 = load i32, i32* %rgid, align 4
  %24 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %24, i32 0, i32 5
  %25 = load i32, i32* %cr_rgid, align 4
  %cmp26 = icmp ne i32 %23, %25
  br i1 %cmp26, label %land.lhs.true27, label %lor.lhs.false

land.lhs.true27:                                  ; preds = %land.lhs.true
  %26 = load i32, i32* %rgid, align 4
  %27 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %27, i32 0, i32 6
  %28 = load i32, i32* %cr_svgid, align 4
  %cmp28 = icmp ne i32 %26, %28
  br i1 %cmp28, label %land.lhs.true29, label %lor.lhs.false

land.lhs.true29:                                  ; preds = %land.lhs.true27
  %29 = load i32, i32* %rgid, align 4
  %30 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %30, i32 0, i32 15
  %31 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %31, i64 0
  %32 = load i32, i32* %arrayidx, align 4
  %cmp30 = icmp ne i32 %29, %32
  br i1 %cmp30, label %land.lhs.true54, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true29, %land.lhs.true27, %land.lhs.true, %if.end25
  %33 = load i32, i32* %egid, align 4
  %cmp31 = icmp ne i32 %33, -1
  br i1 %cmp31, label %land.lhs.true32, label %lor.lhs.false42

land.lhs.true32:                                  ; preds = %lor.lhs.false
  %34 = load i32, i32* %egid, align 4
  %35 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid33 = getelementptr inbounds %struct.ucred, %struct.ucred* %35, i32 0, i32 5
  %36 = load i32, i32* %cr_rgid33, align 4
  %cmp34 = icmp ne i32 %34, %36
  br i1 %cmp34, label %land.lhs.true35, label %lor.lhs.false42

land.lhs.true35:                                  ; preds = %land.lhs.true32
  %37 = load i32, i32* %egid, align 4
  %38 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid36 = getelementptr inbounds %struct.ucred, %struct.ucred* %38, i32 0, i32 6
  %39 = load i32, i32* %cr_svgid36, align 4
  %cmp37 = icmp ne i32 %37, %39
  br i1 %cmp37, label %land.lhs.true38, label %lor.lhs.false42

land.lhs.true38:                                  ; preds = %land.lhs.true35
  %40 = load i32, i32* %egid, align 4
  %41 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups39 = getelementptr inbounds %struct.ucred, %struct.ucred* %41, i32 0, i32 15
  %42 = load i32*, i32** %cr_groups39, align 8
  %arrayidx40 = getelementptr inbounds i32, i32* %42, i64 0
  %43 = load i32, i32* %arrayidx40, align 4
  %cmp41 = icmp ne i32 %40, %43
  br i1 %cmp41, label %land.lhs.true54, label %lor.lhs.false42

lor.lhs.false42:                                  ; preds = %land.lhs.true38, %land.lhs.true35, %land.lhs.true32, %lor.lhs.false
  %44 = load i32, i32* %sgid, align 4
  %cmp43 = icmp ne i32 %44, -1
  br i1 %cmp43, label %land.lhs.true44, label %if.end58

land.lhs.true44:                                  ; preds = %lor.lhs.false42
  %45 = load i32, i32* %sgid, align 4
  %46 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid45 = getelementptr inbounds %struct.ucred, %struct.ucred* %46, i32 0, i32 5
  %47 = load i32, i32* %cr_rgid45, align 4
  %cmp46 = icmp ne i32 %45, %47
  br i1 %cmp46, label %land.lhs.true47, label %if.end58

land.lhs.true47:                                  ; preds = %land.lhs.true44
  %48 = load i32, i32* %sgid, align 4
  %49 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid48 = getelementptr inbounds %struct.ucred, %struct.ucred* %49, i32 0, i32 6
  %50 = load i32, i32* %cr_svgid48, align 4
  %cmp49 = icmp ne i32 %48, %50
  br i1 %cmp49, label %land.lhs.true50, label %if.end58

land.lhs.true50:                                  ; preds = %land.lhs.true47
  %51 = load i32, i32* %sgid, align 4
  %52 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups51 = getelementptr inbounds %struct.ucred, %struct.ucred* %52, i32 0, i32 15
  %53 = load i32*, i32** %cr_groups51, align 8
  %arrayidx52 = getelementptr inbounds i32, i32* %53, i64 0
  %54 = load i32, i32* %arrayidx52, align 4
  %cmp53 = icmp ne i32 %51, %54
  br i1 %cmp53, label %land.lhs.true54, label %if.end58

land.lhs.true54:                                  ; preds = %land.lhs.true50, %land.lhs.true38, %land.lhs.true29
  %55 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %call55 = call i32 @priv_check_cred(%struct.ucred* %55, i32 58, i32 0) #5
  store i32 %call55, i32* %error, align 4
  %cmp56 = icmp ne i32 %call55, 0
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %land.lhs.true54
  br label %fail

if.end58:                                         ; preds = %land.lhs.true54, %land.lhs.true50, %land.lhs.true47, %land.lhs.true44, %lor.lhs.false42
  %56 = load i32, i32* %egid, align 4
  %cmp59 = icmp ne i32 %56, -1
  br i1 %cmp59, label %land.lhs.true60, label %if.end65

land.lhs.true60:                                  ; preds = %if.end58
  %57 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_groups61 = getelementptr inbounds %struct.ucred, %struct.ucred* %57, i32 0, i32 15
  %58 = load i32*, i32** %cr_groups61, align 8
  %arrayidx62 = getelementptr inbounds i32, i32* %58, i64 0
  %59 = load i32, i32* %arrayidx62, align 4
  %60 = load i32, i32* %egid, align 4
  %cmp63 = icmp ne i32 %59, %60
  br i1 %cmp63, label %if.then64, label %if.end65

if.then64:                                        ; preds = %land.lhs.true60
  %61 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %62 = load i32, i32* %egid, align 4
  call void @change_egid(%struct.ucred* %61, i32 %62) #5
  %63 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %63) #5
  br label %if.end65

if.end65:                                         ; preds = %if.then64, %land.lhs.true60, %if.end58
  %64 = load i32, i32* %rgid, align 4
  %cmp66 = icmp ne i32 %64, -1
  br i1 %cmp66, label %land.lhs.true67, label %if.end71

land.lhs.true67:                                  ; preds = %if.end65
  %65 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_rgid68 = getelementptr inbounds %struct.ucred, %struct.ucred* %65, i32 0, i32 5
  %66 = load i32, i32* %cr_rgid68, align 4
  %67 = load i32, i32* %rgid, align 4
  %cmp69 = icmp ne i32 %66, %67
  br i1 %cmp69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %land.lhs.true67
  %68 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %69 = load i32, i32* %rgid, align 4
  call void @change_rgid(%struct.ucred* %68, i32 %69) #5
  %70 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %70) #5
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %land.lhs.true67, %if.end65
  %71 = load i32, i32* %sgid, align 4
  %cmp72 = icmp ne i32 %71, -1
  br i1 %cmp72, label %land.lhs.true73, label %if.end77

land.lhs.true73:                                  ; preds = %if.end71
  %72 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  %cr_svgid74 = getelementptr inbounds %struct.ucred, %struct.ucred* %72, i32 0, i32 6
  %73 = load i32, i32* %cr_svgid74, align 4
  %74 = load i32, i32* %sgid, align 4
  %cmp75 = icmp ne i32 %73, %74
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %land.lhs.true73
  %75 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %76 = load i32, i32* %sgid, align 4
  call void @change_svgid(%struct.ucred* %75, i32 %76) #5
  %77 = load %struct.proc*, %struct.proc** %p, align 8
  call void @setsugid(%struct.proc* %77) #5
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %land.lhs.true73, %if.end71
  %78 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  %79 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %79, i32 0, i32 3
  store %struct.ucred* %78, %struct.ucred** %p_ucred, align 8
  %80 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx78 = getelementptr inbounds %struct.proc, %struct.proc* %80, i32 0, i32 18
  %mtx_lock79 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx78, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock79, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1150) #5
  %81 = load %struct.ucred*, %struct.ucred** %oldcred, align 8
  call void @crfree(%struct.ucred* %81) #5
  store i32 0, i32* %retval
  br label %return

fail:                                             ; preds = %if.then57, %if.then24
  %82 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx80 = getelementptr inbounds %struct.proc, %struct.proc* %82, i32 0, i32 18
  %mtx_lock81 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx80, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock81, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1155) #5
  %83 = load %struct.ucred*, %struct.ucred** %newcred, align 8
  call void @crfree(%struct.ucred* %83) #5
  %84 = load i32, i32* %error, align 4
  store i32 %84, i32* %retval
  br label %return

return:                                           ; preds = %fail, %if.end77
  %85 = load i32, i32* %retval
  ret i32 %85
}

; Function Attrs: noimplicitfloat noredzone
declare void @audit_arg_sgid(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_setresgid(%struct.ucred*, i32, i32, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getresuid(%struct.thread* %td, %struct.getresuid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getresuid_args*, align 8
  %cred = alloca %struct.ucred*, align 8
  %error1 = alloca i32, align 4
  %error2 = alloca i32, align 4
  %error3 = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getresuid_args* %uap, %struct.getresuid_args** %uap.addr, align 8
  store i32 0, i32* %error1, align 4
  store i32 0, i32* %error2, align 4
  store i32 0, i32* %error3, align 4
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  store %struct.ucred* %1, %struct.ucred** %cred, align 8
  %2 = load %struct.getresuid_args*, %struct.getresuid_args** %uap.addr, align 8
  %ruid = getelementptr inbounds %struct.getresuid_args, %struct.getresuid_args* %2, i32 0, i32 1
  %3 = load i32*, i32** %ruid, align 8
  %tobool = icmp ne i32* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %4, i32 0, i32 2
  %5 = bitcast i32* %cr_ruid to i8*
  %6 = load %struct.getresuid_args*, %struct.getresuid_args** %uap.addr, align 8
  %ruid1 = getelementptr inbounds %struct.getresuid_args, %struct.getresuid_args* %6, i32 0, i32 1
  %7 = load i32*, i32** %ruid1, align 8
  %8 = bitcast i32* %7 to i8*
  %call = call i32 @copyout(i8* %5, i8* %8, i64 4) #5
  store i32 %call, i32* %error1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load %struct.getresuid_args*, %struct.getresuid_args** %uap.addr, align 8
  %euid = getelementptr inbounds %struct.getresuid_args, %struct.getresuid_args* %9, i32 0, i32 4
  %10 = load i32*, i32** %euid, align 8
  %tobool2 = icmp ne i32* %10, null
  br i1 %tobool2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %11 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %11, i32 0, i32 1
  %12 = bitcast i32* %cr_uid to i8*
  %13 = load %struct.getresuid_args*, %struct.getresuid_args** %uap.addr, align 8
  %euid4 = getelementptr inbounds %struct.getresuid_args, %struct.getresuid_args* %13, i32 0, i32 4
  %14 = load i32*, i32** %euid4, align 8
  %15 = bitcast i32* %14 to i8*
  %call5 = call i32 @copyout(i8* %12, i8* %15, i64 4) #5
  store i32 %call5, i32* %error2, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then3, %if.end
  %16 = load %struct.getresuid_args*, %struct.getresuid_args** %uap.addr, align 8
  %suid = getelementptr inbounds %struct.getresuid_args, %struct.getresuid_args* %16, i32 0, i32 7
  %17 = load i32*, i32** %suid, align 8
  %tobool7 = icmp ne i32* %17, null
  br i1 %tobool7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.end6
  %18 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %18, i32 0, i32 3
  %19 = bitcast i32* %cr_svuid to i8*
  %20 = load %struct.getresuid_args*, %struct.getresuid_args** %uap.addr, align 8
  %suid9 = getelementptr inbounds %struct.getresuid_args, %struct.getresuid_args* %20, i32 0, i32 7
  %21 = load i32*, i32** %suid9, align 8
  %22 = bitcast i32* %21 to i8*
  %call10 = call i32 @copyout(i8* %19, i8* %22, i64 4) #5
  store i32 %call10, i32* %error3, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.end6
  %23 = load i32, i32* %error1, align 4
  %tobool12 = icmp ne i32 %23, 0
  br i1 %tobool12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end11
  %24 = load i32, i32* %error1, align 4
  br label %cond.end16

cond.false:                                       ; preds = %if.end11
  %25 = load i32, i32* %error2, align 4
  %tobool13 = icmp ne i32 %25, 0
  br i1 %tobool13, label %cond.true14, label %cond.false15

cond.true14:                                      ; preds = %cond.false
  %26 = load i32, i32* %error2, align 4
  br label %cond.end

cond.false15:                                     ; preds = %cond.false
  %27 = load i32, i32* %error3, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false15, %cond.true14
  %cond = phi i32 [ %26, %cond.true14 ], [ %27, %cond.false15 ]
  br label %cond.end16

cond.end16:                                       ; preds = %cond.end, %cond.true
  %cond17 = phi i32 [ %24, %cond.true ], [ %cond, %cond.end ]
  ret i32 %cond17
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getresgid(%struct.thread* %td, %struct.getresgid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getresgid_args*, align 8
  %cred = alloca %struct.ucred*, align 8
  %error1 = alloca i32, align 4
  %error2 = alloca i32, align 4
  %error3 = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getresgid_args* %uap, %struct.getresgid_args** %uap.addr, align 8
  store i32 0, i32* %error1, align 4
  store i32 0, i32* %error2, align 4
  store i32 0, i32* %error3, align 4
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 37
  %1 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  store %struct.ucred* %1, %struct.ucred** %cred, align 8
  %2 = load %struct.getresgid_args*, %struct.getresgid_args** %uap.addr, align 8
  %rgid = getelementptr inbounds %struct.getresgid_args, %struct.getresgid_args* %2, i32 0, i32 1
  %3 = load i32*, i32** %rgid, align 8
  %tobool = icmp ne i32* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %4, i32 0, i32 5
  %5 = bitcast i32* %cr_rgid to i8*
  %6 = load %struct.getresgid_args*, %struct.getresgid_args** %uap.addr, align 8
  %rgid1 = getelementptr inbounds %struct.getresgid_args, %struct.getresgid_args* %6, i32 0, i32 1
  %7 = load i32*, i32** %rgid1, align 8
  %8 = bitcast i32* %7 to i8*
  %call = call i32 @copyout(i8* %5, i8* %8, i64 4) #5
  store i32 %call, i32* %error1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load %struct.getresgid_args*, %struct.getresgid_args** %uap.addr, align 8
  %egid = getelementptr inbounds %struct.getresgid_args, %struct.getresgid_args* %9, i32 0, i32 4
  %10 = load i32*, i32** %egid, align 8
  %tobool2 = icmp ne i32* %10, null
  br i1 %tobool2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %11 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %11, i32 0, i32 15
  %12 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0
  %13 = bitcast i32* %arrayidx to i8*
  %14 = load %struct.getresgid_args*, %struct.getresgid_args** %uap.addr, align 8
  %egid4 = getelementptr inbounds %struct.getresgid_args, %struct.getresgid_args* %14, i32 0, i32 4
  %15 = load i32*, i32** %egid4, align 8
  %16 = bitcast i32* %15 to i8*
  %call5 = call i32 @copyout(i8* %13, i8* %16, i64 4) #5
  store i32 %call5, i32* %error2, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then3, %if.end
  %17 = load %struct.getresgid_args*, %struct.getresgid_args** %uap.addr, align 8
  %sgid = getelementptr inbounds %struct.getresgid_args, %struct.getresgid_args* %17, i32 0, i32 7
  %18 = load i32*, i32** %sgid, align 8
  %tobool7 = icmp ne i32* %18, null
  br i1 %tobool7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.end6
  %19 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 6
  %20 = bitcast i32* %cr_svgid to i8*
  %21 = load %struct.getresgid_args*, %struct.getresgid_args** %uap.addr, align 8
  %sgid9 = getelementptr inbounds %struct.getresgid_args, %struct.getresgid_args* %21, i32 0, i32 7
  %22 = load i32*, i32** %sgid9, align 8
  %23 = bitcast i32* %22 to i8*
  %call10 = call i32 @copyout(i8* %20, i8* %23, i64 4) #5
  store i32 %call10, i32* %error3, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.end6
  %24 = load i32, i32* %error1, align 4
  %tobool12 = icmp ne i32 %24, 0
  br i1 %tobool12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end11
  %25 = load i32, i32* %error1, align 4
  br label %cond.end16

cond.false:                                       ; preds = %if.end11
  %26 = load i32, i32* %error2, align 4
  %tobool13 = icmp ne i32 %26, 0
  br i1 %tobool13, label %cond.true14, label %cond.false15

cond.true14:                                      ; preds = %cond.false
  %27 = load i32, i32* %error2, align 4
  br label %cond.end

cond.false15:                                     ; preds = %cond.false
  %28 = load i32, i32* %error3, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false15, %cond.true14
  %cond = phi i32 [ %27, %cond.true14 ], [ %28, %cond.false15 ]
  br label %cond.end16

cond.end16:                                       ; preds = %cond.end, %cond.true
  %cond17 = phi i32 [ %25, %cond.true ], [ %cond, %cond.end ]
  ret i32 %cond17
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_issetugid(%struct.thread* %td, %struct.issetugid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.issetugid_args*, align 8
  %p = alloca %struct.proc*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.issetugid_args* %uap, %struct.issetugid_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %2, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1233) #5
  %3 = load %struct.proc*, %struct.proc** %p, align 8
  %p_flag = getelementptr inbounds %struct.proc, %struct.proc* %3, i32 0, i32 10
  %4 = load i32, i32* %p_flag, align 4
  %and = and i32 %4, 256
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 1, i32 0
  %conv = sext i32 %cond to i64
  %5 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_retval = getelementptr inbounds %struct.thread, %struct.thread* %5, i32 0, i32 78
  %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* %td_retval, i32 0, i64 0
  store i64 %conv, i64* %arrayidx, align 8
  %6 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx1 = getelementptr inbounds %struct.proc, %struct.proc* %6, i32 0, i32 18
  %mtx_lock2 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx1, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock2, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1235) #5
  ret i32 0
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys___setugid(%struct.thread* %td, %struct.__setugid_args* %uap) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.__setugid_args*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.__setugid_args* %uap, %struct.__setugid_args** %uap.addr, align 8
  ret i32 78
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @groupmember(i32 %gid, %struct.ucred* %cred) #0 {
entry:
  %retval = alloca i32, align 4
  %gid.addr = alloca i32, align 4
  %cred.addr = alloca %struct.ucred*, align 8
  %l = alloca i32, align 4
  %h = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %gid, i32* %gid.addr, align 4
  store %struct.ucred* %cred, %struct.ucred** %cred.addr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 15
  %1 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0
  %2 = load i32, i32* %arrayidx, align 4
  %3 = load i32, i32* %gid.addr, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %l, align 4
  %4 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %4, i32 0, i32 4
  %5 = load i32, i32* %cr_ngroups, align 4
  store i32 %5, i32* %h, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end7, %if.end
  %6 = load i32, i32* %l, align 4
  %7 = load i32, i32* %h, align 4
  %cmp1 = icmp slt i32 %6, %7
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* %l, align 4
  %9 = load i32, i32* %h, align 4
  %10 = load i32, i32* %l, align 4
  %sub = sub nsw i32 %9, %10
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %8, %div
  store i32 %add, i32* %m, align 4
  %11 = load i32, i32* %m, align 4
  %idxprom = sext i32 %11 to i64
  %12 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_groups2 = getelementptr inbounds %struct.ucred, %struct.ucred* %12, i32 0, i32 15
  %13 = load i32*, i32** %cr_groups2, align 8
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 %idxprom
  %14 = load i32, i32* %arrayidx3, align 4
  %15 = load i32, i32* %gid.addr, align 4
  %cmp4 = icmp ult i32 %14, %15
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %while.body
  %16 = load i32, i32* %m, align 4
  %add6 = add nsw i32 %16, 1
  store i32 %add6, i32* %l, align 4
  br label %if.end7

if.else:                                          ; preds = %while.body
  %17 = load i32, i32* %m, align 4
  store i32 %17, i32* %h, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then5
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load i32, i32* %l, align 4
  %19 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_ngroups8 = getelementptr inbounds %struct.ucred, %struct.ucred* %19, i32 0, i32 4
  %20 = load i32, i32* %cr_ngroups8, align 4
  %cmp9 = icmp slt i32 %18, %20
  br i1 %cmp9, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %while.end
  %21 = load i32, i32* %l, align 4
  %idxprom10 = sext i32 %21 to i64
  %22 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_groups11 = getelementptr inbounds %struct.ucred, %struct.ucred* %22, i32 0, i32 15
  %23 = load i32*, i32** %cr_groups11, align 8
  %arrayidx12 = getelementptr inbounds i32, i32* %23, i64 %idxprom10
  %24 = load i32, i32* %arrayidx12, align 4
  %25 = load i32, i32* %gid.addr, align 4
  %cmp13 = icmp eq i32 %24, %25
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.end15:                                         ; preds = %land.lhs.true, %while.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end15, %if.then14, %if.then
  %26 = load i32, i32* %retval
  ret i32 %26
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @securelevel_gt(%struct.ucred* %cr, i32 %level) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %level.addr = alloca i32, align 4
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  store i32 %level, i32* %level.addr, align 4
  %0 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_prison = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 9
  %1 = load %struct.prison*, %struct.prison** %cr_prison, align 8
  %pr_securelevel = getelementptr inbounds %struct.prison, %struct.prison* %1, i32 0, i32 23
  %2 = load i32, i32* %pr_securelevel, align 4
  %3 = load i32, i32* %level.addr, align 4
  %cmp = icmp sgt i32 %2, %3
  %cond = select i1 %cmp, i32 1, i32 0
  ret i32 %cond
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @securelevel_ge(%struct.ucred* %cr, i32 %level) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %level.addr = alloca i32, align 4
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  store i32 %level, i32* %level.addr, align 4
  %0 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_prison = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 9
  %1 = load %struct.prison*, %struct.prison** %cr_prison, align 8
  %pr_securelevel = getelementptr inbounds %struct.prison, %struct.prison* %1, i32 0, i32 23
  %2 = load i32, i32* %pr_securelevel, align 4
  %3 = load i32, i32* %level.addr, align 4
  %cmp = icmp sge i32 %2, %3
  %cond = select i1 %cmp, i32 1, i32 0
  ret i32 %cond
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cr_cansee(%struct.ucred* %u1, %struct.ucred* %u2) #0 {
entry:
  %retval = alloca i32, align 4
  %u1.addr = alloca %struct.ucred*, align 8
  %u2.addr = alloca %struct.ucred*, align 8
  %error = alloca i32, align 4
  store %struct.ucred* %u1, %struct.ucred** %u1.addr, align 8
  store %struct.ucred* %u2, %struct.ucred** %u2.addr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %1 = load %struct.ucred*, %struct.ucred** %u2.addr, align 8
  %call = call i32 @prison_check(%struct.ucred* %0, %struct.ucred* %1) #5
  store i32 %call, i32* %error, align 4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %error, align 4
  store i32 %2, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %4 = load %struct.ucred*, %struct.ucred** %u2.addr, align 8
  %call1 = call i32 @mac_cred_check_visible(%struct.ucred* %3, %struct.ucred* %4) #5
  store i32 %call1, i32* %error, align 4
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %5 = load i32, i32* %error, align 4
  store i32 %5, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %6 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %7 = load %struct.ucred*, %struct.ucred** %u2.addr, align 8
  %call5 = call i32 @cr_seeotheruids(%struct.ucred* %6, %struct.ucred* %7) #5
  store i32 %call5, i32* %error, align 4
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  %8 = load i32, i32* %error, align 4
  store i32 %8, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end4
  %9 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %10 = load %struct.ucred*, %struct.ucred** %u2.addr, align 8
  %call9 = call i32 @cr_seeothergids(%struct.ucred* %9, %struct.ucred* %10) #5
  store i32 %call9, i32* %error, align 4
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  %11 = load i32, i32* %error, align 4
  store i32 %11, i32* %retval
  br label %return

if.end12:                                         ; preds = %if.end8
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end12, %if.then11, %if.then7, %if.then3, %if.then
  %12 = load i32, i32* %retval
  ret i32 %12
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @prison_check(%struct.ucred*, %struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_cred_check_visible(%struct.ucred*, %struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cr_seeotheruids(%struct.ucred* %u1, %struct.ucred* %u2) #0 {
entry:
  %retval = alloca i32, align 4
  %u1.addr = alloca %struct.ucred*, align 8
  %u2.addr = alloca %struct.ucred*, align 8
  store %struct.ucred* %u1, %struct.ucred** %u1.addr, align 8
  store %struct.ucred* %u2, %struct.ucred** %u2.addr, align 8
  %0 = load i32, i32* @see_other_uids, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end4, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 2
  %2 = load i32, i32* %cr_ruid, align 4
  %3 = load %struct.ucred*, %struct.ucred** %u2.addr, align 8
  %cr_ruid1 = getelementptr inbounds %struct.ucred, %struct.ucred* %3, i32 0, i32 2
  %4 = load i32, i32* %cr_ruid1, align 4
  %cmp = icmp ne i32 %2, %4
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %5 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %call = call i32 @priv_check_cred(%struct.ucred* %5, i32 60, i32 0) #5
  %cmp2 = icmp ne i32 %call, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 3, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end4, %if.then3
  %6 = load i32, i32* %retval
  ret i32 %6
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define internal i32 @cr_seeothergids(%struct.ucred* %u1, %struct.ucred* %u2) #0 {
entry:
  %retval = alloca i32, align 4
  %u1.addr = alloca %struct.ucred*, align 8
  %u2.addr = alloca %struct.ucred*, align 8
  %i = alloca i32, align 4
  %match = alloca i32, align 4
  store %struct.ucred* %u1, %struct.ucred** %u1.addr, align 8
  store %struct.ucred* %u2, %struct.ucred** %u2.addr, align 8
  %0 = load i32, i32* @see_other_gids, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.end13, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %match, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %2 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %2, i32 0, i32 4
  %3 = load i32, i32* %cr_ngroups, align 4
  %cmp = icmp slt i32 %1, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %5, i32 0, i32 15
  %6 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  %7 = load i32, i32* %arrayidx, align 4
  %8 = load %struct.ucred*, %struct.ucred** %u2.addr, align 8
  %call = call i32 @groupmember(i32 %7, %struct.ucred* %8) #5
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %for.body
  store i32 1, i32* %match, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %for.body
  %9 = load i32, i32* %match, align 4
  %tobool3 = icmp ne i32 %9, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  br label %for.end

if.end5:                                          ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end5
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then4, %for.cond
  %11 = load i32, i32* %match, align 4
  %tobool6 = icmp ne i32 %11, 0
  br i1 %tobool6, label %if.end12, label %if.then7

if.then7:                                         ; preds = %for.end
  %12 = load %struct.ucred*, %struct.ucred** %u1.addr, align 8
  %call8 = call i32 @priv_check_cred(%struct.ucred* %12, i32 59, i32 0) #5
  %cmp9 = icmp ne i32 %call8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.then7
  store i32 3, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.then7
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %for.end
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end13, %if.then10
  %13 = load i32, i32* %retval
  ret i32 %13
}

; Function Attrs: noimplicitfloat noredzone
declare void @__mtx_assert(i64*, i32, i8*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cr_cansignal(%struct.ucred* %cred, %struct.proc* %proc, i32 %signum) #0 {
entry:
  %retval = alloca i32, align 4
  %cred.addr = alloca %struct.ucred*, align 8
  %proc.addr = alloca %struct.proc*, align 8
  %signum.addr = alloca i32, align 4
  %error = alloca i32, align 4
  store %struct.ucred* %cred, %struct.ucred** %cred.addr, align 8
  store %struct.proc* %proc, %struct.proc** %proc.addr, align 8
  store i32 %signum, i32* %signum.addr, align 4
  %0 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %0, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1463) #5
  %1 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %2 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %2, i32 0, i32 3
  %3 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  %call = call i32 @prison_check(%struct.ucred* %1, %struct.ucred* %3) #5
  store i32 %call, i32* %error, align 4
  %4 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %error, align 4
  store i32 %5, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %6 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %7 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %8 = load i32, i32* %signum.addr, align 4
  %call1 = call i32 @mac_proc_check_signal(%struct.ucred* %6, %struct.proc* %7, i32 %8) #5
  store i32 %call1, i32* %error, align 4
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %9 = load i32, i32* %error, align 4
  store i32 %9, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %10 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %11 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred5 = getelementptr inbounds %struct.proc, %struct.proc* %11, i32 0, i32 3
  %12 = load %struct.ucred*, %struct.ucred** %p_ucred5, align 8
  %call6 = call i32 @cr_seeotheruids(%struct.ucred* %10, %struct.ucred* %12) #5
  store i32 %call6, i32* %error, align 4
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %13 = load i32, i32* %error, align 4
  store i32 %13, i32* %retval
  br label %return

if.end9:                                          ; preds = %if.end4
  %14 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %15 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred10 = getelementptr inbounds %struct.proc, %struct.proc* %15, i32 0, i32 3
  %16 = load %struct.ucred*, %struct.ucred** %p_ucred10, align 8
  %call11 = call i32 @cr_seeothergids(%struct.ucred* %14, %struct.ucred* %16) #5
  store i32 %call11, i32* %error, align 4
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end9
  %17 = load i32, i32* %error, align 4
  store i32 %17, i32* %retval
  br label %return

if.end14:                                         ; preds = %if.end9
  %18 = load i32, i32* @conservative_signals, align 4
  %tobool15 = icmp ne i32 %18, 0
  br i1 %tobool15, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %if.end14
  %19 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_flag = getelementptr inbounds %struct.proc, %struct.proc* %19, i32 0, i32 10
  %20 = load i32, i32* %p_flag, align 4
  %and = and i32 %20, 256
  %tobool16 = icmp ne i32 %and, 0
  br i1 %tobool16, label %if.then17, label %if.end22

if.then17:                                        ; preds = %land.lhs.true
  %21 = load i32, i32* %signum.addr, align 4
  switch i32 %21, label %sw.default [
    i32 0, label %sw.bb
    i32 9, label %sw.bb
    i32 2, label %sw.bb
    i32 15, label %sw.bb
    i32 14, label %sw.bb
    i32 17, label %sw.bb
    i32 21, label %sw.bb
    i32 22, label %sw.bb
    i32 18, label %sw.bb
    i32 1, label %sw.bb
    i32 30, label %sw.bb
    i32 31, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17, %if.then17
  br label %sw.epilog

sw.default:                                       ; preds = %if.then17
  %22 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %call18 = call i32 @priv_check_cred(%struct.ucred* %22, i32 231, i32 0) #5
  store i32 %call18, i32* %error, align 4
  %23 = load i32, i32* %error, align 4
  %tobool19 = icmp ne i32 %23, 0
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %sw.default
  %24 = load i32, i32* %error, align 4
  store i32 %24, i32* %retval
  br label %return

if.end21:                                         ; preds = %sw.default
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end21, %sw.bb
  br label %if.end22

if.end22:                                         ; preds = %sw.epilog, %land.lhs.true, %if.end14
  %25 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %25, i32 0, i32 2
  %26 = load i32, i32* %cr_ruid, align 4
  %27 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred23 = getelementptr inbounds %struct.proc, %struct.proc* %27, i32 0, i32 3
  %28 = load %struct.ucred*, %struct.ucred** %p_ucred23, align 8
  %cr_ruid24 = getelementptr inbounds %struct.ucred, %struct.ucred* %28, i32 0, i32 2
  %29 = load i32, i32* %cr_ruid24, align 4
  %cmp = icmp ne i32 %26, %29
  br i1 %cmp, label %land.lhs.true25, label %if.end43

land.lhs.true25:                                  ; preds = %if.end22
  %30 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_ruid26 = getelementptr inbounds %struct.ucred, %struct.ucred* %30, i32 0, i32 2
  %31 = load i32, i32* %cr_ruid26, align 4
  %32 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred27 = getelementptr inbounds %struct.proc, %struct.proc* %32, i32 0, i32 3
  %33 = load %struct.ucred*, %struct.ucred** %p_ucred27, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %33, i32 0, i32 3
  %34 = load i32, i32* %cr_svuid, align 4
  %cmp28 = icmp ne i32 %31, %34
  br i1 %cmp28, label %land.lhs.true29, label %if.end43

land.lhs.true29:                                  ; preds = %land.lhs.true25
  %35 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %35, i32 0, i32 1
  %36 = load i32, i32* %cr_uid, align 4
  %37 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred30 = getelementptr inbounds %struct.proc, %struct.proc* %37, i32 0, i32 3
  %38 = load %struct.ucred*, %struct.ucred** %p_ucred30, align 8
  %cr_ruid31 = getelementptr inbounds %struct.ucred, %struct.ucred* %38, i32 0, i32 2
  %39 = load i32, i32* %cr_ruid31, align 4
  %cmp32 = icmp ne i32 %36, %39
  br i1 %cmp32, label %land.lhs.true33, label %if.end43

land.lhs.true33:                                  ; preds = %land.lhs.true29
  %40 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %cr_uid34 = getelementptr inbounds %struct.ucred, %struct.ucred* %40, i32 0, i32 1
  %41 = load i32, i32* %cr_uid34, align 4
  %42 = load %struct.proc*, %struct.proc** %proc.addr, align 8
  %p_ucred35 = getelementptr inbounds %struct.proc, %struct.proc* %42, i32 0, i32 3
  %43 = load %struct.ucred*, %struct.ucred** %p_ucred35, align 8
  %cr_svuid36 = getelementptr inbounds %struct.ucred, %struct.ucred* %43, i32 0, i32 3
  %44 = load i32, i32* %cr_svuid36, align 4
  %cmp37 = icmp ne i32 %41, %44
  br i1 %cmp37, label %if.then38, label %if.end43

if.then38:                                        ; preds = %land.lhs.true33
  %45 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %call39 = call i32 @priv_check_cred(%struct.ucred* %45, i32 230, i32 0) #5
  store i32 %call39, i32* %error, align 4
  %46 = load i32, i32* %error, align 4
  %tobool40 = icmp ne i32 %46, 0
  br i1 %tobool40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.then38
  %47 = load i32, i32* %error, align 4
  store i32 %47, i32* %retval
  br label %return

if.end42:                                         ; preds = %if.then38
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %land.lhs.true33, %land.lhs.true29, %land.lhs.true25, %if.end22
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end43, %if.then41, %if.then20, %if.then13, %if.then8, %if.then3, %if.then
  %48 = load i32, i32* %retval
  ret i32 %48
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_proc_check_signal(%struct.ucred*, %struct.proc*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @p_cansignal(%struct.thread* %td, %struct.proc* %p, i32 %signum) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %p.addr = alloca %struct.proc*, align 8
  %signum.addr = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  store i32 %signum, i32* %signum.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call %struct.thread* @__curthread() #6
  %cmp = icmp eq %struct.thread* %0, %call
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @__func__.p_cansignal, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1541) #5
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 1
  %3 = load %struct.proc*, %struct.proc** %td_proc, align 8
  %4 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %cmp1 = icmp eq %struct.proc* %3, %4
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  store i32 0, i32* %retval
  br label %return

if.end4:                                          ; preds = %do.end
  %5 = load i32, i32* %signum.addr, align 4
  %cmp5 = icmp eq i32 %5, 19
  br i1 %cmp5, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end4
  %6 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc7 = getelementptr inbounds %struct.thread, %struct.thread* %6, i32 0, i32 1
  %7 = load %struct.proc*, %struct.proc** %td_proc7, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 55
  %8 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_session = getelementptr inbounds %struct.pgrp, %struct.pgrp* %8, i32 0, i32 2
  %9 = load %struct.session*, %struct.session** %pg_session, align 8
  %10 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_pgrp8 = getelementptr inbounds %struct.proc, %struct.proc* %10, i32 0, i32 55
  %11 = load %struct.pgrp*, %struct.pgrp** %p_pgrp8, align 8
  %pg_session9 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %11, i32 0, i32 2
  %12 = load %struct.session*, %struct.session** %pg_session9, align 8
  %cmp10 = icmp eq %struct.session* %9, %12
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true
  store i32 0, i32* %retval
  br label %return

if.end13:                                         ; preds = %land.lhs.true, %if.end4
  %13 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc14 = getelementptr inbounds %struct.thread, %struct.thread* %13, i32 0, i32 1
  %14 = load %struct.proc*, %struct.proc** %td_proc14, align 8
  %p_leader = getelementptr inbounds %struct.proc, %struct.proc* %14, i32 0, i32 68
  %15 = load %struct.proc*, %struct.proc** %p_leader, align 8
  %cmp15 = icmp ne %struct.proc* %15, null
  br i1 %cmp15, label %land.lhs.true17, label %if.end30

land.lhs.true17:                                  ; preds = %if.end13
  %16 = load i32, i32* %signum.addr, align 4
  %cmp18 = icmp sge i32 %16, 32
  br i1 %cmp18, label %land.lhs.true20, label %if.end30

land.lhs.true20:                                  ; preds = %land.lhs.true17
  %17 = load i32, i32* %signum.addr, align 4
  %cmp21 = icmp slt i32 %17, 36
  br i1 %cmp21, label %land.lhs.true23, label %if.end30

land.lhs.true23:                                  ; preds = %land.lhs.true20
  %18 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc24 = getelementptr inbounds %struct.thread, %struct.thread* %18, i32 0, i32 1
  %19 = load %struct.proc*, %struct.proc** %td_proc24, align 8
  %p_leader25 = getelementptr inbounds %struct.proc, %struct.proc* %19, i32 0, i32 68
  %20 = load %struct.proc*, %struct.proc** %p_leader25, align 8
  %21 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_leader26 = getelementptr inbounds %struct.proc, %struct.proc* %21, i32 0, i32 68
  %22 = load %struct.proc*, %struct.proc** %p_leader26, align 8
  %cmp27 = icmp eq %struct.proc* %20, %22
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %land.lhs.true23
  store i32 0, i32* %retval
  br label %return

if.end30:                                         ; preds = %land.lhs.true23, %land.lhs.true20, %land.lhs.true17, %if.end13
  %23 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %23, i32 0, i32 37
  %24 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %25 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %26 = load i32, i32* %signum.addr, align 4
  %call31 = call i32 @cr_cansignal(%struct.ucred* %24, %struct.proc* %25, i32 %26) #5
  store i32 %call31, i32* %retval
  br label %return

return:                                           ; preds = %if.end30, %if.then29, %if.then12, %if.then3
  %27 = load i32, i32* %retval
  ret i32 %27
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @p_cansched(%struct.thread* %td, %struct.proc* %p) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %p.addr = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call %struct.thread* @__curthread() #6
  %cmp = icmp eq %struct.thread* %0, %call
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__func__.p_cansched, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1583) #5
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 1
  %3 = load %struct.proc*, %struct.proc** %td_proc, align 8
  %4 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %cmp1 = icmp eq %struct.proc* %3, %4
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  store i32 0, i32* %retval
  br label %return

if.end4:                                          ; preds = %do.end
  %5 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %5, i32 0, i32 37
  %6 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %7 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %7, i32 0, i32 3
  %8 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  %call5 = call i32 @prison_check(%struct.ucred* %6, %struct.ucred* %8) #5
  store i32 %call5, i32* %error, align 4
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  %9 = load i32, i32* %error, align 4
  store i32 %9, i32* %retval
  br label %return

if.end8:                                          ; preds = %if.end4
  %10 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred9 = getelementptr inbounds %struct.thread, %struct.thread* %10, i32 0, i32 37
  %11 = load %struct.ucred*, %struct.ucred** %td_ucred9, align 8
  %12 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %call10 = call i32 @mac_proc_check_sched(%struct.ucred* %11, %struct.proc* %12) #5
  store i32 %call10, i32* %error, align 4
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end8
  %13 = load i32, i32* %error, align 4
  store i32 %13, i32* %retval
  br label %return

if.end13:                                         ; preds = %if.end8
  %14 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred14 = getelementptr inbounds %struct.thread, %struct.thread* %14, i32 0, i32 37
  %15 = load %struct.ucred*, %struct.ucred** %td_ucred14, align 8
  %16 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred15 = getelementptr inbounds %struct.proc, %struct.proc* %16, i32 0, i32 3
  %17 = load %struct.ucred*, %struct.ucred** %p_ucred15, align 8
  %call16 = call i32 @cr_seeotheruids(%struct.ucred* %15, %struct.ucred* %17) #5
  store i32 %call16, i32* %error, align 4
  %tobool17 = icmp ne i32 %call16, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  %18 = load i32, i32* %error, align 4
  store i32 %18, i32* %retval
  br label %return

if.end19:                                         ; preds = %if.end13
  %19 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred20 = getelementptr inbounds %struct.thread, %struct.thread* %19, i32 0, i32 37
  %20 = load %struct.ucred*, %struct.ucred** %td_ucred20, align 8
  %21 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred21 = getelementptr inbounds %struct.proc, %struct.proc* %21, i32 0, i32 3
  %22 = load %struct.ucred*, %struct.ucred** %p_ucred21, align 8
  %call22 = call i32 @cr_seeothergids(%struct.ucred* %20, %struct.ucred* %22) #5
  store i32 %call22, i32* %error, align 4
  %tobool23 = icmp ne i32 %call22, 0
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  %23 = load i32, i32* %error, align 4
  store i32 %23, i32* %retval
  br label %return

if.end25:                                         ; preds = %if.end19
  %24 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred26 = getelementptr inbounds %struct.thread, %struct.thread* %24, i32 0, i32 37
  %25 = load %struct.ucred*, %struct.ucred** %td_ucred26, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %25, i32 0, i32 2
  %26 = load i32, i32* %cr_ruid, align 4
  %27 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred27 = getelementptr inbounds %struct.proc, %struct.proc* %27, i32 0, i32 3
  %28 = load %struct.ucred*, %struct.ucred** %p_ucred27, align 8
  %cr_ruid28 = getelementptr inbounds %struct.ucred, %struct.ucred* %28, i32 0, i32 2
  %29 = load i32, i32* %cr_ruid28, align 4
  %cmp29 = icmp ne i32 %26, %29
  br i1 %cmp29, label %land.lhs.true, label %if.end41

land.lhs.true:                                    ; preds = %if.end25
  %30 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred31 = getelementptr inbounds %struct.thread, %struct.thread* %30, i32 0, i32 37
  %31 = load %struct.ucred*, %struct.ucred** %td_ucred31, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %31, i32 0, i32 1
  %32 = load i32, i32* %cr_uid, align 4
  %33 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred32 = getelementptr inbounds %struct.proc, %struct.proc* %33, i32 0, i32 3
  %34 = load %struct.ucred*, %struct.ucred** %p_ucred32, align 8
  %cr_ruid33 = getelementptr inbounds %struct.ucred, %struct.ucred* %34, i32 0, i32 2
  %35 = load i32, i32* %cr_ruid33, align 4
  %cmp34 = icmp ne i32 %32, %35
  br i1 %cmp34, label %if.then36, label %if.end41

if.then36:                                        ; preds = %land.lhs.true
  %36 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call37 = call i32 @priv_check(%struct.thread* %36, i32 200) #5
  store i32 %call37, i32* %error, align 4
  %37 = load i32, i32* %error, align 4
  %tobool38 = icmp ne i32 %37, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then36
  %38 = load i32, i32* %error, align 4
  store i32 %38, i32* %retval
  br label %return

if.end40:                                         ; preds = %if.then36
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %land.lhs.true, %if.end25
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end41, %if.then39, %if.then24, %if.then18, %if.then12, %if.then7, %if.then3
  %39 = load i32, i32* %retval
  ret i32 %39
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_proc_check_sched(%struct.ucred*, %struct.proc*) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @priv_check(%struct.thread*, i32) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @p_candebug(%struct.thread* %td, %struct.proc* %p) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %p.addr = alloca %struct.proc*, align 8
  %credentialchanged = alloca i32, align 4
  %error = alloca i32, align 4
  %grpsubset = alloca i32, align 4
  %i = alloca i32, align 4
  %uidsubset = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call %struct.thread* @__curthread() #6
  %cmp = icmp eq %struct.thread* %0, %call
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__func__.p_candebug, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1635) #5
  %2 = load i32, i32* @unprivileged_proc_debug, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.end7, label %if.then2

if.then2:                                         ; preds = %do.end
  %3 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call3 = call i32 @priv_check(%struct.thread* %3, i32 82) #5
  store i32 %call3, i32* %error, align 4
  %4 = load i32, i32* %error, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.then2
  %5 = load i32, i32* %error, align 4
  store i32 %5, i32* %retval
  br label %return

if.end6:                                          ; preds = %if.then2
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %do.end
  %6 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %6, i32 0, i32 1
  %7 = load %struct.proc*, %struct.proc** %td_proc, align 8
  %8 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %cmp8 = icmp eq %struct.proc* %7, %8
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  store i32 0, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.end7
  %9 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %9, i32 0, i32 37
  %10 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %11 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %11, i32 0, i32 3
  %12 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  %call12 = call i32 @prison_check(%struct.ucred* %10, %struct.ucred* %12) #5
  store i32 %call12, i32* %error, align 4
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  %13 = load i32, i32* %error, align 4
  store i32 %13, i32* %retval
  br label %return

if.end15:                                         ; preds = %if.end11
  %14 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred16 = getelementptr inbounds %struct.thread, %struct.thread* %14, i32 0, i32 37
  %15 = load %struct.ucred*, %struct.ucred** %td_ucred16, align 8
  %16 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %call17 = call i32 @mac_proc_check_debug(%struct.ucred* %15, %struct.proc* %16) #5
  store i32 %call17, i32* %error, align 4
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end15
  %17 = load i32, i32* %error, align 4
  store i32 %17, i32* %retval
  br label %return

if.end20:                                         ; preds = %if.end15
  %18 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred21 = getelementptr inbounds %struct.thread, %struct.thread* %18, i32 0, i32 37
  %19 = load %struct.ucred*, %struct.ucred** %td_ucred21, align 8
  %20 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred22 = getelementptr inbounds %struct.proc, %struct.proc* %20, i32 0, i32 3
  %21 = load %struct.ucred*, %struct.ucred** %p_ucred22, align 8
  %call23 = call i32 @cr_seeotheruids(%struct.ucred* %19, %struct.ucred* %21) #5
  store i32 %call23, i32* %error, align 4
  %tobool24 = icmp ne i32 %call23, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end20
  %22 = load i32, i32* %error, align 4
  store i32 %22, i32* %retval
  br label %return

if.end26:                                         ; preds = %if.end20
  %23 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred27 = getelementptr inbounds %struct.thread, %struct.thread* %23, i32 0, i32 37
  %24 = load %struct.ucred*, %struct.ucred** %td_ucred27, align 8
  %25 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred28 = getelementptr inbounds %struct.proc, %struct.proc* %25, i32 0, i32 3
  %26 = load %struct.ucred*, %struct.ucred** %p_ucred28, align 8
  %call29 = call i32 @cr_seeothergids(%struct.ucred* %24, %struct.ucred* %26) #5
  store i32 %call29, i32* %error, align 4
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end26
  %27 = load i32, i32* %error, align 4
  store i32 %27, i32* %retval
  br label %return

if.end32:                                         ; preds = %if.end26
  store i32 1, i32* %grpsubset, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end32
  %28 = load i32, i32* %i, align 4
  %29 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred33 = getelementptr inbounds %struct.proc, %struct.proc* %29, i32 0, i32 3
  %30 = load %struct.ucred*, %struct.ucred** %p_ucred33, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %30, i32 0, i32 4
  %31 = load i32, i32* %cr_ngroups, align 4
  %cmp34 = icmp slt i32 %28, %31
  br i1 %cmp34, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %32 = load i32, i32* %i, align 4
  %idxprom = sext i32 %32 to i64
  %33 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred36 = getelementptr inbounds %struct.proc, %struct.proc* %33, i32 0, i32 3
  %34 = load %struct.ucred*, %struct.ucred** %p_ucred36, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %34, i32 0, i32 15
  %35 = load i32*, i32** %cr_groups, align 8
  %arrayidx = getelementptr inbounds i32, i32* %35, i64 %idxprom
  %36 = load i32, i32* %arrayidx, align 4
  %37 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred37 = getelementptr inbounds %struct.thread, %struct.thread* %37, i32 0, i32 37
  %38 = load %struct.ucred*, %struct.ucred** %td_ucred37, align 8
  %call38 = call i32 @groupmember(i32 %36, %struct.ucred* %38) #5
  %tobool39 = icmp ne i32 %call38, 0
  br i1 %tobool39, label %if.end41, label %if.then40

if.then40:                                        ; preds = %for.body
  store i32 0, i32* %grpsubset, align 4
  br label %for.end

if.end41:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end41
  %39 = load i32, i32* %i, align 4
  %inc = add nsw i32 %39, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then40, %for.cond
  %40 = load i32, i32* %grpsubset, align 4
  %tobool42 = icmp ne i32 %40, 0
  br i1 %tobool42, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.end
  %41 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred43 = getelementptr inbounds %struct.proc, %struct.proc* %41, i32 0, i32 3
  %42 = load %struct.ucred*, %struct.ucred** %p_ucred43, align 8
  %cr_rgid = getelementptr inbounds %struct.ucred, %struct.ucred* %42, i32 0, i32 5
  %43 = load i32, i32* %cr_rgid, align 4
  %44 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred44 = getelementptr inbounds %struct.thread, %struct.thread* %44, i32 0, i32 37
  %45 = load %struct.ucred*, %struct.ucred** %td_ucred44, align 8
  %call45 = call i32 @groupmember(i32 %43, %struct.ucred* %45) #5
  %tobool46 = icmp ne i32 %call45, 0
  br i1 %tobool46, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %46 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred47 = getelementptr inbounds %struct.proc, %struct.proc* %46, i32 0, i32 3
  %47 = load %struct.ucred*, %struct.ucred** %p_ucred47, align 8
  %cr_svgid = getelementptr inbounds %struct.ucred, %struct.ucred* %47, i32 0, i32 6
  %48 = load i32, i32* %cr_svgid, align 4
  %49 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred48 = getelementptr inbounds %struct.thread, %struct.thread* %49, i32 0, i32 37
  %50 = load %struct.ucred*, %struct.ucred** %td_ucred48, align 8
  %call49 = call i32 @groupmember(i32 %48, %struct.ucred* %50) #5
  %tobool50 = icmp ne i32 %call49, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.end
  %51 = phi i1 [ false, %land.lhs.true ], [ false, %for.end ], [ %tobool50, %land.rhs ]
  %land.ext = zext i1 %51 to i32
  store i32 %land.ext, i32* %grpsubset, align 4
  %52 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred51 = getelementptr inbounds %struct.thread, %struct.thread* %52, i32 0, i32 37
  %53 = load %struct.ucred*, %struct.ucred** %td_ucred51, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %53, i32 0, i32 1
  %54 = load i32, i32* %cr_uid, align 4
  %55 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred52 = getelementptr inbounds %struct.proc, %struct.proc* %55, i32 0, i32 3
  %56 = load %struct.ucred*, %struct.ucred** %p_ucred52, align 8
  %cr_uid53 = getelementptr inbounds %struct.ucred, %struct.ucred* %56, i32 0, i32 1
  %57 = load i32, i32* %cr_uid53, align 4
  %cmp54 = icmp eq i32 %54, %57
  br i1 %cmp54, label %land.lhs.true56, label %land.end68

land.lhs.true56:                                  ; preds = %land.end
  %58 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred57 = getelementptr inbounds %struct.thread, %struct.thread* %58, i32 0, i32 37
  %59 = load %struct.ucred*, %struct.ucred** %td_ucred57, align 8
  %cr_uid58 = getelementptr inbounds %struct.ucred, %struct.ucred* %59, i32 0, i32 1
  %60 = load i32, i32* %cr_uid58, align 4
  %61 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred59 = getelementptr inbounds %struct.proc, %struct.proc* %61, i32 0, i32 3
  %62 = load %struct.ucred*, %struct.ucred** %p_ucred59, align 8
  %cr_svuid = getelementptr inbounds %struct.ucred, %struct.ucred* %62, i32 0, i32 3
  %63 = load i32, i32* %cr_svuid, align 4
  %cmp60 = icmp eq i32 %60, %63
  br i1 %cmp60, label %land.rhs62, label %land.end68

land.rhs62:                                       ; preds = %land.lhs.true56
  %64 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred63 = getelementptr inbounds %struct.thread, %struct.thread* %64, i32 0, i32 37
  %65 = load %struct.ucred*, %struct.ucred** %td_ucred63, align 8
  %cr_uid64 = getelementptr inbounds %struct.ucred, %struct.ucred* %65, i32 0, i32 1
  %66 = load i32, i32* %cr_uid64, align 4
  %67 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred65 = getelementptr inbounds %struct.proc, %struct.proc* %67, i32 0, i32 3
  %68 = load %struct.ucred*, %struct.ucred** %p_ucred65, align 8
  %cr_ruid = getelementptr inbounds %struct.ucred, %struct.ucred* %68, i32 0, i32 2
  %69 = load i32, i32* %cr_ruid, align 4
  %cmp66 = icmp eq i32 %66, %69
  br label %land.end68

land.end68:                                       ; preds = %land.rhs62, %land.lhs.true56, %land.end
  %70 = phi i1 [ false, %land.lhs.true56 ], [ false, %land.end ], [ %cmp66, %land.rhs62 ]
  %land.ext69 = zext i1 %70 to i32
  store i32 %land.ext69, i32* %uidsubset, align 4
  %71 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_flag = getelementptr inbounds %struct.proc, %struct.proc* %71, i32 0, i32 10
  %72 = load i32, i32* %p_flag, align 4
  %and = and i32 %72, 256
  store i32 %and, i32* %credentialchanged, align 4
  %73 = load i32, i32* %grpsubset, align 4
  %tobool70 = icmp ne i32 %73, 0
  br i1 %tobool70, label %lor.lhs.false, label %if.then72

lor.lhs.false:                                    ; preds = %land.end68
  %74 = load i32, i32* %uidsubset, align 4
  %tobool71 = icmp ne i32 %74, 0
  br i1 %tobool71, label %if.end77, label %if.then72

if.then72:                                        ; preds = %lor.lhs.false, %land.end68
  %75 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call73 = call i32 @priv_check(%struct.thread* %75, i32 80) #5
  store i32 %call73, i32* %error, align 4
  %76 = load i32, i32* %error, align 4
  %tobool74 = icmp ne i32 %76, 0
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.then72
  %77 = load i32, i32* %error, align 4
  store i32 %77, i32* %retval
  br label %return

if.end76:                                         ; preds = %if.then72
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %lor.lhs.false
  %78 = load i32, i32* %credentialchanged, align 4
  %tobool78 = icmp ne i32 %78, 0
  br i1 %tobool78, label %if.then79, label %if.end84

if.then79:                                        ; preds = %if.end77
  %79 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call80 = call i32 @priv_check(%struct.thread* %79, i32 81) #5
  store i32 %call80, i32* %error, align 4
  %80 = load i32, i32* %error, align 4
  %tobool81 = icmp ne i32 %80, 0
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %if.then79
  %81 = load i32, i32* %error, align 4
  store i32 %81, i32* %retval
  br label %return

if.end83:                                         ; preds = %if.then79
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.end77
  %82 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %83 = load %struct.proc*, %struct.proc** @initproc, align 8
  %cmp85 = icmp eq %struct.proc* %82, %83
  br i1 %cmp85, label %if.then87, label %if.end93

if.then87:                                        ; preds = %if.end84
  %84 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred88 = getelementptr inbounds %struct.thread, %struct.thread* %84, i32 0, i32 37
  %85 = load %struct.ucred*, %struct.ucred** %td_ucred88, align 8
  %call89 = call i32 @securelevel_gt(%struct.ucred* %85, i32 0) #5
  store i32 %call89, i32* %error, align 4
  %86 = load i32, i32* %error, align 4
  %tobool90 = icmp ne i32 %86, 0
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.then87
  %87 = load i32, i32* %error, align 4
  store i32 %87, i32* %retval
  br label %return

if.end92:                                         ; preds = %if.then87
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %if.end84
  %88 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_flag94 = getelementptr inbounds %struct.proc, %struct.proc* %88, i32 0, i32 10
  %89 = load i32, i32* %p_flag94, align 4
  %and95 = and i32 %89, 67108864
  %cmp96 = icmp ne i32 %and95, 0
  br i1 %cmp96, label %if.then98, label %if.end99

if.then98:                                        ; preds = %if.end93
  store i32 16, i32* %retval
  br label %return

if.end99:                                         ; preds = %if.end93
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end99, %if.then98, %if.then91, %if.then82, %if.then75, %if.then31, %if.then25, %if.then19, %if.then14, %if.then10, %if.then5
  %90 = load i32, i32* %retval
  ret i32 %90
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_proc_check_debug(%struct.ucred*, %struct.proc*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cr_canseesocket(%struct.ucred* %cred, %struct.socket* %so) #0 {
entry:
  %retval = alloca i32, align 4
  %cred.addr = alloca %struct.ucred*, align 8
  %so.addr = alloca %struct.socket*, align 8
  %error = alloca i32, align 4
  store %struct.ucred* %cred, %struct.ucred** %cred.addr, align 8
  store %struct.socket* %so, %struct.socket** %so.addr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %1 = load %struct.socket*, %struct.socket** %so.addr, align 8
  %so_cred = getelementptr inbounds %struct.socket, %struct.socket* %1, i32 0, i32 23
  %2 = load %struct.ucred*, %struct.ucred** %so_cred, align 8
  %call = call i32 @prison_check(%struct.ucred* %0, %struct.ucred* %2) #5
  store i32 %call, i32* %error, align 4
  %3 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %4 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %5 = load %struct.socket*, %struct.socket** %so.addr, align 8
  %call1 = call i32 @mac_socket_check_visible(%struct.ucred* %4, %struct.socket* %5) #5
  store i32 %call1, i32* %error, align 4
  %6 = load i32, i32* %error, align 4
  %tobool2 = icmp ne i32 %6, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %error, align 4
  store i32 %7, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %8 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %9 = load %struct.socket*, %struct.socket** %so.addr, align 8
  %so_cred5 = getelementptr inbounds %struct.socket, %struct.socket* %9, i32 0, i32 23
  %10 = load %struct.ucred*, %struct.ucred** %so_cred5, align 8
  %call6 = call i32 @cr_seeotheruids(%struct.ucred* %8, %struct.ucred* %10) #5
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  store i32 2, i32* %retval
  br label %return

if.end9:                                          ; preds = %if.end4
  %11 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %12 = load %struct.socket*, %struct.socket** %so.addr, align 8
  %so_cred10 = getelementptr inbounds %struct.socket, %struct.socket* %12, i32 0, i32 23
  %13 = load %struct.ucred*, %struct.ucred** %so_cred10, align 8
  %call11 = call i32 @cr_seeothergids(%struct.ucred* %11, %struct.ucred* %13) #5
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end9
  store i32 2, i32* %retval
  br label %return

if.end14:                                         ; preds = %if.end9
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end14, %if.then13, %if.then8, %if.then3, %if.then
  %14 = load i32, i32* %retval
  ret i32 %14
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_socket_check_visible(%struct.ucred*, %struct.socket*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @cr_canseeinpcb(%struct.ucred* %cred, %struct.inpcb* %inp) #0 {
entry:
  %retval = alloca i32, align 4
  %cred.addr = alloca %struct.ucred*, align 8
  %inp.addr = alloca %struct.inpcb*, align 8
  %error = alloca i32, align 4
  store %struct.ucred* %cred, %struct.ucred** %cred.addr, align 8
  store %struct.inpcb* %inp, %struct.inpcb** %inp.addr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %1 = load %struct.inpcb*, %struct.inpcb** %inp.addr, align 8
  %inp_cred = getelementptr inbounds %struct.inpcb, %struct.inpcb* %1, i32 0, i32 8
  %2 = load %struct.ucred*, %struct.ucred** %inp_cred, align 8
  %call = call i32 @prison_check(%struct.ucred* %0, %struct.ucred* %2) #5
  store i32 %call, i32* %error, align 4
  %3 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %4 = load %struct.inpcb*, %struct.inpcb** %inp.addr, align 8
  %inp_lock = getelementptr inbounds %struct.inpcb, %struct.inpcb* %4, i32 0, i32 30
  %rw_lock = getelementptr inbounds %struct.rwlock, %struct.rwlock* %inp_lock, i32 0, i32 1
  call void @__rw_assert(i64* %rw_lock, i32 1, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1758) #5
  %5 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %6 = load %struct.inpcb*, %struct.inpcb** %inp.addr, align 8
  %call1 = call i32 @mac_inpcb_check_visible(%struct.ucred* %5, %struct.inpcb* %6) #5
  store i32 %call1, i32* %error, align 4
  %7 = load i32, i32* %error, align 4
  %tobool2 = icmp ne i32 %7, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %8 = load i32, i32* %error, align 4
  store i32 %8, i32* %retval
  br label %return

if.end4:                                          ; preds = %if.end
  %9 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %10 = load %struct.inpcb*, %struct.inpcb** %inp.addr, align 8
  %inp_cred5 = getelementptr inbounds %struct.inpcb, %struct.inpcb* %10, i32 0, i32 8
  %11 = load %struct.ucred*, %struct.ucred** %inp_cred5, align 8
  %call6 = call i32 @cr_seeotheruids(%struct.ucred* %9, %struct.ucred* %11) #5
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  store i32 2, i32* %retval
  br label %return

if.end9:                                          ; preds = %if.end4
  %12 = load %struct.ucred*, %struct.ucred** %cred.addr, align 8
  %13 = load %struct.inpcb*, %struct.inpcb** %inp.addr, align 8
  %inp_cred10 = getelementptr inbounds %struct.inpcb, %struct.inpcb* %13, i32 0, i32 8
  %14 = load %struct.ucred*, %struct.ucred** %inp_cred10, align 8
  %call11 = call i32 @cr_seeothergids(%struct.ucred* %12, %struct.ucred* %14) #5
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end9
  store i32 2, i32* %retval
  br label %return

if.end14:                                         ; preds = %if.end9
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end14, %if.then13, %if.then8, %if.then3, %if.then
  %15 = load i32, i32* %retval
  ret i32 %15
}

; Function Attrs: noimplicitfloat noredzone
declare void @__rw_assert(i64*, i32, i8*, i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_inpcb_check_visible(%struct.ucred*, %struct.inpcb*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @p_canwait(%struct.thread* %td, %struct.proc* %p) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %p.addr = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.proc* %p, %struct.proc** %p.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call %struct.thread* @__curthread() #6
  %cmp = icmp eq %struct.thread* %0, %call
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @__func__.p_canwait, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %1 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %1, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_assert(i64* %mtx_lock, i32 4, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1787) #5
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 37
  %3 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  %4 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 3
  %5 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  %call1 = call i32 @prison_check(%struct.ucred* %3, %struct.ucred* %5) #5
  store i32 %call1, i32* %error, align 4
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  %6 = load i32, i32* %error, align 4
  store i32 %6, i32* %retval
  br label %return

if.end4:                                          ; preds = %do.end
  %7 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred5 = getelementptr inbounds %struct.thread, %struct.thread* %7, i32 0, i32 37
  %8 = load %struct.ucred*, %struct.ucred** %td_ucred5, align 8
  %9 = load %struct.proc*, %struct.proc** %p.addr, align 8
  %call6 = call i32 @mac_proc_check_wait(%struct.ucred* %8, %struct.proc* %9) #5
  store i32 %call6, i32* %error, align 4
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %10 = load i32, i32* %error, align 4
  store i32 %10, i32* %retval
  br label %return

if.end9:                                          ; preds = %if.end4
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then3
  %11 = load i32, i32* %retval
  ret i32 %11
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_proc_check_wait(%struct.ucred*, %struct.proc*) #1

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @refcount_init(i32* %count, i32 %value) #4 {
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
declare void @audit_cred_init(%struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @mac_cred_init(%struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.ucred* @crhold(%struct.ucred* %cr) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ref = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 0
  call void @refcount_acquire(i32* %cr_ref) #5
  %1 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  ret %struct.ucred* %1
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @refcount_acquire(i32* %count) #4 {
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
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str8, i32 0, i32 0), i32* %2) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32*, i32** %count.addr, align 8
  call void @atomic_add_barr_int(i32* %3, i32 1) #5
  ret void
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i32 @refcount_release(i32* %count) #4 {
entry:
  %count.addr = alloca i32*, align 8
  %old = alloca i32, align 4
  store i32* %count, i32** %count.addr, align 8
  %0 = load i32*, i32** %count.addr, align 8
  %call = call i32 @atomic_fetchadd_int(i32* %0, i32 -1) #5
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
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str7, i32 0, i32 0), i32* %2) #5
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
declare void @prison_free(%struct.prison*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @loginclass_free(%struct.loginclass*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @audit_cred_destroy(%struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @mac_cred_destroy(%struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @crshared(%struct.ucred* %cr) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ref = getelementptr inbounds %struct.ucred, %struct.ucred* %0, i32 0, i32 0
  %1 = load i32, i32* %cr_ref, align 4
  %cmp = icmp ugt i32 %1, 1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @crcopy(%struct.ucred* %dest, %struct.ucred* %src) #0 {
entry:
  %dest.addr = alloca %struct.ucred*, align 8
  %src.addr = alloca %struct.ucred*, align 8
  store %struct.ucred* %dest, %struct.ucred** %dest.addr, align 8
  store %struct.ucred* %src, %struct.ucred** %src.addr, align 8
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %call = call i32 @crshared(%struct.ucred* %0) #5
  %cmp = icmp eq i32 %call, 0
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  %conv = sext i32 %lnot.ext to i64
  %expval = call i64 @llvm.expect.i64(i64 %conv, i64 0)
  %tobool = icmp ne i64 %expval, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void (i8*, ...) @kassert_panic(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str5, i32 0, i32 0)) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %1 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %1, i32 0, i32 1
  %2 = bitcast i32* %cr_uid to i8*
  %3 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %cr_uid1 = getelementptr inbounds %struct.ucred, %struct.ucred* %3, i32 0, i32 1
  %4 = bitcast i32* %cr_uid1 to i8*
  %5 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %cr_label = getelementptr inbounds %struct.ucred, %struct.ucred* %5, i32 0, i32 13
  %6 = bitcast %struct.label** %cr_label to i8*
  %7 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %cr_uid2 = getelementptr inbounds %struct.ucred, %struct.ucred* %7, i32 0, i32 1
  %8 = bitcast i32* %cr_uid2 to i8*
  %sub.ptr.lhs.cast = ptrtoint i8* %6 to i64
  %sub.ptr.rhs.cast = ptrtoint i8* %8 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %conv3 = trunc i64 %sub.ptr.sub to i32
  %conv4 = zext i32 %conv3 to i64
  call void @bcopy(i8* %2, i8* %4, i64 %conv4) #5
  %9 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %10 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %10, i32 0, i32 4
  %11 = load i32, i32* %cr_ngroups, align 4
  %12 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %12, i32 0, i32 15
  %13 = load i32*, i32** %cr_groups, align 8
  call void @crsetgroups(%struct.ucred* %9, i32 %11, i32* %13) #5
  %14 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %cr_uidinfo = getelementptr inbounds %struct.ucred, %struct.ucred* %14, i32 0, i32 7
  %15 = load %struct.uidinfo*, %struct.uidinfo** %cr_uidinfo, align 8
  call void @uihold(%struct.uidinfo* %15) #5
  %16 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %cr_ruidinfo = getelementptr inbounds %struct.ucred, %struct.ucred* %16, i32 0, i32 8
  %17 = load %struct.uidinfo*, %struct.uidinfo** %cr_ruidinfo, align 8
  call void @uihold(%struct.uidinfo* %17) #5
  %18 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %cr_prison = getelementptr inbounds %struct.ucred, %struct.ucred* %18, i32 0, i32 9
  %19 = load %struct.prison*, %struct.prison** %cr_prison, align 8
  call void @prison_hold(%struct.prison* %19) #5
  %20 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  %cr_loginclass = getelementptr inbounds %struct.ucred, %struct.ucred* %20, i32 0, i32 10
  %21 = load %struct.loginclass*, %struct.loginclass** %cr_loginclass, align 8
  call void @loginclass_hold(%struct.loginclass* %21) #5
  %22 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %23 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  call void @audit_cred_copy(%struct.ucred* %22, %struct.ucred* %23) #5
  %24 = load %struct.ucred*, %struct.ucred** %src.addr, align 8
  %25 = load %struct.ucred*, %struct.ucred** %dest.addr, align 8
  call void @mac_cred_copy(%struct.ucred* %24, %struct.ucred* %25) #5
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @crsetgroups(%struct.ucred* %cr, i32 %ngrp, i32* %groups) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %ngrp.addr = alloca i32, align 4
  %groups.addr = alloca i32*, align 8
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  store i32 %ngrp, i32* %ngrp.addr, align 4
  store i32* %groups, i32** %groups.addr, align 8
  %0 = load i32, i32* %ngrp.addr, align 4
  %1 = load i32, i32* @ngroups_max, align 4
  %add = add nsw i32 %1, 1
  %cmp = icmp sgt i32 %0, %add
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @ngroups_max, align 4
  %add1 = add nsw i32 %2, 1
  store i32 %add1, i32* %ngrp.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %4 = load i32, i32* %ngrp.addr, align 4
  call void @crextend(%struct.ucred* %3, i32 %4) #5
  %5 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %6 = load i32, i32* %ngrp.addr, align 4
  %7 = load i32*, i32** %groups.addr, align 8
  call void @crsetgroups_locked(%struct.ucred* %5, i32 %6, i32* %7) #5
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @uihold(%struct.uidinfo*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @prison_hold(%struct.prison*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @loginclass_hold(%struct.loginclass*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @audit_cred_copy(%struct.ucred*, %struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @mac_cred_copy(%struct.ucred*, %struct.ucred*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.ucred* @crdup(%struct.ucred* %cr) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %newcr = alloca %struct.ucred*, align 8
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  %call = call %struct.ucred* @crget() #5
  store %struct.ucred* %call, %struct.ucred** %newcr, align 8
  %0 = load %struct.ucred*, %struct.ucred** %newcr, align 8
  %1 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  call void @crcopy(%struct.ucred* %0, %struct.ucred* %1) #5
  %2 = load %struct.ucred*, %struct.ucred** %newcr, align 8
  ret %struct.ucred* %2
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @cru2x(%struct.ucred* %cr, %struct.xucred* %xcr) #0 {
entry:
  %cr.addr = alloca %struct.ucred*, align 8
  %xcr.addr = alloca %struct.xucred*, align 8
  %ngroups = alloca i32, align 4
  store %struct.ucred* %cr, %struct.ucred** %cr.addr, align 8
  store %struct.xucred* %xcr, %struct.xucred** %xcr.addr, align 8
  %0 = load %struct.xucred*, %struct.xucred** %xcr.addr, align 8
  %1 = bitcast %struct.xucred* %0 to i8*
  call void @bzero(i8* %1, i64 88) #5
  %2 = load %struct.xucred*, %struct.xucred** %xcr.addr, align 8
  %cr_version = getelementptr inbounds %struct.xucred, %struct.xucred* %2, i32 0, i32 0
  store i32 0, i32* %cr_version, align 4
  %3 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_uid = getelementptr inbounds %struct.ucred, %struct.ucred* %3, i32 0, i32 1
  %4 = load i32, i32* %cr_uid, align 4
  %5 = load %struct.xucred*, %struct.xucred** %xcr.addr, align 8
  %cr_uid1 = getelementptr inbounds %struct.xucred, %struct.xucred* %5, i32 0, i32 1
  store i32 %4, i32* %cr_uid1, align 4
  %6 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ngroups = getelementptr inbounds %struct.ucred, %struct.ucred* %6, i32 0, i32 4
  %7 = load i32, i32* %cr_ngroups, align 4
  %cmp = icmp slt i32 %7, 16
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %8 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_ngroups2 = getelementptr inbounds %struct.ucred, %struct.ucred* %8, i32 0, i32 4
  %9 = load i32, i32* %cr_ngroups2, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %9, %cond.true ], [ 16, %cond.false ]
  store i32 %cond, i32* %ngroups, align 4
  %10 = load i32, i32* %ngroups, align 4
  %conv = trunc i32 %10 to i16
  %11 = load %struct.xucred*, %struct.xucred** %xcr.addr, align 8
  %cr_ngroups3 = getelementptr inbounds %struct.xucred, %struct.xucred* %11, i32 0, i32 2
  store i16 %conv, i16* %cr_ngroups3, align 2
  %12 = load %struct.ucred*, %struct.ucred** %cr.addr, align 8
  %cr_groups = getelementptr inbounds %struct.ucred, %struct.ucred* %12, i32 0, i32 15
  %13 = load i32*, i32** %cr_groups, align 8
  %14 = bitcast i32* %13 to i8*
  %15 = load %struct.xucred*, %struct.xucred** %xcr.addr, align 8
  %cr_groups4 = getelementptr inbounds %struct.xucred, %struct.xucred* %15, i32 0, i32 3
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %cr_groups4, i32 0, i32 0
  %16 = bitcast i32* %arraydecay to i8*
  %17 = load i32, i32* %ngroups, align 4
  %conv5 = sext i32 %17 to i64
  %mul = mul i64 %conv5, 4
  call void @bcopy(i8* %14, i8* %16, i64 %mul) #5
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare void @bzero(i8*, i64) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @cred_update_thread(%struct.thread* %td) #0 {
entry:
  %td.addr = alloca %struct.thread*, align 8
  %p = alloca %struct.proc*, align 8
  %cred = alloca %struct.ucred*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred = getelementptr inbounds %struct.thread, %struct.thread* %2, i32 0, i32 37
  %3 = load %struct.ucred*, %struct.ucred** %td_ucred, align 8
  store %struct.ucred* %3, %struct.ucred** %cred, align 8
  %4 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %4, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1948) #5
  %5 = load %struct.proc*, %struct.proc** %p, align 8
  %p_ucred = getelementptr inbounds %struct.proc, %struct.proc* %5, i32 0, i32 3
  %6 = load %struct.ucred*, %struct.ucred** %p_ucred, align 8
  %call = call %struct.ucred* @crhold(%struct.ucred* %6) #5
  %7 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_ucred1 = getelementptr inbounds %struct.thread, %struct.thread* %7, i32 0, i32 37
  store %struct.ucred* %call, %struct.ucred** %td_ucred1, align 8
  %8 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx2 = getelementptr inbounds %struct.proc, %struct.proc* %8, i32 0, i32 18
  %mtx_lock3 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx2, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock3, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 1950) #5
  %9 = load %struct.ucred*, %struct.ucred** %cred, align 8
  %cmp = icmp ne %struct.ucred* %9, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %10 = load %struct.ucred*, %struct.ucred** %cred, align 8
  call void @crfree(%struct.ucred* %10) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_getlogin(%struct.thread* %td, %struct.getlogin_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.getlogin_args*, align 8
  %error = alloca i32, align 4
  %login = alloca [33 x i8], align 16
  %p = alloca %struct.proc*, align 8
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.getlogin_args* %uap, %struct.getlogin_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.getlogin_args*, %struct.getlogin_args** %uap.addr, align 8
  %namelen = getelementptr inbounds %struct.getlogin_args, %struct.getlogin_args* %2, i32 0, i32 4
  %3 = load i32, i32* %namelen, align 4
  %cmp = icmp ugt i32 %3, 33
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.getlogin_args*, %struct.getlogin_args** %uap.addr, align 8
  %namelen1 = getelementptr inbounds %struct.getlogin_args, %struct.getlogin_args* %4, i32 0, i32 4
  store i32 33, i32* %namelen1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %5, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2084) #5
  %6 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %6, i32 0, i32 55
  %7 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_session = getelementptr inbounds %struct.pgrp, %struct.pgrp* %7, i32 0, i32 2
  %8 = load %struct.session*, %struct.session** %pg_session, align 8
  %s_mtx = getelementptr inbounds %struct.session, %struct.session* %8, i32 0, i32 7
  %mtx_lock2 = getelementptr inbounds %struct.mtx, %struct.mtx* %s_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock2, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2085) #5
  %9 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp3 = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 55
  %10 = load %struct.pgrp*, %struct.pgrp** %p_pgrp3, align 8
  %pg_session4 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %10, i32 0, i32 2
  %11 = load %struct.session*, %struct.session** %pg_session4, align 8
  %s_login = getelementptr inbounds %struct.session, %struct.session* %11, i32 0, i32 6
  %arraydecay = getelementptr inbounds [40 x i8], [40 x i8]* %s_login, i32 0, i32 0
  %arraydecay5 = getelementptr inbounds [33 x i8], [33 x i8]* %login, i32 0, i32 0
  %12 = load %struct.getlogin_args*, %struct.getlogin_args** %uap.addr, align 8
  %namelen6 = getelementptr inbounds %struct.getlogin_args, %struct.getlogin_args* %12, i32 0, i32 4
  %13 = load i32, i32* %namelen6, align 4
  %conv = zext i32 %13 to i64
  call void @bcopy(i8* %arraydecay, i8* %arraydecay5, i64 %conv) #5
  %14 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp7 = getelementptr inbounds %struct.proc, %struct.proc* %14, i32 0, i32 55
  %15 = load %struct.pgrp*, %struct.pgrp** %p_pgrp7, align 8
  %pg_session8 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %15, i32 0, i32 2
  %16 = load %struct.session*, %struct.session** %pg_session8, align 8
  %s_mtx9 = getelementptr inbounds %struct.session, %struct.session* %16, i32 0, i32 7
  %mtx_lock10 = getelementptr inbounds %struct.mtx, %struct.mtx* %s_mtx9, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock10, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2087) #5
  %17 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx11 = getelementptr inbounds %struct.proc, %struct.proc* %17, i32 0, i32 18
  %mtx_lock12 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx11, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock12, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2088) #5
  %arraydecay13 = getelementptr inbounds [33 x i8], [33 x i8]* %login, i32 0, i32 0
  %call = call i64 @strlen(i8* %arraydecay13) #5
  %add = add i64 %call, 1
  %18 = load %struct.getlogin_args*, %struct.getlogin_args** %uap.addr, align 8
  %namelen14 = getelementptr inbounds %struct.getlogin_args, %struct.getlogin_args* %18, i32 0, i32 4
  %19 = load i32, i32* %namelen14, align 4
  %conv15 = zext i32 %19 to i64
  %cmp16 = icmp ugt i64 %add, %conv15
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end
  store i32 34, i32* %retval
  br label %return

if.end19:                                         ; preds = %if.end
  %arraydecay20 = getelementptr inbounds [33 x i8], [33 x i8]* %login, i32 0, i32 0
  %20 = load %struct.getlogin_args*, %struct.getlogin_args** %uap.addr, align 8
  %namebuf = getelementptr inbounds %struct.getlogin_args, %struct.getlogin_args* %20, i32 0, i32 1
  %21 = load i8*, i8** %namebuf, align 8
  %22 = load %struct.getlogin_args*, %struct.getlogin_args** %uap.addr, align 8
  %namelen21 = getelementptr inbounds %struct.getlogin_args, %struct.getlogin_args* %22, i32 0, i32 4
  %23 = load i32, i32* %namelen21, align 4
  %conv22 = zext i32 %23 to i64
  %call23 = call i32 @copyout(i8* %arraydecay20, i8* %21, i64 %conv22) #5
  store i32 %call23, i32* %error, align 4
  %24 = load i32, i32* %error, align 4
  store i32 %24, i32* %retval
  br label %return

return:                                           ; preds = %if.end19, %if.then18
  %25 = load i32, i32* %retval
  ret i32 %25
}

; Function Attrs: noimplicitfloat noredzone
declare i64 @strlen(i8*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @sys_setlogin(%struct.thread* %td, %struct.setlogin_args* %uap) #0 {
entry:
  %retval = alloca i32, align 4
  %td.addr = alloca %struct.thread*, align 8
  %uap.addr = alloca %struct.setlogin_args*, align 8
  %p = alloca %struct.proc*, align 8
  %error = alloca i32, align 4
  %logintmp = alloca [33 x i8], align 16
  store %struct.thread* %td, %struct.thread** %td.addr, align 8
  store %struct.setlogin_args* %uap, %struct.setlogin_args** %uap.addr, align 8
  %0 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %td_proc = getelementptr inbounds %struct.thread, %struct.thread* %0, i32 0, i32 1
  %1 = load %struct.proc*, %struct.proc** %td_proc, align 8
  store %struct.proc* %1, %struct.proc** %p, align 8
  %2 = load %struct.thread*, %struct.thread** %td.addr, align 8
  %call = call i32 @priv_check(%struct.thread* %2, i32 161) #5
  store i32 %call, i32* %error, align 4
  %3 = load i32, i32* %error, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %error, align 4
  store i32 %4, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %5 = load %struct.setlogin_args*, %struct.setlogin_args** %uap.addr, align 8
  %namebuf = getelementptr inbounds %struct.setlogin_args, %struct.setlogin_args* %5, i32 0, i32 1
  %6 = load i8*, i8** %namebuf, align 8
  %arraydecay = getelementptr inbounds [33 x i8], [33 x i8]* %logintmp, i32 0, i32 0
  %call1 = call i32 @copyinstr(i8* %6, i8* %arraydecay, i64 33, i64* null) #5
  store i32 %call1, i32* %error, align 4
  %7 = load i32, i32* %error, align 4
  %cmp = icmp eq i32 %7, 63
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  store i32 22, i32* %error, align 4
  br label %if.end18

if.else:                                          ; preds = %if.end
  %8 = load i32, i32* %error, align 4
  %tobool3 = icmp ne i32 %8, 0
  br i1 %tobool3, label %if.end17, label %if.then4

if.then4:                                         ; preds = %if.else
  %9 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx = getelementptr inbounds %struct.proc, %struct.proc* %9, i32 0, i32 18
  %mtx_lock = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2118) #5
  %10 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp = getelementptr inbounds %struct.proc, %struct.proc* %10, i32 0, i32 55
  %11 = load %struct.pgrp*, %struct.pgrp** %p_pgrp, align 8
  %pg_session = getelementptr inbounds %struct.pgrp, %struct.pgrp* %11, i32 0, i32 2
  %12 = load %struct.session*, %struct.session** %pg_session, align 8
  %s_mtx = getelementptr inbounds %struct.session, %struct.session* %12, i32 0, i32 7
  %mtx_lock5 = getelementptr inbounds %struct.mtx, %struct.mtx* %s_mtx, i32 0, i32 1
  call void @__mtx_lock_flags(i64* %mtx_lock5, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2119) #5
  %13 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp6 = getelementptr inbounds %struct.proc, %struct.proc* %13, i32 0, i32 55
  %14 = load %struct.pgrp*, %struct.pgrp** %p_pgrp6, align 8
  %pg_session7 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %14, i32 0, i32 2
  %15 = load %struct.session*, %struct.session** %pg_session7, align 8
  %s_login = getelementptr inbounds %struct.session, %struct.session* %15, i32 0, i32 6
  %arraydecay8 = getelementptr inbounds [40 x i8], [40 x i8]* %s_login, i32 0, i32 0
  %arraydecay9 = getelementptr inbounds [33 x i8], [33 x i8]* %logintmp, i32 0, i32 0
  %call10 = call i8* @memcpy(i8* %arraydecay8, i8* %arraydecay9, i64 33) #5
  %16 = load %struct.proc*, %struct.proc** %p, align 8
  %p_pgrp11 = getelementptr inbounds %struct.proc, %struct.proc* %16, i32 0, i32 55
  %17 = load %struct.pgrp*, %struct.pgrp** %p_pgrp11, align 8
  %pg_session12 = getelementptr inbounds %struct.pgrp, %struct.pgrp* %17, i32 0, i32 2
  %18 = load %struct.session*, %struct.session** %pg_session12, align 8
  %s_mtx13 = getelementptr inbounds %struct.session, %struct.session* %18, i32 0, i32 7
  %mtx_lock14 = getelementptr inbounds %struct.mtx, %struct.mtx* %s_mtx13, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock14, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2122) #5
  %19 = load %struct.proc*, %struct.proc** %p, align 8
  %p_mtx15 = getelementptr inbounds %struct.proc, %struct.proc* %19, i32 0, i32 18
  %mtx_lock16 = getelementptr inbounds %struct.mtx, %struct.mtx* %p_mtx15, i32 0, i32 1
  call void @__mtx_unlock_flags(i64* %mtx_lock16, i32 0, i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i32 0, i32 0), i32 2123) #5
  br label %if.end17

if.end17:                                         ; preds = %if.then4, %if.else
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then2
  %20 = load i32, i32* %error, align 4
  store i32 %20, i32* %retval
  br label %return

return:                                           ; preds = %if.end18, %if.then
  %21 = load i32, i32* %retval
  ret i32 %21
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @copyinstr(i8*, i8*, i64, i64*) #1

; Function Attrs: noimplicitfloat noredzone
declare i8* @memcpy(i8*, i8*, i64) #1

; Function Attrs: noimplicitfloat noredzone
declare void @__tesla_inline_assertion(i8*, i8*, i32, i32, %struct.__tesla_locality*, ...) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @chgproccnt(%struct.uidinfo*, i32, i64) #1

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal i32 @atomic_fetchadd_int(i32* %p, i32 %v) #4 {
entry:
  %p.addr = alloca i32*, align 8
  %v.addr = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32, i32* %v.addr, align 4
  %1 = load i32*, i32** %p.addr, align 8
  %2 = load i32*, i32** %p.addr, align 8
  %3 = call i32 asm sideeffect "\09lock ; \09\09\09xaddl\09$0, $1 ;\09# atomic_fetchadd_int", "=r,=*m,*m,0,~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %1, i32* %2, i32 %0) #7, !srcloc !1
  store i32 %3, i32* %v.addr, align 4
  %4 = load i32, i32* %v.addr, align 4
  ret i32 %4
}

; Function Attrs: inlinehint noimplicitfloat noredzone nounwind ssp
define internal void @atomic_add_barr_int(i32* %p, i32 %v) #4 {
entry:
  %p.addr = alloca i32*, align 8
  %v.addr = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32*, i32** %p.addr, align 8
  %1 = load i32, i32* %v.addr, align 4
  %2 = load i32*, i32** %p.addr, align 8
  call void asm sideeffect "lock ; addl $1,$0", "=*m,ir,*m,~{memory},~{cc},~{dirflag},~{fpsr},~{flags}"(i32* %0, i32 %1, i32* %2) #7, !srcloc !2
  ret void
}

; Function Attrs: noimplicitfloat noredzone
declare i32 @sysctl_handle_int(%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @malloc_uninit(i8*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @malloc_init(i8*) #1

attributes #0 = { noimplicitfloat noredzone nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noimplicitfloat noredzone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { inlinehint noimplicitfloat noredzone nounwind readnone ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { inlinehint noimplicitfloat noredzone nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin noimplicitfloat noredzone }
attributes #6 = { nobuiltin noimplicitfloat noredzone nounwind readnone }
attributes #7 = { nounwind }

!0 = !{i32 417311}
!1 = !{i32 203985}
!2 = !{i32 -2147262600}
