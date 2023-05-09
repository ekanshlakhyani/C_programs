; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtnl = type { i32, i32 }

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [68 x i8] c"/u6/amosunov/.seashell/projects/Anton-Draft-A3/q1b-point/q1a-rtnl.c\00", align 1
@__PRETTY_FUNCTION__.rtnl_simplify = private unnamed_addr constant [34 x i8] c"void rtnl_simplify(struct rtnl *)\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"r->den != 0\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"den != 0\00", align 1
@__PRETTY_FUNCTION__.rtnl_init = private unnamed_addr constant [32 x i8] c"struct rtnl rtnl_init(int, int)\00", align 1
@__PRETTY_FUNCTION__.rtnl_add = private unnamed_addr constant [63 x i8] c"struct rtnl rtnl_add(const struct rtnl *, const struct rtnl *)\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@__PRETTY_FUNCTION__.rtnl_sub = private unnamed_addr constant [63 x i8] c"struct rtnl rtnl_sub(const struct rtnl *, const struct rtnl *)\00", align 1
@__PRETTY_FUNCTION__.rtnl_mul = private unnamed_addr constant [63 x i8] c"struct rtnl rtnl_mul(const struct rtnl *, const struct rtnl *)\00", align 1
@__PRETTY_FUNCTION__.rtnl_equal = private unnamed_addr constant [59 x i8] c"_Bool rtnl_equal(const struct rtnl *, const struct rtnl *)\00", align 1

; Function Attrs: noinline nounwind optnone
define i32 @gcd(i32 %a, i32 %b) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %temp = alloca i32, align 4
  %r0 = alloca i32, align 4
  %r1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %a.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %b.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %b.addr, align 4
  %sub3 = sub nsw i32 0, %3
  store i32 %sub3, i32* %b.addr, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %4 = load i32, i32* %a.addr, align 4
  %cmp5 = icmp eq i32 %4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %5 = load i32, i32* %b.addr, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  %6 = load i32, i32* %b.addr, align 4
  %cmp8 = icmp eq i32 %6, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  %7 = load i32, i32* %a.addr, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end7
  store i32 0, i32* %temp, align 4
  %8 = load i32, i32* %a.addr, align 4
  store i32 %8, i32* %r0, align 4
  %9 = load i32, i32* %b.addr, align 4
  store i32 %9, i32* %r1, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end10
  %10 = load i32, i32* %r1, align 4
  %cmp11 = icmp ne i32 %10, 0
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load i32, i32* %r1, align 4
  store i32 %11, i32* %temp, align 4
  %12 = load i32, i32* %r0, align 4
  %13 = load i32, i32* %r1, align 4
  %rem = srem i32 %12, %13
  store i32 %rem, i32* %r1, align 4
  %14 = load i32, i32* %temp, align 4
  store i32 %14, i32* %r0, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %15 = load i32, i32* %r0, align 4
  store i32 %15, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then9, %if.then6
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone
define void @rtnl_simplify(%struct.rtnl* %r) #0 {
entry:
  %r.addr = alloca %struct.rtnl*, align 8
  %g = alloca i32, align 4
  store %struct.rtnl* %r, %struct.rtnl** %r.addr, align 8
  %0 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %tobool = icmp ne %struct.rtnl* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 50, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__PRETTY_FUNCTION__.rtnl_simplify, i64 0, i64 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den = getelementptr inbounds %struct.rtnl, %struct.rtnl* %1, i32 0, i32 1
  %2 = load i32, i32* %den, align 4
  %cmp = icmp ne i32 %2, 0
  br i1 %cmp, label %if.then1, label %if.else2

if.then1:                                         ; preds = %if.end
  br label %if.end3

if.else2:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 51, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__PRETTY_FUNCTION__.rtnl_simplify, i64 0, i64 0)) #2
  unreachable

