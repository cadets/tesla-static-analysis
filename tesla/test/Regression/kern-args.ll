; RUN: tesla instrument -S -tesla-manifest %p/kern-args.tesla %s -o %t
; RUN: %filecheck -input-file %t %s

; ModuleID = 'kern_args.bc'
source_filename = "kern_args.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd11.0"

module asm ".ident\09\22$FreeBSD: head/sys/security/mac/mac_cred.c 191731 2009-05-01 21:05:40Z rwatson $\22"
module asm ".globl __start_set_pcpu"
module asm ".globl __stop_set_pcpu"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"
module asm ".globl __start_set_sysinit_set"
module asm ".globl __stop_set_sysinit_set"
module asm ".globl __start_set_sysuninit_set"
module asm ".globl __stop_set_sysuninit_set"

%struct.mac_policy_list_head = type { %struct.mac_policy_conf* }
%struct.mac_policy_conf = type { i8*, i8*, %struct.mac_policy_ops*, i32, i32*, i32, i32, i64, i64, i8*, %struct.anon.67 }
%struct.mac_policy_ops = type { void (%struct.mac_policy_conf*)*, void (%struct.mac_policy_conf*)*, i32 (%struct.thread*, i32, i8*)*, i32 (%struct.bpf_d*, %struct.label*, %struct.ifnet*, %struct.label*)*, void (%struct.ucred*, %struct.bpf_d*, %struct.label*)*, void (%struct.bpf_d*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, void (%struct.ucred*)*, i32 (%struct.ucred*, %struct.label*)*, i32 (%struct.ucred*, %struct.auditinfo*)*, i32 (%struct.ucred*, %struct.auditinfo_addr*)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32, i32*)*, i32 (%struct.ucred*, i32, i32)*, i32 (%struct.ucred*, i32, i32)*, i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.ucred*, %struct.ucred*)*, void (%struct.label*, %struct.label*)*, void (%struct.ucred*)*, void (%struct.ucred*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, i8*, i32*)*, void (%struct.ucred*, %struct.label*)*, void (%struct.ucred*, %struct.mount*, %struct.cdev*, %struct.devfs_dirent*, %struct.label*)*, void (%struct.mount*, i8*, i32, %struct.devfs_dirent*, %struct.label*)*, void (%struct.ucred*, %struct.mount*, %struct.devfs_dirent*, %struct.label*, %struct.devfs_dirent*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, void (%struct.mount*, %struct.devfs_dirent*, %struct.label*, %struct.vnode*, %struct.label*)*, void (%struct.mount*, %struct.label*, %struct.devfs_dirent*, %struct.label*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.ifnet*, %struct.label*, %struct.label*)*, i32 (%struct.ifnet*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.label*, %struct.label*)*, void (%struct.ifnet*, %struct.label*)*, void (%struct.ifnet*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, i8*, i32*)*, void (%struct.ucred*, %struct.ifnet*, %struct.label*, %struct.label*)*, i32 (%struct.inpcb*, %struct.label*, %struct.mbuf*, %struct.label*)*, i32 (%struct.ucred*, %struct.inpcb*, %struct.label*)*, void (%struct.socket*, %struct.label*, %struct.inpcb*, %struct.label*)*, void (%struct.inpcb*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i32)*, void (%struct.socket*, %struct.label*, %struct.inpcb*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.ip6q*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i32)*, i32 (%struct.mbuf*, %struct.label*, %struct.ip6q*, %struct.label*)*, void (%struct.ip6q*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.ip6q*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.ipq*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i32)*, i32 (%struct.mbuf*, %struct.label*, %struct.ipq*, %struct.label*)*, void (%struct.ipq*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.ipq*, %struct.label*)*, i32 (%struct.ucred*)*, i32 (%struct.ucred*, i8*)*, i32 (%struct.ucred*, i8*, i8*)*, i32 (%struct.ucred*, i8*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*)*, void (%struct.label*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i32)*, i32 (%struct.ucred*, %struct.mount*, %struct.label*)*, void (%struct.ucred*, %struct.mount*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, void (%struct.ifnet*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.ifnet*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*)*, void (%struct.ifnet*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.mbuf*, %struct.label*)*, void (%struct.ifnet*, %struct.label*, %struct.mbuf*, %struct.label*)*, i32 (%struct.ucred*, %struct.pipepair*, %struct.label*, i64, i8*)*, i32 (%struct.ucred*, %struct.pipepair*, %struct.label*)*, i32 (%struct.ucred*, %struct.pipepair*, %struct.label*)*, i32 (%struct.ucred*, %struct.pipepair*, %struct.label*, %struct.label*)*, i32 (%struct.ucred*, %struct.pipepair*, %struct.label*)*, i32 (%struct.ucred*, %struct.pipepair*, %struct.label*)*, void (%struct.label*, %struct.label*)*, void (%struct.ucred*, %struct.pipepair*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, i8*, i32*)*, void (%struct.ucred*, %struct.pipepair*, %struct.label*, %struct.label*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.ksem*, %struct.label*)*, i32 (%struct.ucred*, %struct.ksem*, %struct.label*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.ksem*, %struct.label*)*, i32 (%struct.ucred*, %struct.ksem*, %struct.label*, i16)*, i32 (%struct.ucred*, %struct.ksem*, %struct.label*, i32, i32)*, i32 (%struct.ucred*, %struct.ucred*, %struct.ksem*, %struct.label*)*, i32 (%struct.ucred*, %struct.ksem*, %struct.label*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.ksem*, %struct.label*)*, void (%struct.ucred*, %struct.ksem*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, i32 (%struct.ucred*, i8*)*, i32 (%struct.ucred*, %struct.shmfd*, %struct.label*, i32, i32)*, i32 (%struct.ucred*, %struct.shmfd*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.shmfd*, %struct.label*, i16)*, i32 (%struct.ucred*, %struct.shmfd*, %struct.label*, i32, i32)*, i32 (%struct.ucred*, %struct.ucred*, %struct.shmfd*, %struct.label*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.shmfd*, %struct.label*)*, i32 (%struct.ucred*, %struct.shmfd*, %struct.label*)*, void (%struct.ucred*, %struct.shmfd*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, %struct.proc*)*, i32 (%struct.ucred*, %struct.proc*)*, i32 (%struct.ucred*, %struct.proc*, i32)*, i32 (%struct.ucred*, %struct.proc*)*, void (%struct.label*)*, void (%struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*, %struct.sockaddr*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*, %struct.sockaddr*)*, i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.socket*, %struct.label*, %struct.mbuf*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, i32 (%struct.ucred*, %struct.socket*, %struct.label*)*, void (%struct.label*, %struct.label*)*, void (%struct.ucred*, %struct.socket*, %struct.label*)*, void (%struct.socket*, %struct.label*, %struct.mbuf*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, i32 (%struct.label*, i32)*, i32 (%struct.label*, i8*, i8*, i32*)*, void (%struct.socket*, %struct.label*, %struct.socket*, %struct.label*)*, void (%struct.ucred*, %struct.socket*, %struct.label*, %struct.label*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, i32 (%struct.label*, i32)*, void (%struct.mbuf*, %struct.label*, %struct.socket*, %struct.label*)*, void (%struct.socket*, %struct.label*, %struct.socket*, %struct.label*)*, i32 (%struct.label*, i32)*, void (%struct.label*)*, void (%struct.label*, %struct.inpcb*)*, void (%struct.label*, %struct.mbuf*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, i8*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.sysctl_oid*, i8*, i32, %struct.sysctl_req*)*, void (%struct.label*)*, void (%struct.ucred*, %struct.msqid_kernel*, %struct.label*, %struct.msg*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, i32 (%struct.ucred*, %struct.msg*, %struct.label*, %struct.msqid_kernel*, %struct.label*)*, i32 (%struct.ucred*, %struct.msg*, %struct.label*)*, i32 (%struct.ucred*, %struct.msg*, %struct.label*)*, i32 (%struct.ucred*, %struct.msqid_kernel*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.msqid_kernel*, %struct.label*)*, i32 (%struct.ucred*, %struct.msqid_kernel*, %struct.label*)*, i32 (%struct.ucred*, %struct.msqid_kernel*, %struct.label*)*, void (%struct.label*)*, void (%struct.ucred*, %struct.msqid_kernel*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, i32 (%struct.ucred*, %struct.semid_kernel*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.semid_kernel*, %struct.label*)*, i32 (%struct.ucred*, %struct.semid_kernel*, %struct.label*, i64)*, void (%struct.label*)*, void (%struct.ucred*, %struct.semid_kernel*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, i32 (%struct.ucred*, %struct.shmid_kernel*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.shmid_kernel*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.shmid_kernel*, %struct.label*)*, i32 (%struct.ucred*, %struct.shmid_kernel*, %struct.label*, i32)*, void (%struct.label*)*, void (%struct.ucred*, %struct.shmid_kernel*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*)*, void (%struct.thread*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.componentname*, %struct.vattr*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32, i8*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.image_params*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32, i8*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.vnode*, %struct.label*, %struct.componentname*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.componentname*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32, i32)*, void (%struct.ucred*, %struct.vnode*, %struct.label*, i32*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32)*, i32 (%struct.ucred*, %struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.vnode*, %struct.label*, %struct.componentname*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.vnode*, %struct.label*, i32, %struct.componentname*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32, %struct.acl*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32, i8*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i64)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i16)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i32, i32)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, i64, i64, %struct.timespec*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.vnode*, %struct.label*, %struct.componentname*)*, i32 (%struct.ucred*, %struct.ucred*, %struct.vnode*, %struct.label*)*, i32 (%struct.mount*, %struct.label*, %struct.vnode*, %struct.label*)*, void (%struct.mount*, %struct.label*, %struct.vnode*, %struct.label*)*, void (%struct.label*)*, void (%struct.label*, %struct.label*)*, i32 (%struct.ucred*, %struct.mount*, %struct.label*, %struct.vnode*, %struct.label*, %struct.vnode*, %struct.label*, %struct.componentname*)*, void (%struct.ucred*, %struct.ucred*, %struct.vnode*, %struct.label*, %struct.label*, %struct.image_params*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.label*, %struct.image_params*, %struct.label*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, void (%struct.label*)*, i32 (%struct.label*, i8*, i8*, i32*)*, void (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.label*)*, i32 (%struct.ucred*, %struct.vnode*, %struct.label*, %struct.label*)* }
%struct.thread = type { %struct.mtx*, %struct.proc*, %struct.anon.59, %struct.anon.60, %struct.anon.61, %struct.anon.62, %struct.anon.63, %struct.cpuset*, %struct.seltd*, %struct.sleepqueue*, %struct.turnstile*, %struct.rl_q_entry*, %struct.umtx_q*, i32, %struct.sigqueue, i8, i32, i32, i32, i32, i32, i8*, i8*, i8, i8, i8, i8, i16, i16, i16, i16, %struct.turnstile*, i8*, %struct.anon.64, %struct.lock_list_entry*, i32, i32, %struct.ucred*, i32, i32, i32, i32, i32, %struct.rusage, %struct.rusage_ext, i64, i64, i32, i32, i32, i32, i32, %struct.__sigset, i32, %struct.sigaltstack, i32, i64, i32, [20 x i8], %struct.file*, i32, %struct.ksiginfo, i32, %struct.osd, %struct.vm_map_entry*, i32, i32, i32, i32, %struct.__sigset, i8, i8, i8, i8, i8, i8, %struct.pcb*, i32, [2 x i64], %struct.callout, %struct.trapframe*, %struct.vm_object*, i64, i32, i32, %struct.mdthread, %struct.td_sched*, %struct.kaudit_record*, [2 x %struct.lpohead], %struct.kdtrace_thread*, i32, %struct.vnet*, i8*, %struct.trapframe*, %struct.proc*, %struct.vm_page**, i32, %struct.tesla_store* }
%struct.mtx = type { %struct.lock_object, i64 }
%struct.lock_object = type { i8*, i32, i32, %struct.witness* }
%struct.witness = type opaque
%struct.anon.59 = type { %struct.thread*, %struct.thread** }
%struct.anon.60 = type { %struct.thread*, %struct.thread** }
%struct.anon.61 = type { %struct.thread*, %struct.thread** }
%struct.anon.62 = type { %struct.thread*, %struct.thread** }
%struct.anon.63 = type { %struct.thread*, %struct.thread** }
%struct.cpuset = type opaque
%struct.seltd = type opaque
%struct.sleepqueue = type opaque
%struct.rl_q_entry = type opaque
%struct.umtx_q = type opaque
%struct.sigqueue = type { %struct.__sigset, %struct.__sigset, %struct.anon.46, %struct.proc*, i32 }
%struct.anon.46 = type { %struct.ksiginfo*, %struct.ksiginfo** }
%struct.turnstile = type opaque
%struct.anon.64 = type { %struct.turnstile* }
%struct.lock_list_entry = type opaque
%struct.ucred = type { i32, i32, i32, i32, i32, i32, i32, %struct.uidinfo*, %struct.uidinfo*, %struct.prison*, %struct.loginclass*, i32, [2 x i8*], %struct.label*, %struct.auditinfo_addr, i32*, i32 }
%struct.uidinfo = type opaque
%struct.prison = type opaque
%struct.loginclass = type opaque
%struct.label = type { i32, [4 x i64] }
%struct.auditinfo_addr = type { i32, %struct.au_mask, %struct.au_tid_addr, i32, i64 }
%struct.au_mask = type { i32, i32 }
%struct.au_tid_addr = type { i32, i32, [4 x i32] }
%struct.rusage = type { %struct.timeval, %struct.timeval, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.timeval = type { i64, i64 }
%struct.rusage_ext = type { i64, i64, i64, i64, i64, i64, i64 }
%struct.sigaltstack = type { i8*, i64, i32 }
%struct.file = type { i8*, %struct.fileops*, %struct.ucred*, %struct.vnode*, i16, i16, i32, i32, i32, i64, %union.anon.30, i64, i8* }
%struct.fileops = type { i32 (%struct.file*, %struct.uio*, %struct.ucred*, i32, %struct.thread*)*, i32 (%struct.file*, %struct.uio*, %struct.ucred*, i32, %struct.thread*)*, i32 (%struct.file*, i64, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, i64, i8*, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, i32, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, %struct.knote*)*, i32 (%struct.file*, %struct.stat*, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, %struct.thread*)*, i32 (%struct.file*, i16, %struct.ucred*, %struct.thread*)*, i32 (%struct.file*, i32, i32, %struct.ucred*, %struct.thread*)*, i32 }
%struct.uio = type { %struct.iovec*, i32, i64, i64, i32, i32, %struct.thread* }
%struct.iovec = type { i8*, i64 }
%struct.knote = type { %struct.anon.1, %struct.anon.2, %struct.knlist*, %struct.anon.3, %struct.kqueue*, %struct.kevent, i32, i32, i64, %union.anon, %struct.filterops*, i8*, i32 }
%struct.anon.1 = type { %struct.knote* }
%struct.anon.2 = type { %struct.knote* }
%struct.knlist = type { %struct.klist, void (i8*)*, void (i8*)*, void (i8*)*, void (i8*)*, i8* }
%struct.klist = type { %struct.knote* }
%struct.anon.3 = type { %struct.knote*, %struct.knote** }
%struct.kqueue = type opaque
%struct.kevent = type { i64, i16, i16, i32, i64, i8* }
%union.anon = type { %struct.file* }
%struct.filterops = type { i32, i32 (%struct.knote*)*, void (%struct.knote*)*, i32 (%struct.knote*, i64)*, void (%struct.knote*, %struct.kevent*, i64)* }
%struct.stat = type opaque
%struct.vnode = type { i8*, %struct.vop_vector*, i8*, %struct.mount*, %struct.anon.23, %union.anon.24, %struct.anon.25, %struct.anon.26, %struct.anon.27, %struct.namecache*, %struct.lock, %struct.mtx, %struct.lock*, %struct.anon.28, %struct.bufobj, %struct.vpollinfo*, %struct.label*, %struct.lockf*, %struct.rangelock, i64, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.vop_vector = type { %struct.vop_vector*, i32 (%struct.vop_generic_args*)*, i32 (%struct.vop_islocked_args*)*, i32 (%struct.vop_lookup_args*)*, i32 (%struct.vop_cachedlookup_args*)*, i32 (%struct.vop_create_args*)*, i32 (%struct.vop_whiteout_args*)*, i32 (%struct.vop_mknod_args*)*, i32 (%struct.vop_open_args*)*, i32 (%struct.vop_close_args*)*, i32 (%struct.vop_access_args*)*, i32 (%struct.vop_accessx_args*)*, i32 (%struct.vop_getattr_args*)*, i32 (%struct.vop_setattr_args*)*, i32 (%struct.vop_markatime_args*)*, i32 (%struct.vop_read_args*)*, i32 (%struct.vop_write_args*)*, i32 (%struct.vop_ioctl_args*)*, i32 (%struct.vop_poll_args*)*, i32 (%struct.vop_kqfilter_args*)*, i32 (%struct.vop_revoke_args*)*, i32 (%struct.vop_fsync_args*)*, i32 (%struct.vop_remove_args*)*, i32 (%struct.vop_link_args*)*, i32 (%struct.vop_rename_args*)*, i32 (%struct.vop_mkdir_args*)*, i32 (%struct.vop_rmdir_args*)*, i32 (%struct.vop_symlink_args*)*, i32 (%struct.vop_readdir_args*)*, i32 (%struct.vop_readlink_args*)*, i32 (%struct.vop_inactive_args*)*, i32 (%struct.vop_reclaim_args*)*, i32 (%struct.vop_lock1_args*)*, i32 (%struct.vop_unlock_args*)*, i32 (%struct.vop_bmap_args*)*, i32 (%struct.vop_strategy_args*)*, i32 (%struct.vop_getwritemount_args*)*, i32 (%struct.vop_print_args*)*, i32 (%struct.vop_pathconf_args*)*, i32 (%struct.vop_advlock_args*)*, i32 (%struct.vop_advlockasync_args*)*, i32 (%struct.vop_advlockpurge_args*)*, i32 (%struct.vop_reallocblks_args*)*, i32 (%struct.vop_getpages_args*)*, i32 (%struct.vop_putpages_args*)*, i32 (%struct.vop_getacl_args*)*, i32 (%struct.vop_setacl_args*)*, i32 (%struct.vop_aclcheck_args*)*, i32 (%struct.vop_closeextattr_args*)*, i32 (%struct.vop_getextattr_args*)*, i32 (%struct.vop_listextattr_args*)*, i32 (%struct.vop_openextattr_args*)*, i32 (%struct.vop_deleteextattr_args*)*, i32 (%struct.vop_setextattr_args*)*, i32 (%struct.vop_setlabel_args*)*, i32 (%struct.vop_vptofh_args*)*, i32 (%struct.vop_vptocnp_args*)*, i32 (%struct.vop_allocate_args*)*, i32 (%struct.vop_advise_args*)*, i32 (%struct.vop_unp_bind_args*)*, i32 (%struct.vop_unp_connect_args*)*, i32 (%struct.vop_unp_detach_args*)*, i32 (%struct.vop_is_text_args*)*, i32 (%struct.vop_set_text_args*)*, i32 (%struct.vop_unset_text_args*)*, i32 (%struct.vop_get_writecount_args*)*, i32 (%struct.vop_add_writecount_args*)*, i32 (%struct.vop_spare1_args*)*, i32 (%struct.vop_spare2_args*)*, i32 (%struct.vop_spare3_args*)*, i32 (%struct.vop_spare4_args*)*, i32 (%struct.vop_spare5_args*)* }
%struct.vop_generic_args = type { %struct.vnodeop_desc* }
%struct.vnodeop_desc = type { i8*, i32, {}*, i32*, i32, i32, i32, i32 }
%struct.vop_islocked_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_lookup_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.componentname* }
%struct.componentname = type { i64, i64, %struct.thread*, %struct.ucred*, i32, i8*, i8*, i64, i64 }
%struct.vop_cachedlookup_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.componentname* }
%struct.vop_create_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.componentname*, %struct.vattr* }
%struct.vattr = type { i32, i16, i16, i32, i32, i32, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i64, i64, i32, i64 }
%struct.timespec = type { i64, i64 }
%struct.vop_whiteout_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.componentname*, i32 }
%struct.vop_mknod_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.componentname*, %struct.vattr* }
%struct.vop_open_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.ucred*, %struct.thread*, %struct.file* }
%struct.vop_close_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.ucred*, %struct.thread* }
%struct.vop_access_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.ucred*, %struct.thread* }
%struct.vop_accessx_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.ucred*, %struct.thread* }
%struct.vop_getattr_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vattr*, %struct.ucred* }
%struct.vop_setattr_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vattr*, %struct.ucred* }
%struct.vop_markatime_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_read_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.uio*, i32, %struct.ucred* }
%struct.vop_write_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.uio*, i32, %struct.ucred* }
%struct.vop_ioctl_args = type { %struct.vop_generic_args, %struct.vnode*, i64, i8*, i32, %struct.ucred*, %struct.thread* }
%struct.vop_poll_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.ucred*, %struct.thread* }
%struct.vop_kqfilter_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.knote* }
%struct.vop_revoke_args = type { %struct.vop_generic_args, %struct.vnode*, i32 }
%struct.vop_fsync_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.thread* }
%struct.vop_remove_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode*, %struct.componentname* }
%struct.vop_link_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode*, %struct.componentname* }
%struct.vop_rename_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode*, %struct.componentname*, %struct.vnode*, %struct.vnode*, %struct.componentname* }
%struct.vop_mkdir_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.componentname*, %struct.vattr* }
%struct.vop_rmdir_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode*, %struct.componentname* }
%struct.vop_symlink_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.componentname*, %struct.vattr*, i8* }
%struct.vop_readdir_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.uio*, %struct.ucred*, i32*, i32*, i64** }
%struct.vop_readlink_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.uio*, %struct.ucred* }
%struct.vop_inactive_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.thread* }
%struct.vop_reclaim_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.thread* }
%struct.vop_lock1_args = type { %struct.vop_generic_args, %struct.vnode*, i32, i8*, i32 }
%struct.vop_unlock_args = type { %struct.vop_generic_args, %struct.vnode*, i32 }
%struct.vop_bmap_args = type { %struct.vop_generic_args, %struct.vnode*, i64, %struct.bufobj**, i64*, i32*, i32* }
%struct.vop_strategy_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.buf* }
%struct.buf = type opaque
%struct.vop_getwritemount_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.mount** }
%struct.vop_print_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_pathconf_args = type { %struct.vop_generic_args, %struct.vnode*, i32, i64* }
%struct.vop_advlock_args = type { %struct.vop_generic_args, %struct.vnode*, i8*, i32, %struct.flock*, i32 }
%struct.flock = type opaque
%struct.vop_advlockasync_args = type { %struct.vop_generic_args, %struct.vnode*, i8*, i32, %struct.flock*, i32, %struct.task*, i8** }
%struct.task = type opaque
%struct.vop_advlockpurge_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_reallocblks_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.cluster_save* }
%struct.cluster_save = type opaque
%struct.vop_getpages_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vm_page**, i32, i32, i64 }
%struct.vop_putpages_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vm_page**, i32, i32, i32*, i64 }
%struct.vop_getacl_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.acl*, %struct.ucred*, %struct.thread* }
%struct.acl = type { i32, i32, [4 x i32], [254 x %struct.acl_entry] }
%struct.acl_entry = type { i32, i32, i32, i16, i16 }
%struct.vop_setacl_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.acl*, %struct.ucred*, %struct.thread* }
%struct.vop_aclcheck_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.acl*, %struct.ucred*, %struct.thread* }
%struct.vop_closeextattr_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.ucred*, %struct.thread* }
%struct.vop_getextattr_args = type { %struct.vop_generic_args, %struct.vnode*, i32, i8*, %struct.uio*, i64*, %struct.ucred*, %struct.thread* }
%struct.vop_listextattr_args = type { %struct.vop_generic_args, %struct.vnode*, i32, %struct.uio*, i64*, %struct.ucred*, %struct.thread* }
%struct.vop_openextattr_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.ucred*, %struct.thread* }
%struct.vop_deleteextattr_args = type { %struct.vop_generic_args, %struct.vnode*, i32, i8*, %struct.ucred*, %struct.thread* }
%struct.vop_setextattr_args = type { %struct.vop_generic_args, %struct.vnode*, i32, i8*, %struct.uio*, %struct.ucred*, %struct.thread* }
%struct.vop_setlabel_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.label*, %struct.ucred*, %struct.thread* }
%struct.vop_vptofh_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.fid* }
%struct.fid = type { i16, i16, [16 x i8] }
%struct.vop_vptocnp_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.vnode**, %struct.ucred*, i8*, i32* }
%struct.vop_allocate_args = type { %struct.vop_generic_args, %struct.vnode*, i64*, i64* }
%struct.vop_advise_args = type { %struct.vop_generic_args, %struct.vnode*, i64, i64, i32 }
%struct.vop_unp_bind_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.socket* }
%struct.socket = type opaque
%struct.vop_unp_connect_args = type { %struct.vop_generic_args, %struct.vnode*, %struct.socket** }
%struct.vop_unp_detach_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_is_text_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_set_text_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_unset_text_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_get_writecount_args = type { %struct.vop_generic_args, %struct.vnode*, i32* }
%struct.vop_add_writecount_args = type { %struct.vop_generic_args, %struct.vnode*, i32 }
%struct.vop_spare1_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_spare2_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_spare3_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_spare4_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.vop_spare5_args = type { %struct.vop_generic_args, %struct.vnode* }
%struct.mount = type { %struct.mtx, i32, %struct.anon.18, %struct.vfsops*, %struct.vfsconf*, %struct.vnode*, %struct.vnode*, i32, %struct.vnodelst, i32, %struct.vnodelst, i32, i32, i32, i64, %struct.vfsoptlist*, %struct.vfsoptlist*, i32, %struct.statfs, %struct.ucred*, i8*, i64, i32, %struct.netexport*, %struct.label*, i32, i32, i32, i32, %struct.thread*, i8*, %struct.lock, %struct.anon.21, %struct.anon.22 }
%struct.anon.18 = type { %struct.mount*, %struct.mount** }
%struct.vfsops = type { i32 (%struct.mount*)*, i32 (%struct.mntarg*, i8*, i64)*, i32 (%struct.mount*, i32)*, i32 (%struct.mount*, i32, %struct.vnode**)*, i32 (%struct.mount*, i32, i32, i8*)*, i32 (%struct.mount*, %struct.statfs*)*, i32 (%struct.mount*, i32)*, i32 (%struct.mount*, i32, i32, %struct.vnode**)*, i32 (%struct.mount*, %struct.fid*, i32, %struct.vnode**)*, i32 (%struct.mount*, %struct.sockaddr*, i32*, %struct.ucred**, i32*, i32**)*, i32 (%struct.vfsconf*)*, i32 (%struct.vfsconf*)*, i32 (%struct.mount*, i32, %struct.vnode*, i32, i8*)*, i32 (%struct.mount*, i32, %struct.sysctl_req*)*, void (%struct.mount*)*, void (%struct.mount*, %struct.vnode*)*, void (%struct.mount*, %struct.vnode*)* }
%struct.mntarg = type opaque
%struct.sockaddr = type opaque
%struct.sysctl_req = type { %struct.thread*, i32, i8*, i64, i64, i32 (%struct.sysctl_req*, i8*, i64)*, i8*, i64, i64, i32 (%struct.sysctl_req*, i8*, i64)*, i64, i32 }
%struct.vfsconf = type { i32, [16 x i8], %struct.vfsops*, i32, i32, i32, %struct.vfsoptdecl*, %struct.anon.19 }
%struct.vfsoptdecl = type opaque
%struct.anon.19 = type { %struct.vfsconf*, %struct.vfsconf** }
%struct.vnodelst = type { %struct.vnode*, %struct.vnode** }
%struct.vfsoptlist = type { %struct.vfsopt*, %struct.vfsopt** }
%struct.vfsopt = type { %struct.anon.20, i8*, i8*, i32, i32, i32 }
%struct.anon.20 = type { %struct.vfsopt*, %struct.vfsopt** }
%struct.statfs = type { i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [10 x i64], i32, i32, %struct.fsid, [80 x i8], [16 x i8], [88 x i8], [88 x i8] }
%struct.fsid = type { [2 x i32] }
%struct.netexport = type opaque
%struct.anon.21 = type { %struct.mount*, %struct.mount** }
%struct.anon.22 = type { %struct.mount*, %struct.mount** }
%struct.anon.23 = type { %struct.vnode*, %struct.vnode** }
%union.anon.24 = type { %struct.mount* }
%struct.anon.25 = type { %struct.vnode*, %struct.vnode** }
%struct.anon.26 = type { %struct.namecache* }
%struct.anon.27 = type { %struct.namecache*, %struct.namecache** }
%struct.namecache = type opaque
%struct.lock = type { %struct.lock_object, i64, i32, i32, i32 }
%struct.anon.28 = type { %struct.vnode*, %struct.vnode** }
%struct.bufobj = type { %struct.rwlock, %struct.buf_ops*, %struct.vm_object*, %struct.anon.17, i8*, %struct.vnode*, %struct.bufv, %struct.bufv, i64, i32, i32 }
%struct.rwlock = type { %struct.lock_object, i64 }
%struct.buf_ops = type { i8*, i32 (%struct.buf*)*, void (%struct.bufobj*, %struct.buf*)*, i32 (%struct.bufobj*, i32)*, void (%struct.bufobj*, %struct.buf*)* }
%struct.anon.17 = type { %struct.bufobj*, %struct.bufobj** }
%struct.bufv = type { %struct.buflists, %struct.pctrie, i32 }
%struct.buflists = type { %struct.buf*, %struct.buf** }
%struct.pctrie = type { i64 }
%struct.vpollinfo = type { %struct.mtx, %struct.selinfo, i16, i16 }
%struct.selinfo = type { %struct.selfdlist, %struct.knlist, %struct.mtx* }
%struct.selfdlist = type { %struct.selfd*, %struct.selfd** }
%struct.selfd = type opaque
%struct.lockf = type opaque
%struct.rangelock = type { %struct.anon.29, %struct.rl_q_entry* }
%struct.anon.29 = type { %struct.rl_q_entry*, %struct.rl_q_entry** }
%union.anon.30 = type { %struct.cdev_privdata* }
%struct.cdev_privdata = type opaque
%struct.ksiginfo = type { %struct.anon.39, %struct.__siginfo, i32, %struct.sigqueue* }
%struct.anon.39 = type { %struct.ksiginfo*, %struct.ksiginfo** }
%struct.__siginfo = type { i32, i32, i32, i32, i32, i32, i8*, %union.sigval, %union.anon.40 }
%union.sigval = type { i8* }
%union.anon.40 = type { %struct.anon.45 }
%struct.anon.45 = type { i64, [7 x i32] }
%struct.osd = type { i32, i8**, %struct.anon.65 }
%struct.anon.65 = type { %struct.osd*, %struct.osd** }
%struct.vm_map_entry = type { %struct.vm_map_entry*, %struct.vm_map_entry*, %struct.vm_map_entry*, %struct.vm_map_entry*, i64, i64, i64, i64, i64, %union.vm_map_object, i64, i32, i8, i8, i8, i8, i32, i64, %struct.ucred* }
%union.vm_map_object = type { %struct.vm_object* }
%struct.__sigset = type { [4 x i32] }
%struct.pcb = type opaque
%struct.callout = type { %union.anon.31, i64, i64, i8*, void (i8*)*, %struct.lock_object*, i32, i32 }
%union.anon.31 = type { %struct.anon.32 }
%struct.anon.32 = type { %struct.callout*, %struct.callout** }
%struct.vm_object = type { %struct.rwlock, %struct.anon.4, %struct.anon.5, %struct.anon.6, %struct.anon.7, %struct.vm_radix, i64, i32, i32, i32, i8, i8, i16, i16, i32, i32, %struct.vm_object*, i64, %struct.anon.8, %struct.anon.9, %struct.vm_radix, i8*, %union.anon.10, %struct.ucred*, i64 }
%struct.anon.4 = type { %struct.vm_object*, %struct.vm_object** }
%struct.anon.5 = type { %struct.vm_object* }
%struct.anon.6 = type { %struct.vm_object*, %struct.vm_object** }
%struct.anon.7 = type { %struct.vm_page*, %struct.vm_page** }
%struct.vm_page = type opaque
%struct.anon.8 = type { %struct.vm_object*, %struct.vm_object** }
%struct.anon.9 = type { %struct.vm_reserv* }
%struct.vm_reserv = type opaque
%struct.vm_radix = type { i64 }
%union.anon.10 = type { %struct.anon.12 }
%struct.anon.12 = type { %struct.anon.13, %struct.cdev_pager_ops*, %struct.cdev* }
%struct.anon.13 = type { %struct.vm_page*, %struct.vm_page** }
%struct.cdev_pager_ops = type opaque
%struct.cdev = type opaque
%struct.mdthread = type { i32, i64, i64 }
%struct.td_sched = type opaque
%struct.kaudit_record = type opaque
%struct.lpohead = type { %struct.lock_profile_object* }
%struct.lock_profile_object = type opaque
%struct.kdtrace_thread = type opaque
%struct.vnet = type opaque
%struct.trapframe = type opaque
%struct.proc = type { %struct.anon, %struct.anon.0, %struct.mtx, %struct.ucred*, %struct.filedesc*, %struct.filedesc_to_leader*, %struct.pstats*, %struct.plimit*, %struct.callout, %struct.sigacts*, i32, i32, i32, %struct.anon.35, %struct.anon.36, %struct.proc*, %struct.anon.37, %struct.anon.38, %struct.mtx, %struct.ksiginfo*, %struct.sigqueue, i32, %struct.vmspace*, i32, %struct.itimerval, %struct.rusage, %struct.rusage_ext, %struct.rusage_ext, i32, i32, i32, %struct.vnode*, %struct.ucred*, %struct.vnode*, i32, %struct.sigiolst, i32, i32, i64, i32, i32, i8, i8, %struct.nlminfo*, %struct.kaioinfo*, %struct.thread*, i32, %struct.thread*, i32, i32, %struct.itimers*, %struct.procdesc*, i32, i32, [20 x i8], %struct.pgrp*, %struct.sysentvec*, %struct.pargs*, i64, i8, i32, i16, %struct.knlist, i32, %struct.mdproc, %struct.callout, i16, %struct.proc*, %struct.proc*, i8*, %struct.label*, %struct.p_sched*, %struct.anon.55, %struct.anon.56, %struct.kdtrace_proc*, %struct.cv, %struct.cv, i64, %struct.racct*, i8, %struct.anon.57, %struct.anon.58 }
%struct.anon = type { %struct.proc*, %struct.proc** }
%struct.anon.0 = type { %struct.thread*, %struct.thread** }
%struct.filedesc = type { %struct.filedescent*, %struct.vnode*, %struct.vnode*, %struct.vnode*, i32, i64*, i32, i32, i16, i16, i16, %struct.sx, %struct.kqlist, i32, i32 }
%struct.filedescent = type { %struct.file*, %struct.filecaps, i8 }
%struct.filecaps = type { i64, i32, i64*, i16 }
%struct.sx = type { %struct.lock_object, i64 }
%struct.kqlist = type { %struct.kqueue* }
%struct.filedesc_to_leader = type { i32, i32, i32, %struct.proc*, %struct.filedesc_to_leader*, %struct.filedesc_to_leader* }
%struct.pstats = type opaque
%struct.plimit = type opaque
%struct.sigacts = type { [128 x void (i32)*], [128 x %struct.__sigset], %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, %struct.__sigset, i32, i32, %struct.mtx }
%struct.anon.35 = type { %struct.proc*, %struct.proc** }
%struct.anon.36 = type { %struct.proc*, %struct.proc** }
%struct.anon.37 = type { %struct.proc*, %struct.proc** }
%struct.anon.38 = type { %struct.proc* }
%struct.vmspace = type { %struct.vm_map, %struct.shmmap_state*, i64, i64, i64, i64, i8*, i8*, i8*, i32, %struct.pmap }
%struct.vm_map = type { %struct.vm_map_entry, %struct.sx, %struct.mtx, i32, i64, i32, i8, i8, i8, %struct.vm_map_entry*, %struct.pmap*, i32 }
%struct.shmmap_state = type opaque
%struct.pmap = type { %struct.mtx, i64*, %struct.anon.47, %struct._cpuset, %struct.pmap_statistics, %struct.vm_radix }
%struct.anon.47 = type { %struct.pv_chunk*, %struct.pv_chunk** }
%struct.pv_chunk = type { %struct.pmap*, %struct.anon.48, [3 x i64], %struct.anon.49, [168 x %struct.pv_entry] }
%struct.anon.48 = type { %struct.pv_chunk*, %struct.pv_chunk** }
%struct.anon.49 = type { %struct.pv_chunk*, %struct.pv_chunk** }
%struct.pv_entry = type { i64, %struct.anon.50 }
%struct.anon.50 = type { %struct.pv_entry*, %struct.pv_entry** }
%struct._cpuset = type { [1 x i64] }
%struct.pmap_statistics = type { i64, i64 }
%struct.itimerval = type { %struct.timeval, %struct.timeval }
%struct.sigiolst = type { %struct.sigio* }
%struct.sigio = type { %union.anon.51, %struct.anon.52, %struct.sigio**, %struct.ucred*, i32 }
%union.anon.51 = type { %struct.proc* }
%struct.anon.52 = type { %struct.sigio* }
%struct.nlminfo = type opaque
%struct.kaioinfo = type opaque
%struct.itimers = type opaque
%struct.procdesc = type opaque
%struct.pgrp = type { %struct.anon.53, %struct.anon.54, %struct.session*, %struct.sigiolst, i32, i32, %struct.mtx }
%struct.anon.53 = type { %struct.pgrp*, %struct.pgrp** }
%struct.anon.54 = type { %struct.proc* }
%struct.session = type { i32, %struct.proc*, %struct.vnode*, %struct.cdev_priv*, %struct.tty*, i32, [40 x i8], %struct.mtx }
%struct.cdev_priv = type opaque
%struct.tty = type opaque
%struct.sysentvec = type opaque
%struct.pargs = type { i32, i32, [1 x i8] }
%struct.mdproc = type { %struct.proc_ldt*, %struct.system_segment_descriptor }
%struct.proc_ldt = type { i8*, i32 }
%struct.system_segment_descriptor = type <{ [16 x i8] }>
%struct.p_sched = type opaque
%struct.anon.55 = type { %struct.ktr_request*, %struct.ktr_request** }
%struct.ktr_request = type opaque
%struct.anon.56 = type { %struct.mqueue_notifier* }
%struct.mqueue_notifier = type opaque
%struct.kdtrace_proc = type opaque
%struct.cv = type { i8*, i32 }
%struct.racct = type opaque
%struct.anon.57 = type { %struct.proc*, %struct.proc** }
%struct.anon.58 = type { %struct.proc* }
%struct.tesla_store = type opaque
%struct.bpf_d = type opaque
%struct.ifnet = type opaque
%struct.mbuf = type opaque
%struct.auditinfo = type { i32, %struct.au_mask, %struct.au_tid, i32 }
%struct.au_tid = type { i32, i32 }
%struct.devfs_dirent = type opaque
%struct.inpcb = type opaque
%struct.ip6q = type opaque
%struct.ipq = type opaque
%struct.pipepair = type opaque
%struct.ksem = type opaque
%struct.shmfd = type opaque
%struct.sysctl_oid = type { %struct.sysctl_oid_list*, %struct.anon.66, i32, i32, i8*, i64, i8*, i32 (%struct.sysctl_oid*, i8*, i64, %struct.sysctl_req*)*, i8*, i32, i32, i8* }
%struct.sysctl_oid_list = type { %struct.sysctl_oid* }
%struct.anon.66 = type { %struct.sysctl_oid* }
%struct.msqid_kernel = type opaque
%struct.msg = type opaque
%struct.semid_kernel = type opaque
%struct.shmid_kernel = type opaque
%struct.image_params = type { %struct.proc*, %struct.label*, %struct.vnode*, %struct.vm_object*, %struct.vattr*, i8*, i64, i64, i8, i8, i8, i8*, i8*, %struct.sf_buf*, i64, i64, %struct.image_args*, %struct.sysentvec*, i8*, i64, i8*, i64, i32, i64, i32, i8 }
%struct.sf_buf = type opaque
%struct.image_args = type { i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32, i32 }
%struct.sbuf = type { i8*, i32 (i8*, i8*, i32)*, i8*, i32, i64, i64, i32, i64 }
%struct.anon.67 = type { %struct.mac_policy_conf*, %struct.mac_policy_conf** }
%struct.sdt_provider = type { i8*, %struct.anon.71, %struct.probe_list_head, i64 }
%struct.anon.71 = type { %struct.sdt_provider*, %struct.sdt_provider** }
%struct.probe_list_head = type { %struct.sdt_probe*, %struct.sdt_probe** }
%struct.sdt_probe = type { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32 }
%struct.anon.72 = type { %struct.sdt_probe*, %struct.sdt_probe** }
%struct.argtype_list_head = type { %struct.sdt_argtype*, %struct.sdt_argtype** }
%struct.sdt_argtype = type { i32, i8*, %struct.anon.73, %struct.sdt_probe* }
%struct.anon.73 = type { %struct.sdt_argtype*, %struct.sdt_argtype** }
%struct.sysinit = type { i32, i32, void (i8*)*, i8* }
%struct.rm_priotracker = type { %struct.rm_queue, %struct.rmlock*, %struct.thread*, i32, %struct.anon.70 }
%struct.rm_queue = type { %struct.rm_queue*, %struct.rm_queue* }
%struct.rmlock = type { %struct.lock_object, %struct._cpuset, %struct.anon.68, %union.anon.69 }
%struct.anon.68 = type { %struct.rm_priotracker* }
%union.anon.69 = type { %struct.mtx }
%struct.anon.70 = type { %struct.rm_priotracker*, %struct.rm_priotracker** }

