; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@facing = internal global i32 1, align 4
@pos_x = internal global i32 0, align 4
@pos_y = internal global i32 0, align 4
@beacon_down = internal global i8 0, align 1
@beacon_x = internal global i32 0, align 4
@beacon_y = internal global i32 0, align 4
@min_x = internal global i32 0, align 4
@max_x = internal global i32 0, align 4
@min_y = internal global i32 0, align 4
@max_y = internal global i32 0, align 4
@.str = private unnamed_addr constant [25 x i8] c"ERROR: invalid distance\0A\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"ERROR: beacon already placed\0A\00", align 1
@.str.2 = private unnamed_addr constant [53 x i8] c"ERROR: beacon is not placed or not at this location\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"robot is at (%d,%d) and is facing \00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"north\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"south\0A\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"east\0A\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"west\0A\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"the distance to the beacon is: %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [37 x i8] c"the bounding box is (%d,%d)-(%d,%d)\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define void @robot_reset() #0 {
entry:
  store i32 1, i32* @facing, align 4
  store i32 0, i32* @pos_x, align 4
  store i32 0, i32* @pos_y, align 4
  store i8 0, i8* @beacon_down, align 1
  store i32 0, i32* @beacon_x, align 4
  store i32 0, i32* @beacon_y, align 4
  store i32 0, i32* @min_x, align 4
  store i32 0, i32* @max_x, align 4
  store i32 0, i32* @min_y, align 4
  store i32 0, i32* @max_y, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @robot_forward(i32 %distance) #0 {
entry:
  %distance.addr = alloca i32, align 4
  store i32 %distance, i32* %distance.addr, align 4
  %0 = load i32, i32* %distance.addr, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0))
  br label %if.end25

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @facing, align 4
  %cmp1 = icmp eq i32 %1, 1
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %distance.addr, align 4
  %3 = load i32, i32* @pos_y, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* @pos_y, align 4
  br label %if.end13

if.else:                                          ; preds = %if.end
  %4 = load i32, i32* @facing, align 4
  %cmp3 = icmp eq i32 %4, 3
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  %5 = load i32, i32* %distance.addr, align 4
  %6 = load i32, i32* @pos_y, align 4
  %sub = sub nsw i32 %6, %5
  store i32 %sub, i32* @pos_y, align 4
  br label %if.end12

if.else5:                                         ; preds = %if.else
  %7 = load i32, i32* @facing, align 4
  %cmp6 = icmp eq i32 %7, 2
  br i1 %cmp6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.else5
  %8 = load i32, i32* %distance.addr, align 4
  %9 = load i32, i32* @pos_x, align 4
  %add8 = add nsw i32 %9, %8
  store i32 %add8, i32* @pos_x, align 4
  br label %if.end11

if.else9:                                         ; preds = %if.else5
  %10 = load i32, i32* %distance.addr, align 4
  %11 = load i32, i32* @pos_x, align 4
  %sub10 = sub nsw i32 %11, %10
  store i32 %sub10, i32* @pos_x, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.else9, %if.then7
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then4
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then2
  %12 = load i32, i32* @pos_x, align 4
  %13 = load i32, i32* @min_x, align 4
  %cmp14 = icmp slt i32 %12, %13
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %14 = load i32, i32* @pos_x, align 4
  store i32 %14, i32* @min_x, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %15 = load i32, i32* @pos_y, align 4
  %16 = load i32, i32* @min_y, align 4
  %cmp17 = icmp slt i32 %15, %16
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end16
  %17 = load i32, i32* @pos_y, align 4
  store i32 %17, i32* @min_y, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end16
  %18 = load i32, i32* @pos_x, align 4
  %19 = load i32, i32* @max_x, align 4
  %cmp20 = icmp sgt i32 %18, %19
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  %20 = load i32, i32* @pos_x, align 4
  store i32 %20, i32* @max_x, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  %21 = load i32, i32* @pos_y, align 4
  %22 = load i32, i32* @max_y, align 4
  %cmp23 = icmp sgt i32 %21, %22
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end22
  %23 = load i32, i32* @pos_y, align 4
  store i32 %23, i32* @max_y, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then, %if.then24, %if.end22
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone
define void @robot_left() #0 {
entry:
  %0 = load i32, i32* @facing, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 4, i32* @facing, align 4
  br label %if.end8

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @facing, align 4
  %cmp1 = icmp eq i32 %1, 4
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 3, i32* @facing, align 4
  br label %if.end7

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* @facing, align 4
  %cmp4 = icmp eq i32 %2, 3
  br i1 %cmp4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else3
  store i32 2, i32* @facing, align 4
  br label %if.end

