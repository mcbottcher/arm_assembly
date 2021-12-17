    AREA asm_func, CODE, READONLY
    EXPORT my_asm

my_asm

    // push max_count onto the stack
    push {r3}

    // push the count values onto the stack
    push {r0}
    push {r1}
    push {r2} 
    
    // push the toggle LED data to stack
    // Values for Port D, Pin1 (LED3)
    ldr r0,=0x400FF0CC // PortD base address + PTOR offset
    ldr r1,=0x2 // 1 << 1
    push {r0}
    push {r1}
    // Values for Port B, Pin18 (LED1)
    ldr r0,=0x400FF04C // PortB base address + PTOR offset
    ldr r1,=0x40000 // 1 << 18
    push {r0}
    push {r1}
    // Values for Port B, Pin19 (LED2)
    ldr r0,=0x400FF04C // PortB base address + PTOR offset
    ldr r1,=0x80000 // 1 << 19
    push {r0}
    push {r1}

    // set count value to 0
    movs r1, #0
    
    b main_loop    
    
    
main_loop

    // add one to the counter value
    adds r1, r1, #0x1
    b check_led1

check_led1

    // check for led1
    // need to load r0 with compare value for led1
    ldr r0, [sp, #32]
    cmp r0, r1
    beq toggle_led1
    b check_led2

check_led2

    // check for led1
    // need to load r0 with compare value for led2
    ldr r0, [sp, #28]
    cmp r0, r1
    beq toggle_led2
    b check_led3
    
check_led3

    // check for led1
    // need to load r0 with compare value for led1
    ldr r0, [sp, #24]
    cmp r0, r1
    beq toggle_led3   
    b check_comparator

clear_comparator
    
    movs r1, #0
    b main_loop

check_comparator
    
    ldr r0, [sp, #36]
    cmp r0, r1
    beq clear_comparator    

    b main_loop

toggle_led1
    ldr r3, [sp, #8]
    ldr r2, [sp, #12]
    str r3, [r2, #0]
    b check_led2

toggle_led2
    ldr r3, [sp]
    ldr r2, [sp, #4]
    str r3, [r2, #0]
    b check_led3

toggle_led3
    ldr r3, [sp, #16]
    ldr r2, [sp, #20]
    str r3, [r2, #0]
    b check_comparator
    END