@mac_static_policy_list = external global %struct.mac_policy_list_head
@mac_policy_list = external global %struct.mac_policy_list_head
@mac_labeled = external global i64
@.str = private unnamed_addr constant [2 x i8] c",\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%s/\00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c",%s/\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@sdt_provider_mac_framework = external global [1 x %struct.sdt_provider]
@.str4 = private unnamed_addr constant [7 x i8] c"kernel\00", align 1
@.str5 = private unnamed_addr constant [19 x i8] c"cred_check_relabel\00", align 1
@.str6 = private unnamed_addr constant [14 x i8] c"mac-check-err\00", align 1
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str7 = private unnamed_addr constant [13 x i8] c"mac-check-ok\00", align 1
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_probe_func = external global void (i32, i64, i64, i64, i64, i64)*
@.str8 = private unnamed_addr constant [18 x i8] c"cred_check_setuid\00", align 1
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str9 = private unnamed_addr constant [19 x i8] c"cred_check_seteuid\00", align 1
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str10 = private unnamed_addr constant [18 x i8] c"cred_check_setgid\00", align 1
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str11 = private unnamed_addr constant [19 x i8] c"cred_check_setegid\00", align 1
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str12 = private unnamed_addr constant [21 x i8] c"cred_check_setgroups\00", align 1
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str13 = private unnamed_addr constant [20 x i8] c"cred_check_setreuid\00", align 1
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str14 = private unnamed_addr constant [20 x i8] c"cred_check_setregid\00", align 1
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str15 = private unnamed_addr constant [21 x i8] c"cred_check_setresuid\00", align 1
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str16 = private unnamed_addr constant [21 x i8] c"cred_check_setresgid\00", align 1
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@.str17 = private unnamed_addr constant [19 x i8] c"cred_check_visible\00", align 1
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str6, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok = global <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }> <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } { i32 88, i32 0, %struct.sdt_provider* getelementptr inbounds ([1 x %struct.sdt_provider], [1 x %struct.sdt_provider]* @sdt_provider_mac_framework, i32 0, i32 0), %struct.anon.72 zeroinitializer, %struct.argtype_list_head zeroinitializer, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str7, i32 0, i32 0), i64 0, i32 0, [4 x i8] undef } }>, align 16
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_register, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 2, void (i8*)* @sdt_probe_deregister, i8* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_init_sys_init = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_register, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2 to i8*) }, align 8
@__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_init_sys_init = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_init_sys_init to i8*), section "set_sysinit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_uninit_sys_uninit = internal global %struct.sysinit { i32 34865152, i32 3, void (i8*)* @sdt_argtype_deregister, i8* bitcast ([1 x %struct.sdt_argtype]* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2 to i8*) }, align 8
@__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_uninit_sys_uninit = internal constant i8* bitcast (%struct.sysinit* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_uninit_sys_uninit to i8*), section "set_sysuninit_set", align 8
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok to %struct.sdt_probe*) }], align 16
@.str18 = private unnamed_addr constant [15 x i8] c"struct ucred *\00", align 1
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok to %struct.sdt_probe*) }], align 16
@.str19 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_visible_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@.str20 = private unnamed_addr constant [6 x i8] c"gid_t\00", align 1
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@.str21 = private unnamed_addr constant [6 x i8] c"uid_t\00", align 1
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str22, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok to %struct.sdt_probe*) }], align 16
@.str22 = private unnamed_addr constant [8 x i8] c"gid_t *\00", align 1
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str22, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str20, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str21, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str23, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok to %struct.sdt_probe*) }], align 16
@.str23 = private unnamed_addr constant [15 x i8] c"struct label *\00", align 1
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str23, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str18, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err to %struct.sdt_probe*) }], align 16
@sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0 = internal global [1 x %struct.sdt_argtype] [%struct.sdt_argtype { i32 0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str19, i32 0, i32 0), %struct.anon.73 zeroinitializer, %struct.sdt_probe* bitcast (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err to %struct.sdt_probe*) }], align 16
@llvm.used = appending global [204 x i8*] [i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_err3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err4_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok4_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err4_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok3_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok4_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_err2_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok0_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok1_uninit_sys_uninit to i8*), i8* bitcast (i8** @__set_sysinit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_init_sys_init to i8*), i8* bitcast (i8** @__set_sysuninit_set_sym_sdt_mac_framework_kernel_cred_check_visible_mac_check_ok2_uninit_sys_uninit to i8*)], section "llvm.metadata"

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define %struct.label* @mac_cred_label_alloc() #0 {
  %1 = tail call %struct.label* @mac_labelzone_alloc(i32 2) #3
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %2 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %2, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %9, %0
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.0, %9 ], [ %mpc.03, %0 ]
  %3 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %4 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %3, align 8
  %5 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %4, i64 0, i32 28
  %6 = load void (%struct.label*)*, void (%struct.label*)** %5, align 8
  %7 = icmp eq void (%struct.label*)* %6, null
  br i1 %7, label %9, label %8

