@ First partner's name: Lingfei Lu, A91046735
@ Second partner's name: Junxi Li, A91105747

.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
* or come ask us if you're curious!*/
.data 


.text

/* int majority_count_ARM(int * arr, int len, int * result)*/
/* Remember to place your return value in r0. */
/* Return the count of the majority element in arr, */
/* or 0 if there is no majority. If "result" is not */
/* NULL, place the value of the majority element at */
/* that memory location before returning. */

.align 8
.global majority_count_ARM
.func majority_count_ARM, majority_count_ARM
.type majority_count_ARM, %function

majority_count_ARM:
@ We need to save away a bunch of registers
push    {r4-r11, ip, lr}
@ May want to decrement stack pointer for more space

@r4 = int * arr
mov r4, r0

@r5 = len
mov r5, r1

@r6 = int * result
mov r6, r2

@creeate space for left_maj,right_maj,right_maj_count,left_maj_count,c
sub sp, sp, #24
@if(len == 0) 
cmp r5, #0
beq return0

@if(len == 1) 
cmp r5, #1
bne next

@if(result)
cmp r6, #0
beq return1

@r7 = arr[0]
ldr r7, [r4]
str r7, [r6] 

b return1

next:

@r0 = arr
mov r0, r4

@r1 = len/2
lsr r1, r5, #1

@r2 = &left_majority = sp + 20
add r2, sp, #20

@majority_count(arr, len/2, &left_majority) 
bl majority_count_ARM    

@left_majority_count = sp + 16
str r0, [sp, #16]

@r0 = arr+len/2
@len/2 and offset mul by 4 == 2*len
lsr r1, r5, #1
add r0, r4, r1, lsl #2

@r1 = len - len/2
sub r1, r5, r5, lsr #1

@r2 = &right_majority = sp + 12
add r2, sp, #12

@majority_count(arr+len/2, len-len/2, &right_majority) 
bl majority_count_ARM

@right_majority_count = sp
str r0, [sp, #8] 

@if(left_majority_count)
ldr r0, [sp, #16]
cmp r0, #0
beq next2

mov r0, r4
mov r1, r5
ldr r2, [sp, #20]

@count(arr, len, left_majority)      
bl count_ARM

@c = sp + 4 
str r0, [sp, #4]

cmp r0, r5, lsr #1
ble next2

@if(result)
cmp r6, #0
beq returnc

@r0 = left_majority
ldr r0, [sp, #20]

@*r6 = left_majority 
str r0, [r6] 

b returnc   

next2:
ldr r0, [sp, #8]

@if(right_majority_count)
cmp r0, #0
beq return0

mov r0, r4
mov r1, r5
ldr r2, [sp, #12]

@count(arr, len, right_majority)
bl count_ARM

@c = sp + 4
str r0, [sp, #4] 

cmp r0, r5, lsr #1
ble return0

@if(result)
cmp r6, #0
beq returnc

@r0 = right_majority
ldr r0, [sp, #12]

@*result = right_majority
str r0, [r6] 

b returnc

return0: 
add sp, sp, #24
mov r0, #0
b end

returnc:
ldr r0, [sp, #4]
add sp, sp, #24
b end

return1:
add sp, sp, #24
mov r0, #1
end:  
@ Remember to restore your stack pointer before popping!
@ This handles restoring registers and returning
pop     {r4-r11, ip, pc}

.endfunc

count_ARM:
push {r4-r11, ip, lr}
@r4 = int *arr
mov r4, r0

@r5 = int len
mov r5, r1

@r6 = int target
mov r6, r2

@r7 = i
mov r7, #0

@r3 = ret_count
mov r3, #0

for:
cmp r7, r5
bge return_count

@r0 = arr[i]
ldr r0, [r4, r7, lsl #2]

@if(arr[i] == target)
cmp r0, r6
bne increment

@++ret_count 
add r3, r3, #1

increment: add r7, r7, #1

b for
return_count: mov r0, r3


pop {r4-r11, ip, pc}

.end


