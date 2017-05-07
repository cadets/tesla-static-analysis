; Commands for llvm-lit:
; RUN: tesla instrument -S -tesla-manifest %p/tesla.manifest %s -o %t
; RUN: %filecheck -input-file=%t %s

; ModuleID = 'caller.bc'
source_filename = "caller.bc"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd11.0"

%struct.DES_ks = type { [16 x %union.anon] }
%union.anon = type { [2 x i32] }

; CHECK: define i32 @crypto_setup
define i32 @crypto_setup([8 x i8]* %key, %struct.DES_ks* %schedule) {
entry:
  %key.addr = alloca [8 x i8]*, align 8
  %schedule.addr = alloca %struct.DES_ks*, align 8
  store [8 x i8]* %key, [8 x i8]** %key.addr, align 8
  store %struct.DES_ks* %schedule, %struct.DES_ks** %schedule.addr, align 8
  %0 = load [8 x i8]*, [8 x i8]** %key.addr, align 8
  %1 = load %struct.DES_ks*, %struct.DES_ks** %schedule.addr, align 8

  ; The 'DES_set_key' function should only be instrumented on exit.
  ; CHECK-NOT: call void @__tesla_instrumentation_caller_enter_DES_set_key
  %call = call i32 @DES_set_key([8 x i8]* %0, %struct.DES_ks* %1)
  ; CHECK: call void @__tesla_instrumentation_caller_return_DES_set_key

  ret i32 0
}

declare i32 @DES_set_key([8 x i8]*, %struct.DES_ks*)

; We should define the caller-side instrumentation for functions that we call
; in this module. This instrumentation should have private linkage.

; CHECK-NOT: define{{.*}} void @__tesla_instrumentation_caller_enter_DES_set_key
; CHECK: define private void @__tesla_instrumentation_caller_return_DES_set_key
; CHECK: call void @tesla_update_state
; CHECK-NOT: define{{.*}} void @__tesla_instrumentation_caller_enter_DES_set_key