; <label>:8:                                      ; preds = %.lr.ph6
  tail call void %6(%struct.label* %1) #3
  br label %9

; <label>:9:                                      ; preds = %8, %.lr.ph6
  %10 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %10, align 8
  %11 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %11, label %._crit_edge7, label %.lr.ph6

._crit_edge7:                                     ; preds = %9, %0
  %12 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %13 = icmp eq %struct.mac_policy_conf* %12, null
  br i1 %13, label %25, label %14

; <label>:14:                                     ; preds = %._crit_edge7
  tail call void @mac_policy_slock_sleep() #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %22, %14
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.1, %22 ], [ %mpc.11, %14 ]
  %16 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %17 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %16, align 8
  %18 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %17, i64 0, i32 28
  %19 = load void (%struct.label*)*, void (%struct.label*)** %18, align 8
  %20 = icmp eq void (%struct.label*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %.lr.ph
  tail call void %19(%struct.label* %1) #3
  br label %22

; <label>:22:                                     ; preds = %21, %.lr.ph
  %23 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %23, align 8
  %24 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %24, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %22, %14
  tail call void @mac_policy_sunlock_sleep() #3
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %._crit_edge7
  ret %struct.label* %1
}

; Function Attrs: noimplicitfloat noredzone
declare %struct.label* @mac_labelzone_alloc(i32) #1