if.else6:                                         ; preds = %if.else3
  store i32 1, i32* @facing, align 4
  br label %if.end

if.end:                                           ; preds = %if.else6, %if.then5
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then2
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @robot_right() #0 {
entry:
  call void @robot_left()
  call void @robot_left()
  call void @robot_left()
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @robot_drop() #0 {
entry:
  %0 = load i8, i8* @beacon_down, align 1
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %entry
  store i8 1, i8* @beacon_down, align 1
  %1 = load i32, i32* @pos_x, align 4
  store i32 %1, i32* @beacon_x, align 4
  %2 = load i32, i32* @pos_y, align 4
  store i32 %2, i32* @beacon_y, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @robot_pickup() #0 {
entry:
  %0 = load i8, i8* @beacon_down, align 1
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @beacon_x, align 4
  %2 = load i32, i32* @pos_x, align 4
  %cmp = icmp ne i32 %1, %2
  br i1 %cmp, label %if.then, label %lor.lhs.false1

lor.lhs.false1:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* @beacon_y, align 4
  %4 = load i32, i32* @pos_y, align 4
  %cmp2 = icmp ne i32 %3, %4
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false1, %lor.lhs.false, %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.2, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false1
  store i8 0, i8* @beacon_down, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @robot_status() #0 {
entry:
  %0 = load i32, i32* @pos_x, align 4
  %1 = load i32, i32* @pos_y, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i32 %0, i32 %1)
  %2 = load i32, i32* @facing, align 4
  %cmp = icmp eq i32 %2, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0))
  br label %if.end15

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @facing, align 4
  %cmp2 = icmp eq i32 %3, 3
  br i1 %cmp2, label %if.then3, label %if.else5

if.then3:                                         ; preds = %if.else
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0))
  br label %if.end14

if.else5:                                         ; preds = %if.else
  %4 = load i32, i32* @facing, align 4
  %cmp6 = icmp eq i32 %4, 2
  br i1 %cmp6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.else5
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0))
  br label %if.end13

if.else9:                                         ; preds = %if.else5
  %5 = load i32, i32* @facing, align 4
  %cmp10 = icmp eq i32 %5, 4
  br i1 %cmp10, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.else9
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.then11, %if.else9
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then7
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.then3
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then
  %6 = load i8, i8* @beacon_down, align 1
  %tobool = trunc i8 %6 to i1
  br i1 %tobool, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end15
  %7 = load i32, i32* @pos_x, align 4
  store i32 %7, i32* @beacon_x, align 4
  %8 = load i32, i32* @pos_y, align 4
  store i32 %8, i32* @beacon_y, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %if.end15
  %9 = load i32, i32* @pos_x, align 4
  %10 = load i32, i32* @beacon_x, align 4
  %sub = sub nsw i32 %9, %10
  %call18 = call i32 @abs(i32 %sub) #3
  %11 = load i32, i32* @pos_y, align 4
  %12 = load i32, i32* @beacon_y, align 4
  %sub19 = sub nsw i32 %11, %12
  %call20 = call i32 @abs(i32 %sub19) #3
  %add = add nsw i32 %call18, %call20
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8, i64 0, i64 0), i32 %add)
  %13 = load i32, i32* @min_x, align 4
  %14 = load i32, i32* @min_y, align 4
  %15 = load i32, i32* @max_x, align 4
  %16 = load i32, i32* @max_y, align 4
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.9, i64 0, i64 0), i32 %13, i32 %14, i32 %15, i32 %16)
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
