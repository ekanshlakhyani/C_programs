; ModuleID = 'seashell-compiler-output'
source_filename = "seashell-compiler-output"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sequence = type opaque

@seqs = common global [26 x %struct.sequence*] zeroinitializer, align 16
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@readseq = internal global [1024 x i8] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [48 x i8] c"Error: Could not read in sequence ID (e.g., a)\0A\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Error: Invalid sequence: [%s]\0A\00", align 1
@count_map = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [28 x i8] c"error: too many functions!\0A\00", align 1
@fname_map = internal global [1024 x [1024 x i8]] zeroinitializer, align 16
@f_map = internal global [1024 x i32 (i32)*] zeroinitializer, align 16
@count_filter = internal global i32 0, align 4
@fname_filter = internal global [1024 x [1024 x i8]] zeroinitializer, align 16
@f_filter = internal global [1024 x i1 (i32)*] zeroinitializer, align 16
@count_foldl = internal global i32 0, align 4
@fname_foldl = internal global [1024 x [1024 x i8]] zeroinitializer, align 16
@f_foldl = internal global [1024 x i32 (i32, i32)*] zeroinitializer, align 16
@num = internal global [1024 x i8] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [29 x i8] c"error reading function name\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"invalid function: [%s]\0A\00", align 1
@cmd = internal global [1024 x i8] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [5 x i8] c"quit\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"read\00", align 1
@.str.8 = private unnamed_addr constant [19 x i8] c"Error during read\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"end\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.11 = private unnamed_addr constant [24 x i8] c"Error during read [%s]\0A\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"print\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"addone\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"equal\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"addsum\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"avgvar\00", align 1
@.str.19 = private unnamed_addr constant [27 x i8] c"average: %d, variance: %d\0A\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"map\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c"filter\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"foldl\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.24 = private unnamed_addr constant [6 x i8] c"build\00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c"Invalid command [%s]\0A\00", align 1
@.str.26 = private unnamed_addr constant [22 x i8] c"Error reading number\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define i32 @get_seq_id() #0 {
entry:
  %retval1 = alloca i32, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @readseq, i32 0, i32 0))
  store i32 %call, i32* %retval1, align 4
  %0 = load i32, i32* %retval1, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %call3 = call i64 @strlen(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @readseq, i32 0, i32 0)) #6
  %cmp4 = icmp eq i64 %call3, 1
  br i1 %cmp4, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end
  %1 = load i8, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @readseq, i64 0, i64 0), align 16
  %conv = sext i8 %1 to i32
  %cmp5 = icmp sge i32 %conv, 97
  br i1 %cmp5, label %land.lhs.true7, label %if.end13

land.lhs.true7:                                   ; preds = %land.lhs.true
  %2 = load i8, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @readseq, i64 0, i64 0), align 16
  %conv8 = sext i8 %2 to i32
  %cmp9 = icmp slt i32 %conv8, 123
  br i1 %cmp9, label %if.then11, label %if.end13

if.then11:                                        ; preds = %land.lhs.true7
  %3 = load i8, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @readseq, i64 0, i64 0), align 16
  %conv12 = sext i8 %3 to i32
  %sub = sub nsw i32 %conv12, 97
  ret i32 %sub

if.end13:                                         ; preds = %land.lhs.true7, %land.lhs.true, %if.end
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @readseq, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable
}

declare i32 @__isoc99_scanf(i8*, ...) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: noinline nounwind optnone
define void @add_map_fn(i8* %name, i32 (i32)* %f) #0 {
entry:
  %name.addr = alloca i8*, align 8
  %f.addr = alloca i32 (i32)*, align 8
  store i8* %name, i8** %name.addr, align 8
  store i32 (i32)* %f, i32 (i32)** %f.addr, align 8
  %0 = load i32, i32* @count_map, align 4
  %cmp = icmp eq i32 %0, 1024
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @count_map, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i8]], [1024 x [1024 x i8]]* @fname_map, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name.addr, align 8
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %2) #7
  %3 = load i32 (i32)*, i32 (i32)** %f.addr, align 8
  %4 = load i32, i32* @count_map, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [1024 x i32 (i32)*], [1024 x i32 (i32)*]* @f_map, i64 0, i64 %idxprom2
  store i32 (i32)* %3, i32 (i32)** %arrayidx3, align 8
  %5 = load i32, i32* @count_map, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @count_map, align 4
  ret void
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