; Function Attrs: noimplicitfloat noredzone
declare void @mac_policy_slock_sleep() #1

; Function Attrs: noimplicitfloat noredzone
declare void @mac_policy_sunlock_sleep() #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_init(%struct.ucred* nocapture %cred) #0 {
  %1 = load i64, i64* @mac_labeled, align 8
  %2 = and i64 %1, 1
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %7, label %4

; <label>:4:                                      ; preds = %0
  %5 = tail call %struct.label* @mac_cred_label_alloc() #4
  %6 = getelementptr inbounds %struct.ucred, %struct.ucred* %cred, i64 0, i32 13
  store %struct.label* %5, %struct.label** %6, align 8
  br label %9

; <label>:7:                                      ; preds = %0
  %8 = getelementptr inbounds %struct.ucred, %struct.ucred* %cred, i64 0, i32 13
  store %struct.label* null, %struct.label** %8, align 8
  br label %9

; <label>:9:                                      ; preds = %7, %4
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_label_free(%struct.label* %label) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %1, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %8, %0
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.0, %8 ], [ %mpc.03, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 26
  %5 = load void (%struct.label*)*, void (%struct.label*)** %4, align 8
  %6 = icmp eq void (%struct.label*)* %5, null
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %.lr.ph6
  call void %5(%struct.label* %label) #3
  br label %8

; <label>:8:                                      ; preds = %7, %.lr.ph6
  %9 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %9, align 8
  %10 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %10, label %._crit_edge7, label %.lr.ph6

._crit_edge7:                                     ; preds = %8, %0
  %11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %12 = icmp eq %struct.mac_policy_conf* %11, null
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %14) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %22, %13
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.1, %22 ], [ %mpc.11, %13 ]
  %16 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %17 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %16, align 8
  %18 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %17, i64 0, i32 26
  %19 = load void (%struct.label*)*, void (%struct.label*)** %18, align 8
  %20 = icmp eq void (%struct.label*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %.lr.ph
  call void %19(%struct.label* %label) #3
  br label %22

; <label>:22:                                     ; preds = %21, %.lr.ph
  %23 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %23, align 8
  %24 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %24, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %22, %13
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %14) #5
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %._crit_edge7
  call void @mac_labelzone_free(%struct.label* %label) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: noimplicitfloat noredzone
