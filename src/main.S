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
  mov r1, 100
  @add mana attribute
  mov r2, 40
  @addstamina attribute
  mov r3, 30
player_2_init:
@player 2 init code
  nop
  mov r1, 100
  @add mana attribute
  mov r2, 40
  @addstamina attribute
  mov r3, 30
  
player_1_actions:
@player 1 action code
player_2_actions:
@player 2 action code

  



healing_potion:
  add r1, 50
  @b healing_potion

fireball:
  sub r1, 20

frenzy:
  sub r1, 20
  add r2, 40

magic_poison:
  mov r12, 2
  mls r1, r1, r2, r12 

strength_from_wearness:
  sub r12, r2, r3
  mov r11, 2
  mul r12, r11
  add r1, r12

eye_of_Zardok:
  mul r3, r1
  mov r12, 100
  sdiv r3, r3, r12
  mov r12, 16
  sdiv r2, r2, r12
  mov r12, 3
  mul r2, r12

  
  b main
.size main, .-main