; Function Attrs: noinline nounwind optnone
define void @add_filter_fn(i8* %name, i1 (i32)* %f) #0 {
entry:
  %name.addr = alloca i8*, align 8
  %f.addr = alloca i1 (i32)*, align 8
  store i8* %name, i8** %name.addr, align 8
  store i1 (i32)* %f, i1 (i32)** %f.addr, align 8
  %0 = load i32, i32* @count_filter, align 4
  %cmp = icmp eq i32 %0, 1024
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @count_filter, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i8]], [1024 x [1024 x i8]]* @fname_filter, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name.addr, align 8
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %2) #7
  %3 = load i1 (i32)*, i1 (i32)** %f.addr, align 8
  %4 = load i32, i32* @count_filter, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [1024 x i1 (i32)*], [1024 x i1 (i32)*]* @f_filter, i64 0, i64 %idxprom2
  store i1 (i32)* %3, i1 (i32)** %arrayidx3, align 8
  %5 = load i32, i32* @count_filter, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @count_filter, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define void @add_foldl_fn(i8* %name, i32 (i32, i32)* %f) #0 {
entry:
  %name.addr = alloca i8*, align 8
  %f.addr = alloca i32 (i32, i32)*, align 8
  store i8* %name, i8** %name.addr, align 8
  store i32 (i32, i32)* %f, i32 (i32, i32)** %f.addr, align 8
  %0 = load i32, i32* @count_foldl, align 4
  %cmp = icmp eq i32 %0, 1024
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @count_foldl, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i8]], [1024 x [1024 x i8]]* @fname_foldl, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %name.addr, align 8
  %call1 = call i8* @strcpy(i8* %arraydecay, i8* %2) #7
  %3 = load i32 (i32, i32)*, i32 (i32, i32)** %f.addr, align 8
  %4 = load i32, i32* @count_foldl, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [1024 x i32 (i32, i32)*], [1024 x i32 (i32, i32)*]* @f_foldl, i64 0, i64 %idxprom2
  store i32 (i32, i32)* %3, i32 (i32, i32)** %arrayidx3, align 8
  %5 = load i32, i32* @count_foldl, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @count_foldl, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone
define i32 @getfunc([1024 x i8]* %names, i32 %count) #0 {
entry:
  %names.addr = alloca [1024 x i8]*, align 8
  %count.addr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %i = alloca i32, align 4
  store [1024 x i8]* %names, [1024 x i8]** %names.addr, align 8
  store i32 %count, i32* %count.addr, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0))
  store i32 %call, i32* %retval1, align 4
  %0 = load i32, i32* %retval1, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %count.addr, align 4
  %cmp3 = icmp slt i32 %1, %2
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load [1024 x i8]*, [1024 x i8]** %names.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 %idxprom
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %arrayidx, i32 0, i32 0
  %call4 = call i32 @strcmp(i8* %arraydecay, i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0)) #6
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  ret i32 %5

if.end7:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

; Function Attrs: noinline nounwind optnone
define void @sequence_io_test() #0 {
entry:
  %s = alloca %struct.sequence*, align 8
  %s2 = alloca %struct.sequence*, align 8
  %i = alloca i32, align 4
  %retval = alloca i32, align 4
  %readnum = alloca i32, align 4
  %avg = alloca i32, align 4
  %var = alloca i32, align 4
  %func_id = alloca i32, align 4
  %base = alloca i32, align 4
  %id = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 26
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call %struct.sequence* @sequence_create()
  %1 = load i32, i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [26 x %struct.sequence*], [26 x %struct.sequence*]* @seqs, i64 0, i64 %idxprom
  store %struct.sequence* %call, %struct.sequence** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %while.body