declare void @mac_policy_slock_nosleep(%struct.rm_priotracker*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @mac_policy_sunlock_nosleep(%struct.rm_priotracker*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: noimplicitfloat noredzone
declare void @mac_labelzone_free(%struct.label*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_destroy(%struct.ucred* nocapture %cred) #0 {
  %1 = getelementptr inbounds %struct.ucred, %struct.ucred* %cred, i64 0, i32 13
  %2 = load %struct.label*, %struct.label** %1, align 8
  %3 = icmp eq %struct.label* %2, null
  br i1 %3, label %5, label %4

; <label>:4:                                      ; preds = %0
  tail call void @mac_cred_label_free(%struct.label* %2) #4
  store %struct.label* null, %struct.label** %1, align 8
  br label %5

; <label>:5:                                      ; preds = %4, %0
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_associate_nfsd(%struct.ucred* %cred) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %1, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %8, %0
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.0, %8 ], [ %mpc.03, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 8
  %5 = load void (%struct.ucred*)*, void (%struct.ucred*)** %4, align 8
  %6 = icmp eq void (%struct.ucred*)* %5, null
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %.lr.ph6
  call void %5(%struct.ucred* %cred) #3
  br label %8

; <label>:8:                                      ; preds = %7, %.lr.ph6
  %9 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %9, align 8
  %10 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %10, label %._crit_edge7, label %.lr.ph6

._crit_edge7:                                     ; preds = %8, %0
  %11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %12 = icmp eq %struct.mac_policy_conf* %11, null
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %14) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %22, %13
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.1, %22 ], [ %mpc.11, %13 ]
  %16 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %17 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %16, align 8
  %18 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %17, i64 0, i32 8
  %19 = load void (%struct.ucred*)*, void (%struct.ucred*)** %18, align 8
  %20 = icmp eq void (%struct.ucred*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %.lr.ph
  call void %19(%struct.ucred* %cred) #3
  br label %22

; <label>:22:                                     ; preds = %21, %.lr.ph
  %23 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %23, align 8
  %24 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %24, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %22, %13
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %14) #5
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %._crit_edge7
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_create_swapper(%struct.ucred* %cred) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %1, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %8, %0
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.0, %8 ], [ %mpc.03, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 24
  %5 = load void (%struct.ucred*)*, void (%struct.ucred*)** %4, align 8
  %6 = icmp eq void (%struct.ucred*)* %5, null
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %.lr.ph6
  call void %5(%struct.ucred* %cred) #3
  br label %8

; <label>:8:                                      ; preds = %7, %.lr.ph6
  %9 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %9, align 8
  %10 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %10, label %._crit_edge7, label %.lr.ph6

._crit_edge7:                                     ; preds = %8, %0
  %11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %12 = icmp eq %struct.mac_policy_conf* %11, null
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %14) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %22, %13
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.1, %22 ], [ %mpc.11, %13 ]
  %16 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %17 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %16, align 8
  %18 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %17, i64 0, i32 24
  %19 = load void (%struct.ucred*)*, void (%struct.ucred*)** %18, align 8
  %20 = icmp eq void (%struct.ucred*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %.lr.ph
  call void %19(%struct.ucred* %cred) #3
  br label %22

; <label>:22:                                     ; preds = %21, %.lr.ph
  %23 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %23, align 8
  %24 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %24, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %22, %13
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %14) #5
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %._crit_edge7
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_create_init(%struct.ucred* %cred) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %1, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %8, %0
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.0, %8 ], [ %mpc.03, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 25
  %5 = load void (%struct.ucred*)*, void (%struct.ucred*)** %4, align 8
  %6 = icmp eq void (%struct.ucred*)* %5, null
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %.lr.ph6
  call void %5(%struct.ucred* %cred) #3
  br label %8

; <label>:8:                                      ; preds = %7, %.lr.ph6
  %9 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %9, align 8
  %10 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %10, label %._crit_edge7, label %.lr.ph6

._crit_edge7:                                     ; preds = %8, %0
  %11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %12 = icmp eq %struct.mac_policy_conf* %11, null
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %14) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %22, %13
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.1, %22 ], [ %mpc.11, %13 ]
  %16 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %17 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %16, align 8
  %18 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %17, i64 0, i32 25
  %19 = load void (%struct.ucred*)*, void (%struct.ucred*)** %18, align 8
  %20 = icmp eq void (%struct.ucred*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %.lr.ph
  call void %19(%struct.ucred* %cred) #3
  br label %22

; <label>:22:                                     ; preds = %21, %.lr.ph
  %23 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %23, align 8
  %24 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %24, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %22, %13
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %14) #5
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %._crit_edge7
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_externalize_label(%struct.label* %label, i8* %elements, i8* %outbuf, i64 %outbuflen) #0 {
  %claimed = alloca i32, align 4
  %element_temp = alloca i8*, align 8
  %sb = alloca %struct.sbuf, align 8
  %1 = bitcast %struct.sbuf* %sb to i8*
  call void @llvm.lifetime.start(i64 64, i8* %1) #5
  %2 = trunc i64 %outbuflen to i32
  %3 = call %struct.sbuf* @sbuf_new(%struct.sbuf* %sb, i8* %outbuf, i32 %2, i32 0) #3
  store i8* %elements, i8** %element_temp, align 8
  br label %.outer

