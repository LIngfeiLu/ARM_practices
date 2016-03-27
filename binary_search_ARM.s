@ First partner's name: Lingfei Lu, A91046735
@ Second partner's name: Junxi Li, A91105747

.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
* or come ask us if you're curious!*/
.data 


.text

/*int binary_search_ARM(int * data, int toFind, int start, int end)*/
/*Note that you return your value in r0*/

.align 8
.global binary_search_ARM
.func binary_search_ARM, binary_search_ARM
.type binary_search_ARM, %function

binary_search_ARM:
@ We need to save away a bunch of registers
push    {r4-r11, ip, lr}

@r4 = *data
mov r4, r0

@r5 = toFind
mov r5, r1

@r6 = start
mov r6, r2

@r7 = end
mov r7, r3

@end-start = r1
sub r1, r7, r6

@r1 = (end-start)/2
lsr r1, r1, #1

@r2 = mid = r1 + r6
add r2, r1, r6

@store value mid to the stack
@stmdb sp!, {r2}

@if(start > end)
cmp r6, r7
bgt returnNegative

@r3 = data[mid]
ldr r3, [r4, r2, lsl #2]

@else if(data[mid] == toFind)
cmp r3, r5

@return mid
beq returnMid

@else if(data[mid] > toFind)
cmp r3, r5

ble else

@r3 = mid - 1
sub r3, r2, #1

@r2 = start
mov r2, r6

@r1 = toFind
mov r1, r5

@r0 = data
mov r0, r4

bl binary_search_ARM

b end

else:
@r3 = end
mov r3, r7

@r2  = mid +1
add r2, r2, #1

@r1 = toFind
mov r1, r5

@r0 = data
mov r0, r4

bl binary_search_ARM
b end

returnNegative: mov r0, #-1
b end
returnMid: mov r0, r2

end:
@ Remember to restore the stack pointer before popping!
@ This handles restoring registers and returning
pop     {r4-r11, ip, pc}

.endfunc

.end


