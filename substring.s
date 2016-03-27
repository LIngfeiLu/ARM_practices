@ First partner's name: Lingfei Lu, A91046735
@ Second partner's name: Junxi Li, A91105747

.syntax unified

.text

.align 8
.global substring
.func substring, substring
.type substring, %function

substring:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @r4 = s1
    mov r4, r0

    @r5 = s2
    mov r5, r1

    @r6 = i
    mov r6, #0

    @r7 = j
    mov r7, #0

    @s1 == NULL
    cmp r4, #0

    @s2 == NULL
    cmpne r5, #0

    @return 0
    beq return0

    @strlen(s1)
    bl strlen

    @r8 = strlen(s1)
    mov r8, r0


    @strlen(s2)
    mov r0, r5
    bl strlen

    @r9 = strlen(s2)
    mov r9, r0

    @strlen(s1) == 0
    cmp r8, #0
    beq return1

    @strlen(s2) == 0
    cmpne r9, #0
    beq return1

    @strlen(s1) > strlen(s2)
    cmp r8, r9
    ble while1

    @char #temp = s2
    mov r8, r5
    mov r5, r4
    mov r4, r8

    while1: 

    @r8 = s2[i]
    ldrb r8, [r5, r6]

    @s2[i] != 0
    cmp r8, #0

    beq return0

    ldrb r9, [r4]

    @s2[i] == s1[0]
    cmp r8, r9

    bne incrementi

    mov r7, #0

    while2:

    @r8 = s1[j]
    ldrb r8, [r4, r7]

    @r9 = s2[i+j]
    add r10, r6, r7
    ldrb r9, [r5, r10]

    @s1[j] & s2[i+j]
    and r11, r8, r9
    cmp r11, #0
    beq if

    @s1[j] == s2[i+j]
    cmp r8, r9
    bne if

    @j++
    add r7, r7, #1
    b while2

    @s1[j] == 0
    if: cmp r8, #0
    beq return1
    
    incrementi:
    @i++
    add r6, r6, #1

    b while1

    return0: mov r0, #0
    b end
    return1: mov r0, #1
    end:







    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