if.end3:                                          ; preds = %if.then1
  %3 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num = getelementptr inbounds %struct.rtnl, %struct.rtnl* %3, i32 0, i32 0
  %4 = load i32, i32* %num, align 4
  %5 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den4 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %5, i32 0, i32 1
  %6 = load i32, i32* %den4, align 4
  %call = call i32 @gcd(i32 %4, i32 %6)
  store i32 %call, i32* %g, align 4
  %7 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num5 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %7, i32 0, i32 0
  %8 = load i32, i32* %num5, align 4
  %9 = load i32, i32* %g, align 4
  %div = sdiv i32 %8, %9
  %10 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num6 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %10, i32 0, i32 0
  store i32 %div, i32* %num6, align 4
  %11 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den7 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %11, i32 0, i32 1
  %12 = load i32, i32* %den7, align 4
  %13 = load i32, i32* %g, align 4
  %div8 = sdiv i32 %12, %13
  %14 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den9 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %14, i32 0, i32 1
  store i32 %div8, i32* %den9, align 4
  %15 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den10 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %15, i32 0, i32 1
  %16 = load i32, i32* %den10, align 4
  %cmp11 = icmp slt i32 %16, 0
  br i1 %cmp11, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.end3
  %17 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num13 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %17, i32 0, i32 0
  %18 = load i32, i32* %num13, align 4
  %mul = mul nsw i32 %18, -1
  store i32 %mul, i32* %num13, align 4
  %19 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den14 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %19, i32 0, i32 1
  %20 = load i32, i32* %den14, align 4
  %sub = sub nsw i32 0, %20
  %21 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den15 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %21, i32 0, i32 1
  store i32 %sub, i32* %den15, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end3
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind optnone
define i64 @rtnl_init(i32 %num, i32 %den) #0 {
entry:
  %retval = alloca %struct.rtnl, align 4
  %num.addr = alloca i32, align 4
  %den.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  store i32 %den, i32* %den.addr, align 4
  %0 = load i32, i32* %den.addr, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 67, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.rtnl_init, i64 0, i64 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %num1 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %retval, i32 0, i32 0
  %1 = load i32, i32* %num.addr, align 4
  store i32 %1, i32* %num1, align 4
  %den2 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %retval, i32 0, i32 1
  %2 = load i32, i32* %den.addr, align 4
  store i32 %2, i32* %den2, align 4
  call void @rtnl_simplify(%struct.rtnl* %retval)
  %3 = bitcast %struct.rtnl* %retval to i64*
  %4 = load i64, i64* %3, align 4
  ret i64 %4
}

; Function Attrs: noinline nounwind optnone
define i64 @rtnl_add(%struct.rtnl* %r, %struct.rtnl* %s) #0 {
entry:
  %retval = alloca %struct.rtnl, align 4
  %r.addr = alloca %struct.rtnl*, align 8
  %s.addr = alloca %struct.rtnl*, align 8
  %result_num = alloca i32, align 4
  %result_den = alloca i32, align 4
  store %struct.rtnl* %r, %struct.rtnl** %r.addr, align 8
  store %struct.rtnl* %s, %struct.rtnl** %s.addr, align 8
  %0 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %tobool = icmp ne %struct.rtnl* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 77, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.rtnl_add, i64 0, i64 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %tobool1 = icmp ne %struct.rtnl* %1, null
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 78, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.rtnl_add, i64 0, i64 0)) #2
  unreachable

if.end4:                                          ; preds = %if.then2
  %2 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num = getelementptr inbounds %struct.rtnl, %struct.rtnl* %2, i32 0, i32 0
  %3 = load i32, i32* %num, align 4
  %4 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %den = getelementptr inbounds %struct.rtnl, %struct.rtnl* %4, i32 0, i32 1
  %5 = load i32, i32* %den, align 4
  %mul = mul nsw i32 %3, %5
  %6 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den5 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %6, i32 0, i32 1
  %7 = load i32, i32* %den5, align 4
  %8 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %num6 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %8, i32 0, i32 0
  %9 = load i32, i32* %num6, align 4
  %mul7 = mul nsw i32 %7, %9
  %add = add nsw i32 %mul, %mul7
  store i32 %add, i32* %result_num, align 4
  %10 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den8 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %10, i32 0, i32 1
  %11 = load i32, i32* %den8, align 4
  %12 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %den9 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %12, i32 0, i32 1
  %13 = load i32, i32* %den9, align 4
  %mul10 = mul nsw i32 %11, %13
  store i32 %mul10, i32* %result_den, align 4
  %14 = load i32, i32* %result_num, align 4
  %15 = load i32, i32* %result_den, align 4
  %call = call i64 @rtnl_init(i32 %14, i32 %15)
  %16 = bitcast %struct.rtnl* %retval to i64*
  store i64 %call, i64* %16, align 4
  %17 = bitcast %struct.rtnl* %retval to i64*
  %18 = load i64, i64* %17, align 4
  ret i64 %18
}

