@ First partner's name: Lingfei Lu, A91046735
@ Second partner's name: Junxi Li, A91105747
.syntax unified

/* You can put constants in the .data section. Look up how to do it on your own,
* or come ask us if you're curious!*/
.data 


.text

/* int str_to_int(char * str, int * dest);*/
/* Return 1 for success and 0 for failure. */
/* If successful, store the result at the */
/* location pointed to by "dest" */

.align 8
.global str_to_int
.func str_to_int, str_to_int
.type str_to_int, %function

str_to_int:
@ We need to save away a bunch of registers
push    {r4-r11, ip, lr}

@r4 = s
mov r4, r0

@r5 = dest
mov r5, r1

@r6 =power
mov r6, #1

@s == NULL || dest ==NULL || *s == 0
cmp r4, #0
cmpne r5, #0
beq return0

ldrb r3, [r4]
cmp r3, #0
beq return0

@r7 = i
bl strlen
sub r7, r0, #1

@r8 = temp
mov r8, #0

@r9 = limit
mov r9, #0

@*s == '-'
ldrb r10, [r4]

cmp r10, #45
bne for
mov r9, #1 

@i >= limit
for:cmp r7, r9
blt next2

@int num = *(s+i)-48;
ldrb r10, [r4, r7]
@r10 = num
sub r10, r10, #48

@if(num > 9 || num < 0)
cmp r10, #9
bgt return0
cmp r10, #0
blt return0

@temp += num * power
mul r11, r10, r6
add r8, r8, r11

@power *= 10
lsl r11, r6, #3
add r6, r11, r6, lsl #1

@i--
sub r7, r7, #1
b for

next2:
@if(limit == 1)
cmp r9, #1
@temp = 0 - temp;
rsbeq r8, r8, #0


@*dest = temp
str r8, [r5]

mov r0, #1
b end
return0:mov r0, #0
end:
@ This handles restoring registers and returning
pop     {r4-r11, ip, pc}

.endfunc

.end