while.body:                                       ; preds = %for.end, %if.end107
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0))
  store i32 %call1, i32* %retval, align 4
  %3 = load i32, i32* %retval, align 4
  %cmp2 = icmp ne i32 %3, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %return

if.end:                                           ; preds = %while.body
  %call3 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0)) #6
  %cmp4 = icmp eq i32 %call3, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  br label %return

if.end6:                                          ; preds = %if.end
  %call7 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0)) #6
  %cmp8 = icmp eq i32 %call7, 0
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end6
  %call10 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call10, %struct.sequence** %s, align 8
  %4 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_clear(%struct.sequence* %4)
  br label %while.body12

while.body12:                                     ; preds = %if.then9, %if.end26
  %call13 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0))
  store i32 %call13, i32* %retval, align 4
  %5 = load i32, i32* %retval, align 4
  %cmp14 = icmp ne i32 %5, 1
  br i1 %cmp14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %while.body12
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.8, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end17:                                         ; preds = %while.body12
  %call18 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0)) #6
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end17
  br label %while.end

if.end21:                                         ; preds = %if.end17
  %call22 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32* %readnum) #7
  store i32 %call22, i32* %retval, align 4
  %6 = load i32, i32* %retval, align 4
  %cmp23 = icmp ne i32 %6, 1
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.end21
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @num, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end26:                                         ; preds = %if.end21
  %7 = load %struct.sequence*, %struct.sequence** %s, align 8
  %8 = load %struct.sequence*, %struct.sequence** %s, align 8
  %call27 = call i32 @sequence_length(%struct.sequence* %8)
  %9 = load i32, i32* %readnum, align 4
  call void @sequence_insert_at(%struct.sequence* %7, i32 %call27, i32 %9)
  br label %while.body12

while.end:                                        ; preds = %if.then20
  br label %if.end107

if.else:                                          ; preds = %if.end6
  %call28 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0)) #6
  %cmp29 = icmp eq i32 %call28, 0
  br i1 %cmp29, label %if.then30, label %if.else32

if.then30:                                        ; preds = %if.else
  %call31 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call31, %struct.sequence** %s, align 8
  %10 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_print(%struct.sequence* %10)
  br label %if.end106

if.else32:                                        ; preds = %if.else
  %call33 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0)) #6
  %cmp34 = icmp eq i32 %call33, 0
  br i1 %cmp34, label %if.then35, label %if.else37

if.then35:                                        ; preds = %if.else32
  %call36 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call36, %struct.sequence** %s, align 8
  %11 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_add_one(%struct.sequence* %11)
  br label %if.end105

if.else37:                                        ; preds = %if.else32
  %call38 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0)) #6
  %cmp39 = icmp eq i32 %call38, 0
  br i1 %cmp39, label %if.then40, label %if.else49

if.then40:                                        ; preds = %if.else37
  %call41 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call41, %struct.sequence** %s, align 8
  %call42 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call42, %struct.sequence** %s2, align 8
  %12 = load %struct.sequence*, %struct.sequence** %s, align 8
  %13 = load %struct.sequence*, %struct.sequence** %s2, align 8
  %call43 = call zeroext i1 @sequence_equal(%struct.sequence* %12, %struct.sequence* %13)
  br i1 %call43, label %if.then44, label %if.else46

if.then44:                                        ; preds = %if.then40
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0))
  br label %if.end48

if.else46:                                        ; preds = %if.then40
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i32 0, i32 0))
  br label %if.end48

if.end48:                                         ; preds = %if.else46, %if.then44
  br label %if.end104

if.else49:                                        ; preds = %if.else37
  %call50 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i32 0, i32 0)) #6
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %if.then52, label %if.else54