; Function Attrs: noinline nounwind optnone
define i64 @rtnl_sub(%struct.rtnl* %r, %struct.rtnl* %s) #0 {
entry:
  %retval = alloca %struct.rtnl, align 4
  %r.addr = alloca %struct.rtnl*, align 8
  %s.addr = alloca %struct.rtnl*, align 8
  %result_num = alloca i32, align 4
  %result_den = alloca i32, align 4
  store %struct.rtnl* %r, %struct.rtnl** %r.addr, align 8
  store %struct.rtnl* %s, %struct.rtnl** %s.addr, align 8
  %0 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %tobool = icmp ne %struct.rtnl* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 88, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.rtnl_sub, i64 0, i64 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %tobool1 = icmp ne %struct.rtnl* %1, null
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 89, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.rtnl_sub, i64 0, i64 0)) #2
  unreachable

if.end4:                                          ; preds = %if.then2
  %2 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num = getelementptr inbounds %struct.rtnl, %struct.rtnl* %2, i32 0, i32 0
  %3 = load i32, i32* %num, align 4
  %4 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %den = getelementptr inbounds %struct.rtnl, %struct.rtnl* %4, i32 0, i32 1
  %5 = load i32, i32* %den, align 4
  %mul = mul nsw i32 %3, %5
  %6 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den5 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %6, i32 0, i32 1
  %7 = load i32, i32* %den5, align 4
  %8 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %num6 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %8, i32 0, i32 0
  %9 = load i32, i32* %num6, align 4
  %mul7 = mul nsw i32 %7, %9
  %sub = sub nsw i32 %mul, %mul7
  store i32 %sub, i32* %result_num, align 4
  %10 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den8 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %10, i32 0, i32 1
  %11 = load i32, i32* %den8, align 4
  %12 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %den9 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %12, i32 0, i32 1
  %13 = load i32, i32* %den9, align 4
  %mul10 = mul nsw i32 %11, %13
  store i32 %mul10, i32* %result_den, align 4
  %14 = load i32, i32* %result_num, align 4
  %15 = load i32, i32* %result_den, align 4
  %call = call i64 @rtnl_init(i32 %14, i32 %15)
  %16 = bitcast %struct.rtnl* %retval to i64*
  store i64 %call, i64* %16, align 4
  %17 = bitcast %struct.rtnl* %retval to i64*
  %18 = load i64, i64* %17, align 4
  ret i64 %18
}

; Function Attrs: noinline nounwind optnone
define i64 @rtnl_mul(%struct.rtnl* %r, %struct.rtnl* %s) #0 {
entry:
  %retval = alloca %struct.rtnl, align 4
  %r.addr = alloca %struct.rtnl*, align 8
  %s.addr = alloca %struct.rtnl*, align 8
  %result_num = alloca i32, align 4
  %result_den = alloca i32, align 4
  store %struct.rtnl* %r, %struct.rtnl** %r.addr, align 8
  store %struct.rtnl* %s, %struct.rtnl** %s.addr, align 8
  %0 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %tobool = icmp ne %struct.rtnl* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 99, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.rtnl_mul, i64 0, i64 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %tobool1 = icmp ne %struct.rtnl* %1, null
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 100, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.rtnl_mul, i64 0, i64 0)) #2
  unreachable