.outer:                                           ; preds = %58, %0
  %first.0.ph = phi i32 [ 1, %0 ], [ 0, %58 ]
  %4 = call i8* @strsep(i8** %element_temp, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #3
  %5 = icmp eq i8* %4, null
  br i1 %5, label %.loopexit, label %.lr.ph11

.lr.ph11:                                         ; preds = %.outer
  %6 = icmp eq i32 %first.0.ph, 0
  br label %7

; <label>:7:                                      ; preds = %53, %.lr.ph11
  %8 = phi i8* [ %4, %.lr.ph11 ], [ %56, %53 ]
  %9 = load i8, i8* %8, align 1
  %10 = icmp eq i8 %9, 63
  %11 = getelementptr inbounds i8, i8* %8, i64 1
  %element_name.0 = select i1 %10, i8* %11, i8* %8
  %12 = call i64 @sbuf_len(%struct.sbuf* %sb) #3
  br i1 %6, label %15, label %13

; <label>:13:                                     ; preds = %7
  %14 = call i32 (%struct.sbuf*, i8*, ...) @sbuf_printf(%struct.sbuf* %sb, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i64 0, i64 0), i8* %element_name.0) #3
  br label %17

; <label>:15:                                     ; preds = %7
  %16 = call i32 (%struct.sbuf*, i8*, ...) @sbuf_printf(%struct.sbuf* %sb, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str2, i64 0, i64 0), i8* %element_name.0) #3
  br label %17

; <label>:17:                                     ; preds = %15, %13
  %error.1 = phi i32 [ %14, %13 ], [ %16, %15 ]
  %18 = icmp eq i32 %error.1, -1
  br i1 %18, label %.loopexit, label %19

; <label>:19:                                     ; preds = %17
  store i32 0, i32* %claimed, align 4
  %mpc.01 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %20 = icmp eq %struct.mac_policy_conf* %mpc.01, null
  br i1 %20, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %29, %19
  %mpc.03 = phi %struct.mac_policy_conf* [ %mpc.0, %29 ], [ %mpc.01, %19 ]
  %error.22 = phi i32 [ %error.3, %29 ], [ 0, %19 ]
  %21 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.03, i64 0, i32 2
  %22 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %21, align 8
  %23 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %22, i64 0, i32 27
  %24 = load i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)** %23, align 8
  %25 = icmp eq i32 (%struct.label*, i8*, %struct.sbuf*, i32*)* %24, null
  br i1 %25, label %29, label %26

; <label>:26:                                     ; preds = %.lr.ph
  %27 = call i32 %24(%struct.label* %label, i8* %element_name.0, %struct.sbuf* %sb, i32* %claimed) #3
  %28 = call i32 @mac_error_select(i32 %27, i32 %error.22) #3
  br label %29

; <label>:29:                                     ; preds = %26, %.lr.ph
  %error.3 = phi i32 [ %28, %26 ], [ %error.22, %.lr.ph ]
  %30 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.03, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %30, align 8
  %31 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %31, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %29, %19
  %error.2.lcssa = phi i32 [ 0, %19 ], [ %error.3, %29 ]
  %32 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %33 = icmp eq %struct.mac_policy_conf* %32, null
  br i1 %33, label %47, label %34

; <label>:34:                                     ; preds = %._crit_edge
  call void @mac_policy_slock_sleep() #3
  %mpc.14 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %35 = icmp eq %struct.mac_policy_conf* %mpc.14, null
  br i1 %35, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %44, %34
  %mpc.16 = phi %struct.mac_policy_conf* [ %mpc.1, %44 ], [ %mpc.14, %34 ]
  %error.45 = phi i32 [ %error.5, %44 ], [ %error.2.lcssa, %34 ]
  %36 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.16, i64 0, i32 2
  %37 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %36, align 8
  %38 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %37, i64 0, i32 27
  %39 = load i32 (%struct.label*, i8*, %struct.sbuf*, i32*)*, i32 (%struct.label*, i8*, %struct.sbuf*, i32*)** %38, align 8
  %40 = icmp eq i32 (%struct.label*, i8*, %struct.sbuf*, i32*)* %39, null
  br i1 %40, label %44, label %41

; <label>:41:                                     ; preds = %.lr.ph8
  %42 = call i32 %39(%struct.label* %label, i8* %element_name.0, %struct.sbuf* %sb, i32* %claimed) #3
  %43 = call i32 @mac_error_select(i32 %42, i32 %error.45) #3
  br label %44

; <label>:44:                                     ; preds = %41, %.lr.ph8
  %error.5 = phi i32 [ %43, %41 ], [ %error.45, %.lr.ph8 ]
  %45 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.16, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %45, align 8
  %46 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %46, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %44, %34
  %error.4.lcssa = phi i32 [ %error.2.lcssa, %34 ], [ %error.5, %44 ]
  call void @mac_policy_sunlock_sleep() #3
  br label %47

; <label>:47:                                     ; preds = %._crit_edge9, %._crit_edge
  %error.6 = phi i32 [ %error.2.lcssa, %._crit_edge ], [ %error.4.lcssa, %._crit_edge9 ]
  %48 = icmp eq i32 %error.6, 0
  br i1 %48, label %49, label %.loopexit

; <label>:49:                                     ; preds = %47
  %50 = load i32, i32* %claimed, align 4
  %51 = icmp ne i32 %50, 0
  %52 = xor i1 %10, true
  %or.cond = or i1 %51, %52
  br i1 %or.cond, label %58, label %53

; <label>:53:                                     ; preds = %49
  %sext = shl i64 %12, 32
  %54 = ashr exact i64 %sext, 32
  %55 = call i32 @sbuf_setpos(%struct.sbuf* %sb, i64 %54) #3
  %56 = call i8* @strsep(i8** %element_temp, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #3
  %57 = icmp eq i8* %56, null
  br i1 %57, label %.loopexit, label %7

; <label>:58:                                     ; preds = %49
  %59 = icmp eq i32 %50, 1
  br i1 %59, label %.outer, label %.loopexit

.loopexit:                                        ; preds = %58, %53, %47, %17, %.outer
  %error.7 = phi i32 [ %error.6, %47 ], [ 22, %17 ], [ 0, %53 ], [ 0, %.outer ], [ 22, %58 ]
  %60 = call i32 @sbuf_finish(%struct.sbuf* %sb) #3
  call void @llvm.lifetime.end(i64 64, i8* %1) #5
  ret i32 %error.7
}

; Function Attrs: noimplicitfloat noredzone
declare %struct.sbuf* @sbuf_new(%struct.sbuf*, i8*, i32, i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i8* @strsep(i8**, i8*) #1

; Function Attrs: noimplicitfloat noredzone
declare i64 @sbuf_len(%struct.sbuf*) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @sbuf_printf(%struct.sbuf*, i8*, ...) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @mac_error_select(i32, i32) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @sbuf_setpos(%struct.sbuf*, i64) #1

; Function Attrs: noimplicitfloat noredzone
declare i32 @sbuf_finish(%struct.sbuf*) #1

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_internalize_label(%struct.label* %label, i8* %string) #0 {
  %element = alloca i8*, align 8
  %element_data = alloca i8*, align 8
  %claimed = alloca i32, align 4
  store i8* %string, i8** %element, align 8
  br label %1

; <label>:1:                                      ; preds = %40, %0
  %2 = call i8* @strsep(i8** %element, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0)) #3
  %3 = icmp eq i8* %2, null
  br i1 %3, label %43, label %4

; <label>:4:                                      ; preds = %1
  store i8* %2, i8** %element_data, align 8
  %5 = call i8* @strsep(i8** %element_data, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str3, i64 0, i64 0)) #3
  %6 = load i8*, i8** %element_data, align 8
  %7 = icmp eq i8* %6, null
  br i1 %7, label %43, label %8

; <label>:8:                                      ; preds = %4
  store i32 0, i32* %claimed, align 4
  %mpc.01 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %9 = icmp eq %struct.mac_policy_conf* %mpc.01, null
  br i1 %9, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %19, %8
  %mpc.03 = phi %struct.mac_policy_conf* [ %mpc.0, %19 ], [ %mpc.01, %8 ]
  %error.12 = phi i32 [ %error.2, %19 ], [ 0, %8 ]
  %10 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.03, i64 0, i32 2
  %11 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %10, align 8
  %12 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %11, i64 0, i32 29
  %13 = load i32 (%struct.label*, i8*, i8*, i32*)*, i32 (%struct.label*, i8*, i8*, i32*)** %12, align 8
  %14 = icmp eq i32 (%struct.label*, i8*, i8*, i32*)* %13, null
  br i1 %14, label %19, label %15

; <label>:15:                                     ; preds = %.lr.ph
  %16 = load i8*, i8** %element_data, align 8
  %17 = call i32 %13(%struct.label* %label, i8* %5, i8* %16, i32* %claimed) #3
  %18 = call i32 @mac_error_select(i32 %17, i32 %error.12) #3
  br label %19

; <label>:19:                                     ; preds = %15, %.lr.ph
  %error.2 = phi i32 [ %18, %15 ], [ %error.12, %.lr.ph ]
  %20 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.03, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %20, align 8
  %21 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %21, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %19, %8
  %error.1.lcssa = phi i32 [ 0, %8 ], [ %error.2, %19 ]
  %22 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %23 = icmp eq %struct.mac_policy_conf* %22, null
  br i1 %23, label %38, label %24

; <label>:24:                                     ; preds = %._crit_edge
  call void @mac_policy_slock_sleep() #3
  %mpc.14 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %25 = icmp eq %struct.mac_policy_conf* %mpc.14, null
  br i1 %25, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %35, %24
  %mpc.16 = phi %struct.mac_policy_conf* [ %mpc.1, %35 ], [ %mpc.14, %24 ]
  %error.35 = phi i32 [ %error.4, %35 ], [ %error.1.lcssa, %24 ]
  %26 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.16, i64 0, i32 2
  %27 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %26, align 8
  %28 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %27, i64 0, i32 29
  %29 = load i32 (%struct.label*, i8*, i8*, i32*)*, i32 (%struct.label*, i8*, i8*, i32*)** %28, align 8
  %30 = icmp eq i32 (%struct.label*, i8*, i8*, i32*)* %29, null
  br i1 %30, label %35, label %31