if.then52:                                        ; preds = %if.else49
  %call53 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call53, %struct.sequence** %s, align 8
  %14 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_add_sum(%struct.sequence* %14)
  br label %if.end103

if.else54:                                        ; preds = %if.else49
  %call55 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.18, i32 0, i32 0)) #6
  %cmp56 = icmp eq i32 %call55, 0
  br i1 %cmp56, label %if.then57, label %if.else60

if.then57:                                        ; preds = %if.else54
  %call58 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call58, %struct.sequence** %s, align 8
  %15 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_avg_and_variance(%struct.sequence* %15, i32* %avg, i32* %var)
  %16 = load i32, i32* %avg, align 4
  %17 = load i32, i32* %var, align 4
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.19, i32 0, i32 0), i32 %16, i32 %17)
  br label %if.end102

if.else60:                                        ; preds = %if.else54
  %call61 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0)) #6
  %cmp62 = icmp eq i32 %call61, 0
  br i1 %cmp62, label %if.then63, label %if.else68

if.then63:                                        ; preds = %if.else60
  %call64 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call64, %struct.sequence** %s, align 8
  %18 = load i32, i32* @count_map, align 4
  %call65 = call i32 @getfunc([1024 x i8]* getelementptr inbounds ([1024 x [1024 x i8]], [1024 x [1024 x i8]]* @fname_map, i32 0, i32 0), i32 %18)
  %idxprom66 = sext i32 %call65 to i64
  %arrayidx67 = getelementptr inbounds [1024 x i32 (i32)*], [1024 x i32 (i32)*]* @f_map, i64 0, i64 %idxprom66
  %19 = load i32 (i32)*, i32 (i32)** %arrayidx67, align 8
  %20 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_map(i32 (i32)* %19, %struct.sequence* %20)
  br label %if.end101

if.else68:                                        ; preds = %if.else60
  %call69 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0)) #6
  %cmp70 = icmp eq i32 %call69, 0
  br i1 %cmp70, label %if.then71, label %if.else76

if.then71:                                        ; preds = %if.else68
  %call72 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call72, %struct.sequence** %s, align 8
  %21 = load i32, i32* @count_filter, align 4
  %call73 = call i32 @getfunc([1024 x i8]* getelementptr inbounds ([1024 x [1024 x i8]], [1024 x [1024 x i8]]* @fname_filter, i32 0, i32 0), i32 %21)
  %idxprom74 = sext i32 %call73 to i64
  %arrayidx75 = getelementptr inbounds [1024 x i1 (i32)*], [1024 x i1 (i32)*]* @f_filter, i64 0, i64 %idxprom74
  %22 = load i1 (i32)*, i1 (i32)** %arrayidx75, align 8
  %23 = load %struct.sequence*, %struct.sequence** %s, align 8
  call void @sequence_filter(i1 (i32)* %22, %struct.sequence* %23)
  br label %if.end100

if.else76:                                        ; preds = %if.else68
  %call77 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0)) #6
  %cmp78 = icmp eq i32 %call77, 0
  br i1 %cmp78, label %if.then79, label %if.else87

if.then79:                                        ; preds = %if.else76
  %call80 = call %struct.sequence* @get_seq()
  store %struct.sequence* %call80, %struct.sequence** %s, align 8
  %24 = load i32, i32* @count_foldl, align 4
  %call81 = call i32 @getfunc([1024 x i8]* getelementptr inbounds ([1024 x [1024 x i8]], [1024 x [1024 x i8]]* @fname_foldl, i32 0, i32 0), i32 %24)
  store i32 %call81, i32* %func_id, align 4
  %call82 = call i32 @get_int()
  store i32 %call82, i32* %base, align 4
  %25 = load i32, i32* %func_id, align 4
  %idxprom83 = sext i32 %25 to i64
  %arrayidx84 = getelementptr inbounds [1024 x i32 (i32, i32)*], [1024 x i32 (i32, i32)*]* @f_foldl, i64 0, i64 %idxprom83
  %26 = load i32 (i32, i32)*, i32 (i32, i32)** %arrayidx84, align 8
  %27 = load i32, i32* %base, align 4
  %28 = load %struct.sequence*, %struct.sequence** %s, align 8
  %call85 = call i32 @sequence_foldl(i32 (i32, i32)* %26, i32 %27, %struct.sequence* %28)
  %call86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i32 %call85)
  br label %if.end99

