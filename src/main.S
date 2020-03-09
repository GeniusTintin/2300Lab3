.syntax unified
.global main

.type main, %function
main:

  @flag setting practice
  movs r0, 0x80000000
  @set the negative flag
  cmn r0, 1 
  @set zero flag
  cmp r0, 0x80000000
  @set carry flag
  cmn r0, 0x81000000
  @set overflow flag
  cmp r0, 1

player_1_init:
@player 1 init code
  nop
  mov r1, #100
  @add mana attribute
  mov r2, 40
  @addstamina attribute
  mov r3, 30
player_init:
@player 2 init code
  nop
  mov r4, 100
  beq end_loop
  @add mana attribute
  mov r5, 40
  beq end_loop
  @addstamina attribute
  mov r6, 30

player_1_actions:
@player 1 action code
  
  @fireball_1:
  sub r4, 20

  @frenzy_1:
  sub r1, 20
  add r2, 40

  @eye_of_Zardok_1:
  mul r6, r4
  mov r12, 100
  sdiv r6, r6, r12
  mov r12, 16
  sdiv r5, r5, r12
  mov r12, 3
  mul r5, r12

  bvs end_loop
  bmi end_loop
  beq end_loop
  b player_2_actions

player_2_actions:
@player 2 action code
  
  @bhealing_potion_2
  add r4, 50

  @magic_poison_2
  mov r12, 2
  mls r1, r2, r12, r1

  @strength_from_wearness_2:
  sub r12, r5, r6
  mov r11, 2
  mul r12, r11
  add r4, r12

  bvs end_loop
  bmi end_loop
  beq end_loop
  b player_1_actions
  



healing_potion_1:
  add r1, 50
  @b healing_potion

fireball_1:
  sub r4, 20

frenzy_1:
  sub r1, 20
  add r2, 40

magic_poison_1:
  mov r12, 2
  mls r4, r5, r12, r4

strength_from_wearness_1:
  sub r12, r2, r3
  mov r11, 2
  mul r12, r11
  add r1, r12

eye_of_Zardok_1:
  mul r6, r4
  mov r12, 100
  sdiv r6, r6, r12
  mov r12, 16
  sdiv r5, r5, r12
  mov r12, 3
  mul r5, r12



healing_potion_2:
  add r4, 50
  @b healing_potion

fireball_2:
  sub r1, 20

frenzy_2:
  sub r4, 20
  add r5, 40

magic_poison_2:
  mov r12, 2
  mls r1, r2, r12, r1

strength_from_wearness_2:
  sub r12, r5, r6
  mov r11, 2
  mul r12, r11
  add r4, r12

eye_of_Zardok_2:
  mul r3, r1
  mov r12, 100
  sdiv r3, r3, r12
  mov r12, 16
  sdiv r2, r2, r12
  mov r12, 3
  mul r2, r12
  
  b main

end_loop:
  nop
  b end_loop
.size main, .-main