if.end4:                                          ; preds = %if.then2
  %2 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num = getelementptr inbounds %struct.rtnl, %struct.rtnl* %2, i32 0, i32 0
  %3 = load i32, i32* %num, align 4
  %4 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %num5 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %4, i32 0, i32 0
  %5 = load i32, i32* %num5, align 4
  %mul = mul nsw i32 %3, %5
  store i32 %mul, i32* %result_num, align 4
  %6 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den = getelementptr inbounds %struct.rtnl, %struct.rtnl* %6, i32 0, i32 1
  %7 = load i32, i32* %den, align 4
  %8 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %den6 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %8, i32 0, i32 1
  %9 = load i32, i32* %den6, align 4
  %mul7 = mul nsw i32 %7, %9
  store i32 %mul7, i32* %result_den, align 4
  %10 = load i32, i32* %result_num, align 4
  %11 = load i32, i32* %result_den, align 4
  %call = call i64 @rtnl_init(i32 %10, i32 %11)
  %12 = bitcast %struct.rtnl* %retval to i64*
  store i64 %call, i64* %12, align 4
  %13 = bitcast %struct.rtnl* %retval to i64*
  %14 = load i64, i64* %13, align 4
  ret i64 %14
}

; Function Attrs: noinline nounwind optnone
define zeroext i1 @rtnl_equal(%struct.rtnl* %r, %struct.rtnl* %s) #0 {
entry:
  %r.addr = alloca %struct.rtnl*, align 8
  %s.addr = alloca %struct.rtnl*, align 8
  %r_red = alloca %struct.rtnl, align 4
  %s_red = alloca %struct.rtnl, align 4
  store %struct.rtnl* %r, %struct.rtnl** %r.addr, align 8
  store %struct.rtnl* %s, %struct.rtnl** %s.addr, align 8
  %0 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %tobool = icmp ne %struct.rtnl* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %if.end

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 112, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.rtnl_equal, i64 0, i64 0)) #2
  unreachable

if.end:                                           ; preds = %if.then
  %1 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %tobool1 = icmp ne %struct.rtnl* %1, null
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.end
  br label %if.end4

if.else3:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.1, i64 0, i64 0), i32 113, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__PRETTY_FUNCTION__.rtnl_equal, i64 0, i64 0)) #2
  unreachable

if.end4:                                          ; preds = %if.then2
  %2 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %num = getelementptr inbounds %struct.rtnl, %struct.rtnl* %2, i32 0, i32 0
  %3 = load i32, i32* %num, align 4
  %4 = load %struct.rtnl*, %struct.rtnl** %r.addr, align 8
  %den = getelementptr inbounds %struct.rtnl, %struct.rtnl* %4, i32 0, i32 1
  %5 = load i32, i32* %den, align 4
  %call = call i64 @rtnl_init(i32 %3, i32 %5)
  %6 = bitcast %struct.rtnl* %r_red to i64*
  store i64 %call, i64* %6, align 4
  %7 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %num5 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %7, i32 0, i32 0
  %8 = load i32, i32* %num5, align 4
  %9 = load %struct.rtnl*, %struct.rtnl** %s.addr, align 8
  %den6 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %9, i32 0, i32 1
  %10 = load i32, i32* %den6, align 4
  %call7 = call i64 @rtnl_init(i32 %8, i32 %10)
  %11 = bitcast %struct.rtnl* %s_red to i64*
  store i64 %call7, i64* %11, align 4
  %num8 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %r_red, i32 0, i32 0
  %12 = load i32, i32* %num8, align 4
  %num9 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %s_red, i32 0, i32 0
  %13 = load i32, i32* %num9, align 4
  %cmp = icmp eq i32 %12, %13
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end4
  %den10 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %r_red, i32 0, i32 1
  %14 = load i32, i32* %den10, align 4
  %den11 = getelementptr inbounds %struct.rtnl, %struct.rtnl* %s_red, i32 0, i32 1
  %15 = load i32, i32* %den11, align 4
  %cmp12 = icmp eq i32 %14, %15
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end4
  %16 = phi i1 [ false, %if.end4 ], [ %cmp12, %land.rhs ]
  ret i1 %16
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.1 (https://github.com/llvm/llvm-project.git c1a0a213378a458fbea1a5c77b315c7dce08fd05)"}
!1 = !{i32 1, !"wchar_size", i32 4}