if.else87:                                        ; preds = %if.else76
  %call88 = call i32 @strcmp(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.24, i32 0, i32 0)) #6
  %cmp89 = icmp eq i32 %call88, 0
  br i1 %cmp89, label %if.then90, label %if.else96

if.then90:                                        ; preds = %if.else87
  %call91 = call i32 @get_seq_id()
  store i32 %call91, i32* %id, align 4
  %call92 = call i32 @get_int()
  store i32 %call92, i32* %n, align 4
  %29 = load i32, i32* %n, align 4
  %call93 = call %struct.sequence* @sequence_build(i32 %29)
  %30 = load i32, i32* %id, align 4
  %idxprom94 = sext i32 %30 to i64
  %arrayidx95 = getelementptr inbounds [26 x %struct.sequence*], [26 x %struct.sequence*]* @seqs, i64 0, i64 %idxprom94
  store %struct.sequence* %call93, %struct.sequence** %arrayidx95, align 8
  br label %if.end98

if.else96:                                        ; preds = %if.else87
  %call97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @cmd, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end98:                                         ; preds = %if.then90
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.then79
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.then71
  br label %if.end101

if.end101:                                        ; preds = %if.end100, %if.then63
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %if.then57
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %if.then52
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end48
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %if.then35
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.then30
  br label %if.end107

if.end107:                                        ; preds = %if.end106, %while.end
  br label %while.body

return:                                           ; preds = %if.then5, %if.then
  ret void
}

declare %struct.sequence* @sequence_create() #1

; Function Attrs: noinline nounwind optnone
define internal %struct.sequence* @get_seq() #0 {
entry:
  %call = call i32 @get_seq_id()
  %idxprom = sext i32 %call to i64
  %arrayidx = getelementptr inbounds [26 x %struct.sequence*], [26 x %struct.sequence*]* @seqs, i64 0, i64 %idxprom
  %0 = load %struct.sequence*, %struct.sequence** %arrayidx, align 8
  ret %struct.sequence* %0
}

declare void @sequence_clear(%struct.sequence*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

declare i32 @sequence_length(%struct.sequence*) #1

declare void @sequence_insert_at(%struct.sequence*, i32, i32) #1

declare void @sequence_print(%struct.sequence*) #1

declare void @sequence_add_one(%struct.sequence*) #1

declare zeroext i1 @sequence_equal(%struct.sequence*, %struct.sequence*) #1

declare void @sequence_add_sum(%struct.sequence*) #1

declare void @sequence_avg_and_variance(%struct.sequence*, i32*, i32*) #1

declare void @sequence_map(i32 (i32)*, %struct.sequence*) #1

declare void @sequence_filter(i1 (i32)*, %struct.sequence*) #1

; Function Attrs: noinline nounwind optnone
define internal i32 @get_int() #0 {
entry:
  %n = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i32* %n)
  store i32 %call, i32* %retval1, align 4
  %0 = load i32, i32* %retval1, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.26, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %n, align 4
  ret i32 %1
}

declare i32 @sequence_foldl(i32 (i32, i32)*, i32, %struct.sequence*) #1

declare %struct.sequence* @sequence_build(i32) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-features"="+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 7.1.0 (https://github.com/llvm-mirror/clang.git 4519e2637fcc4bf6e3049a0a80e6a5e7b97667cb) (https://github.com/llvm-mirror/llvm.git dd3329aeb25d87d4ac6429c0af220f92e1ba5f26)"}
!1 = !{i32 1, !"wchar_size", i32 4}