; <label>:31:                                     ; preds = %.lr.ph8
  %32 = load i8*, i8** %element_data, align 8
  %33 = call i32 %29(%struct.label* %label, i8* %5, i8* %32, i32* %claimed) #3
  %34 = call i32 @mac_error_select(i32 %33, i32 %error.35) #3
  br label %35

; <label>:35:                                     ; preds = %31, %.lr.ph8
  %error.4 = phi i32 [ %34, %31 ], [ %error.35, %.lr.ph8 ]
  %36 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.16, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %36, align 8
  %37 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %37, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %35, %24
  %error.3.lcssa = phi i32 [ %error.1.lcssa, %24 ], [ %error.4, %35 ]
  call void @mac_policy_sunlock_sleep() #3
  br label %38

; <label>:38:                                     ; preds = %._crit_edge9, %._crit_edge
  %error.5 = phi i32 [ %error.1.lcssa, %._crit_edge ], [ %error.3.lcssa, %._crit_edge9 ]
  %39 = icmp eq i32 %error.5, 0
  br i1 %39, label %40, label %43

; <label>:40:                                     ; preds = %38
  %41 = load i32, i32* %claimed, align 4
  %42 = icmp eq i32 %41, 1
  br i1 %42, label %1, label %43

; <label>:43:                                     ; preds = %40, %38, %4, %1
  %error.6 = phi i32 [ %error.5, %38 ], [ 0, %1 ], [ 22, %4 ], [ 22, %40 ]
  ret i32 %error.6
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_copy(%struct.ucred* nocapture %src, %struct.ucred* nocapture %dest) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %1, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %0
  %2 = getelementptr inbounds %struct.ucred, %struct.ucred* %src, i64 0, i32 13
  %3 = getelementptr inbounds %struct.ucred, %struct.ucred* %dest, i64 0, i32 13
  br label %4

; <label>:4:                                      ; preds = %13, %.lr.ph6
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.03, %.lr.ph6 ], [ %mpc.0, %13 ]
  %5 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %6 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %5, align 8
  %7 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %6, i64 0, i32 23
  %8 = load void (%struct.label*, %struct.label*)*, void (%struct.label*, %struct.label*)** %7, align 8
  %9 = icmp eq void (%struct.label*, %struct.label*)* %8, null
  br i1 %9, label %13, label %10

; <label>:10:                                     ; preds = %4
  %11 = load %struct.label*, %struct.label** %2, align 8
  %12 = load %struct.label*, %struct.label** %3, align 8
  call void %8(%struct.label* %11, %struct.label* %12) #3
  br label %13

; <label>:13:                                     ; preds = %10, %4
  %14 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %14, align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %15, label %._crit_edge7, label %4

._crit_edge7:                                     ; preds = %13, %0
  %16 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %16, null
  br i1 %17, label %35, label %18

; <label>:18:                                     ; preds = %._crit_edge7
  %19 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %19) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %20 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %20, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %18
  %21 = getelementptr inbounds %struct.ucred, %struct.ucred* %src, i64 0, i32 13
  %22 = getelementptr inbounds %struct.ucred, %struct.ucred* %dest, i64 0, i32 13
  br label %23

; <label>:23:                                     ; preds = %32, %.lr.ph
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.11, %.lr.ph ], [ %mpc.1, %32 ]
  %24 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %25 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %24, align 8
  %26 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %25, i64 0, i32 23
  %27 = load void (%struct.label*, %struct.label*)*, void (%struct.label*, %struct.label*)** %26, align 8
  %28 = icmp eq void (%struct.label*, %struct.label*)* %27, null
  br i1 %28, label %32, label %29

; <label>:29:                                     ; preds = %23
  %30 = load %struct.label*, %struct.label** %21, align 8
  %31 = load %struct.label*, %struct.label** %22, align 8
  call void %27(%struct.label* %30, %struct.label* %31) #3
  br label %32

; <label>:32:                                     ; preds = %29, %23
  %33 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %33, align 8
  %34 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %34, label %._crit_edge, label %23

._crit_edge:                                      ; preds = %32, %18
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %19) #5
  br label %35

; <label>:35:                                     ; preds = %._crit_edge, %._crit_edge7
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define void @mac_cred_relabel(%struct.ucred* %cred, %struct.label* %newlabel) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.03 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.03, null
  br i1 %1, label %._crit_edge7, label %.lr.ph6

.lr.ph6:                                          ; preds = %8, %0
  %mpc.04 = phi %struct.mac_policy_conf* [ %mpc.0, %8 ], [ %mpc.03, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 30
  %5 = load void (%struct.ucred*, %struct.label*)*, void (%struct.ucred*, %struct.label*)** %4, align 8
  %6 = icmp eq void (%struct.ucred*, %struct.label*)* %5, null
  br i1 %6, label %8, label %7

; <label>:7:                                      ; preds = %.lr.ph6
  call void %5(%struct.ucred* %cred, %struct.label* %newlabel) #3
  br label %8

; <label>:8:                                      ; preds = %7, %.lr.ph6
  %9 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.04, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %9, align 8
  %10 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %10, label %._crit_edge7, label %.lr.ph6

._crit_edge7:                                     ; preds = %8, %0
  %11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %12 = icmp eq %struct.mac_policy_conf* %11, null
  br i1 %12, label %25, label %13

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %14) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %15 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %15, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %22, %13
  %mpc.12 = phi %struct.mac_policy_conf* [ %mpc.1, %22 ], [ %mpc.11, %13 ]
  %16 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 2
  %17 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %16, align 8
  %18 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %17, i64 0, i32 30
  %19 = load void (%struct.ucred*, %struct.label*)*, void (%struct.ucred*, %struct.label*)** %18, align 8
  %20 = icmp eq void (%struct.ucred*, %struct.label*)* %19, null
  br i1 %20, label %22, label %21

; <label>:21:                                     ; preds = %.lr.ph
  call void %19(%struct.ucred* %cred, %struct.label* %newlabel) #3
  br label %22

; <label>:22:                                     ; preds = %21, %.lr.ph
  %23 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.12, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %23, align 8
  %24 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %24, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %22, %13
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %14) #5
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %._crit_edge7
  ret void
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_relabel(%struct.ucred* %cred, %struct.label* %newlabel) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 9
  %5 = load i32 (%struct.ucred*, %struct.label*)*, i32 (%struct.ucred*, %struct.label*)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, %struct.label*)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, %struct.label* %newlabel) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 9
  %21 = load i32 (%struct.ucred*, %struct.label*)*, i32 (%struct.ucred*, %struct.label*)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, %struct.label*)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, %struct.label* %newlabel) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %48, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = ptrtoint %struct.label* %newlabel to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 0, i64 0) #3
  br label %48

; <label>:40:                                     ; preds = %29
  %41 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_relabel_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %40
  %44 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %45 = trunc i64 %41 to i32
  %46 = ptrtoint %struct.ucred* %cred to i64
  %47 = ptrtoint %struct.label* %newlabel to i64
  call void %44(i32 %45, i64 0, i64 %46, i64 %47, i64 0, i64 0) #3
  br label %48

; <label>:48:                                     ; preds = %43, %40, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setuid(%struct.ucred* %cred, i32 %uid) #0 {
  ; CHECK: call void @__tesla_instr{{.*}}_check_setuid
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 13
  %5 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %uid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 13
  %21 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %uid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %48, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %uid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 0, i64 0) #3
  br label %48

; <label>:40:                                     ; preds = %29
  %41 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setuid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %40
  %44 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %45 = trunc i64 %41 to i32
  %46 = ptrtoint %struct.ucred* %cred to i64
  %47 = zext i32 %uid to i64
  call void %44(i32 %45, i64 0, i64 %46, i64 %47, i64 0, i64 0) #3
  br label %48

; <label>:48:                                     ; preds = %43, %40, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_seteuid(%struct.ucred* %cred, i32 %euid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 14
  %5 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %euid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 14
  %21 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %euid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %48, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %euid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 0, i64 0) #3
  br label %48

; <label>:40:                                     ; preds = %29
  %41 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_seteuid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %40
  %44 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %45 = trunc i64 %41 to i32
  %46 = ptrtoint %struct.ucred* %cred to i64
  %47 = zext i32 %euid to i64
  call void %44(i32 %45, i64 0, i64 %46, i64 %47, i64 0, i64 0) #3
  br label %48

; <label>:48:                                     ; preds = %43, %40, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setgid(%struct.ucred* %cred, i32 %gid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 15
  %5 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %gid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 15
  %21 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %gid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %48, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %gid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 0, i64 0) #3
  br label %48

; <label>:40:                                     ; preds = %29
  %41 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %40
  %44 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %45 = trunc i64 %41 to i32
  %46 = ptrtoint %struct.ucred* %cred to i64
  %47 = zext i32 %gid to i64
  call void %44(i32 %45, i64 0, i64 %46, i64 %47, i64 0, i64 0) #3
  br label %48

; <label>:48:                                     ; preds = %43, %40, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setegid(%struct.ucred* %cred, i32 %egid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 16
  %5 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %egid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 16
  %21 = load i32 (%struct.ucred*, i32)*, i32 (%struct.ucred*, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %egid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %48, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %egid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 0, i64 0) #3
  br label %48

; <label>:40:                                     ; preds = %29
  %41 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setegid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %40
  %44 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %45 = trunc i64 %41 to i32
  %46 = ptrtoint %struct.ucred* %cred to i64
  %47 = zext i32 %egid to i64
  call void %44(i32 %45, i64 0, i64 %46, i64 %47, i64 0, i64 0) #3
  br label %48

; <label>:48:                                     ; preds = %43, %40, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setgroups(%struct.ucred* %cred, i32 %ngroups, i32* %gidset) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 17
  %5 = load i32 (%struct.ucred*, i32, i32*)*, i32 (%struct.ucred*, i32, i32*)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32, i32*)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %ngroups, i32* %gidset) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 17
  %21 = load i32 (%struct.ucred*, i32, i32*)*, i32 (%struct.ucred*, i32, i32*)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32, i32*)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %ngroups, i32* %gidset) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %41, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %50, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = sext i32 %ngroups to i64
  %40 = ptrtoint i32* %gidset to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 %40, i64 0) #3
  br label %50

; <label>:41:                                     ; preds = %29
  %42 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setgroups_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %50, label %44

; <label>:44:                                     ; preds = %41
  %45 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %46 = trunc i64 %42 to i32
  %47 = ptrtoint %struct.ucred* %cred to i64
  %48 = sext i32 %ngroups to i64
  %49 = ptrtoint i32* %gidset to i64
  call void %45(i32 %46, i64 0, i64 %47, i64 %48, i64 %49, i64 0) #3
  br label %50

