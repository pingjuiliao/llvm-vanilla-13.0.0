; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu < %s | FileCheck %s

define <vscale x 16 x i8> @insr_zpr_only_nxv16i8(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b) #0 {
; CHECK-LABEL: insr_zpr_only_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    insr z0.b, b1
; CHECK-NEXT:    ret
  %t0 = extractelement <vscale x 16 x i8> %b, i64 0
  %t1 = tail call <vscale x 16 x i8> @llvm.aarch64.sve.insr.nxv16i8(<vscale x 16 x i8> %a, i8 %t0)
  ret <vscale x 16 x i8> %t1
}

define <vscale x 8 x i16> @insr_zpr_only_nxv8i16(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b) #0 {
; CHECK-LABEL: insr_zpr_only_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    insr z0.h, h1
; CHECK-NEXT:    ret
  %t0 = extractelement <vscale x 8 x i16> %b, i64 0
  %t1 = tail call <vscale x 8 x i16> @llvm.aarch64.sve.insr.nxv8i16(<vscale x 8 x i16> %a, i16 %t0)
  ret <vscale x 8 x i16> %t1
}

define <vscale x 4 x i32> @insr_zpr_only_nxv4i32(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b) #0 {
; CHECK-LABEL: insr_zpr_only_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    insr z0.s, s1
; CHECK-NEXT:    ret
  %t0 = extractelement <vscale x 4 x i32> %b, i64 0
  %t1 = tail call <vscale x 4 x i32> @llvm.aarch64.sve.insr.nxv4i32(<vscale x 4 x i32> %a, i32 %t0)
  ret <vscale x 4 x i32> %t1
}

define <vscale x 2 x i64> @insr_zpr_only_nxv2i64(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b) #0 {
; CHECK-LABEL: insr_zpr_only_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    insr z0.d, d1
; CHECK-NEXT:    ret
  %t0 = extractelement <vscale x 2 x i64> %b, i64 0
  %t1 = tail call <vscale x 2 x i64> @llvm.aarch64.sve.insr.nxv2i64(<vscale x 2 x i64> %a, i64 %t0)
  ret <vscale x 2 x i64> %t1
}

declare <vscale x 16 x i8> @llvm.aarch64.sve.insr.nxv16i8(<vscale x 16 x i8>, i8)
declare <vscale x 8 x i16> @llvm.aarch64.sve.insr.nxv8i16(<vscale x 8 x i16>, i16)
declare <vscale x 4 x i32> @llvm.aarch64.sve.insr.nxv4i32(<vscale x 4 x i32>, i32)
declare <vscale x 2 x i64> @llvm.aarch64.sve.insr.nxv2i64(<vscale x 2 x i64>, i64)

attributes #0 = { "target-features"="+sve" }