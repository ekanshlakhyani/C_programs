; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@EPSILON = constant double 1.000000e-03, align 8

; Function Attrs: noinline nounwind optnone
define zeroext i1 @is_almost_equal(double %value, double %target) #0 {
entry:
  %value.addr = alloca double, align 8
  %target.addr = alloca double, align 8
  store double %value, double* %value.addr, align 8
  store double %target, double* %target.addr, align 8
  %0 = load double, double* %value.addr, align 8
  %1 = load double, double* %target.addr, align 8
  %sub = fsub double %0, %1
  %2 = call double @llvm.fabs.f64(double %sub)
  %cmp = fcmp olt double %2, 1.000000e-03
  ret i1 %cmp
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.fabs.f64(double) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