; <label>:50:                                     ; preds = %44, %41, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setreuid(%struct.ucred* %cred, i32 %ruid, i32 %euid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 18
  %5 = load i32 (%struct.ucred*, i32, i32)*, i32 (%struct.ucred*, i32, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %ruid, i32 %euid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 18
  %21 = load i32 (%struct.ucred*, i32, i32)*, i32 (%struct.ucred*, i32, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %ruid, i32 %euid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %41, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %50, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %ruid to i64
  %40 = zext i32 %euid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 %40, i64 0) #3
  br label %50

; <label>:41:                                     ; preds = %29
  %42 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setreuid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %50, label %44

; <label>:44:                                     ; preds = %41
  %45 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %46 = trunc i64 %42 to i32
  %47 = ptrtoint %struct.ucred* %cred to i64
  %48 = zext i32 %ruid to i64
  %49 = zext i32 %euid to i64
  call void %45(i32 %46, i64 0, i64 %47, i64 %48, i64 %49, i64 0) #3
  br label %50

; <label>:50:                                     ; preds = %44, %41, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setregid(%struct.ucred* %cred, i32 %rgid, i32 %egid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 19
  %5 = load i32 (%struct.ucred*, i32, i32)*, i32 (%struct.ucred*, i32, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %rgid, i32 %egid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 19
  %21 = load i32 (%struct.ucred*, i32, i32)*, i32 (%struct.ucred*, i32, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %rgid, i32 %egid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %41, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %50, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %rgid to i64
  %40 = zext i32 %egid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 %40, i64 0) #3
  br label %50

; <label>:41:                                     ; preds = %29
  %42 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setregid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %50, label %44

; <label>:44:                                     ; preds = %41
  %45 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %46 = trunc i64 %42 to i32
  %47 = ptrtoint %struct.ucred* %cred to i64
  %48 = zext i32 %rgid to i64
  %49 = zext i32 %egid to i64
  call void %45(i32 %46, i64 0, i64 %47, i64 %48, i64 %49, i64 0) #3
  br label %50

; <label>:50:                                     ; preds = %44, %41, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setresuid(%struct.ucred* %cred, i32 %ruid, i32 %euid, i32 %suid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 20
  %5 = load i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.ucred*, i32, i32, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32, i32, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %ruid, i32 %euid, i32 %suid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 20
  %21 = load i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.ucred*, i32, i32, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32, i32, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %ruid, i32 %euid, i32 %suid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %42, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %52, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %ruid to i64
  %40 = zext i32 %euid to i64
  %41 = zext i32 %suid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 %40, i64 %41) #3
  br label %52

; <label>:42:                                     ; preds = %29
  %43 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresuid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %52, label %45

; <label>:45:                                     ; preds = %42
  %46 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %47 = trunc i64 %43 to i32
  %48 = ptrtoint %struct.ucred* %cred to i64
  %49 = zext i32 %ruid to i64
  %50 = zext i32 %euid to i64
  %51 = zext i32 %suid to i64
  call void %46(i32 %47, i64 0, i64 %48, i64 %49, i64 %50, i64 %51) #3
  br label %52

; <label>:52:                                     ; preds = %45, %42, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_setresgid(%struct.ucred* %cred, i32 %rgid, i32 %egid, i32 %sgid) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 21
  %5 = load i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.ucred*, i32, i32, i32)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, i32, i32, i32)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cred, i32 %rgid, i32 %egid, i32 %sgid) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 21
  %21 = load i32 (%struct.ucred*, i32, i32, i32)*, i32 (%struct.ucred*, i32, i32, i32)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, i32, i32, i32)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cred, i32 %rgid, i32 %egid, i32 %sgid) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %42, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %52, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cred to i64
  %39 = zext i32 %rgid to i64
  %40 = zext i32 %egid to i64
  %41 = zext i32 %sgid to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 %40, i64 %41) #3
  br label %52

; <label>:42:                                     ; preds = %29
  %43 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_setresgid_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %52, label %45

; <label>:45:                                     ; preds = %42
  %46 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %47 = trunc i64 %43 to i32
  %48 = ptrtoint %struct.ucred* %cred to i64
  %49 = zext i32 %rgid to i64
  %50 = zext i32 %egid to i64
  %51 = zext i32 %sgid to i64
  call void %46(i32 %47, i64 0, i64 %48, i64 %49, i64 %50, i64 %51) #3
  br label %52

; <label>:52:                                     ; preds = %45, %42, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone nounwind ssp
define i32 @mac_cred_check_visible(%struct.ucred* %cr1, %struct.ucred* %cr2) #0 {
  %tracker = alloca %struct.rm_priotracker, align 8
  %mpc.04 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_static_policy_list, i64 0, i32 0), align 8
  %1 = icmp eq %struct.mac_policy_conf* %mpc.04, null
  br i1 %1, label %._crit_edge9, label %.lr.ph8

.lr.ph8:                                          ; preds = %10, %0
  %mpc.06 = phi %struct.mac_policy_conf* [ %mpc.0, %10 ], [ %mpc.04, %0 ]
  %error.05 = phi i32 [ %error.1, %10 ], [ 0, %0 ]
  %2 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 2
  %3 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %2, align 8
  %4 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %3, i64 0, i32 22
  %5 = load i32 (%struct.ucred*, %struct.ucred*)*, i32 (%struct.ucred*, %struct.ucred*)** %4, align 8
  %6 = icmp eq i32 (%struct.ucred*, %struct.ucred*)* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %.lr.ph8
  %8 = call i32 %5(%struct.ucred* %cr1, %struct.ucred* %cr2) #3
  %9 = call i32 @mac_error_select(i32 %8, i32 %error.05) #3
  br label %10

; <label>:10:                                     ; preds = %7, %.lr.ph8
  %error.1 = phi i32 [ %9, %7 ], [ %error.05, %.lr.ph8 ]
  %11 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.06, i64 0, i32 10, i32 0
  %mpc.0 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %11, align 8
  %12 = icmp eq %struct.mac_policy_conf* %mpc.0, null
  br i1 %12, label %._crit_edge9, label %.lr.ph8

._crit_edge9:                                     ; preds = %10, %0
  %error.0.lcssa = phi i32 [ 0, %0 ], [ %error.1, %10 ]
  %13 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %14 = icmp eq %struct.mac_policy_conf* %13, null
  br i1 %14, label %29, label %15

; <label>:15:                                     ; preds = %._crit_edge9
  %16 = bitcast %struct.rm_priotracker* %tracker to i8*
  call void @llvm.lifetime.start(i64 56, i8* %16) #5
  call void @mac_policy_slock_nosleep(%struct.rm_priotracker* %tracker) #3
  %mpc.11 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** getelementptr inbounds (%struct.mac_policy_list_head, %struct.mac_policy_list_head* @mac_policy_list, i64 0, i32 0), align 8
  %17 = icmp eq %struct.mac_policy_conf* %mpc.11, null
  br i1 %17, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %26, %15
  %mpc.13 = phi %struct.mac_policy_conf* [ %mpc.1, %26 ], [ %mpc.11, %15 ]
  %error.22 = phi i32 [ %error.3, %26 ], [ %error.0.lcssa, %15 ]
  %18 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 2
  %19 = load %struct.mac_policy_ops*, %struct.mac_policy_ops** %18, align 8
  %20 = getelementptr inbounds %struct.mac_policy_ops, %struct.mac_policy_ops* %19, i64 0, i32 22
  %21 = load i32 (%struct.ucred*, %struct.ucred*)*, i32 (%struct.ucred*, %struct.ucred*)** %20, align 8
  %22 = icmp eq i32 (%struct.ucred*, %struct.ucred*)* %21, null
  br i1 %22, label %26, label %23

; <label>:23:                                     ; preds = %.lr.ph
  %24 = call i32 %21(%struct.ucred* %cr1, %struct.ucred* %cr2) #3
  %25 = call i32 @mac_error_select(i32 %24, i32 %error.22) #3
  br label %26

; <label>:26:                                     ; preds = %23, %.lr.ph
  %error.3 = phi i32 [ %25, %23 ], [ %error.22, %.lr.ph ]
  %27 = getelementptr inbounds %struct.mac_policy_conf, %struct.mac_policy_conf* %mpc.13, i64 0, i32 10, i32 0
  %mpc.1 = load %struct.mac_policy_conf*, %struct.mac_policy_conf** %27, align 8
  %28 = icmp eq %struct.mac_policy_conf* %mpc.1, null
  br i1 %28, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %26, %15
  %error.2.lcssa = phi i32 [ %error.0.lcssa, %15 ], [ %error.3, %26 ]
  call void @mac_policy_sunlock_nosleep(%struct.rm_priotracker* %tracker) #3
  call void @llvm.lifetime.end(i64 56, i8* %16) #5
  br label %29

; <label>:29:                                     ; preds = %._crit_edge, %._crit_edge9
  %error.4 = phi i32 [ %error.0.lcssa, %._crit_edge9 ], [ %error.2.lcssa, %._crit_edge ]
  %30 = icmp eq i32 %error.4, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_err, i64 0, i32 0, i32 8), align 8
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %48, label %34

; <label>:34:                                     ; preds = %31
  %35 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %36 = trunc i64 %32 to i32
  %37 = sext i32 %error.4 to i64
  %38 = ptrtoint %struct.ucred* %cr1 to i64
  %39 = ptrtoint %struct.ucred* %cr2 to i64
  call void %35(i32 %36, i64 %37, i64 %38, i64 %39, i64 0, i64 0) #3
  br label %48

; <label>:40:                                     ; preds = %29
  %41 = load i64, i64* getelementptr inbounds (<{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>, <{ { i32, i32, %struct.sdt_provider*, %struct.anon.72, %struct.argtype_list_head, i8*, i8*, i8*, i64, i32, [4 x i8] } }>* @sdt_mac_framework_kernel_cred_check_visible_mac_check_ok, i64 0, i32 0, i32 8), align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %48, label %43

; <label>:43:                                     ; preds = %40
  %44 = load void (i32, i64, i64, i64, i64, i64)*, void (i32, i64, i64, i64, i64, i64)** @sdt_probe_func, align 8
  %45 = trunc i64 %41 to i32
  %46 = ptrtoint %struct.ucred* %cr1 to i64
  %47 = ptrtoint %struct.ucred* %cr2 to i64
  call void %44(i32 %45, i64 0, i64 %46, i64 %47, i64 0, i64 0) #3
  br label %48

; <label>:48:                                     ; preds = %43, %40, %34, %31
  ret i32 %error.4
}

; Function Attrs: noimplicitfloat noredzone
declare void @sdt_argtype_deregister(i8*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @sdt_argtype_register(i8*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @sdt_probe_deregister(i8*) #1

; Function Attrs: noimplicitfloat noredzone
declare void @sdt_probe_register(i8*) #1

attributes #0 = { noimplicitfloat noredzone nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noimplicitfloat noredzone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nobuiltin noimplicitfloat noredzone nounwind }
attributes #4 = { nobuiltin noimplicitfloat noredzone }
attributes #5 = { nounwind }
