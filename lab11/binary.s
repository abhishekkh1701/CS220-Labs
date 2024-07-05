.data
arrayX: .space 48
notf: .asciiz "Element was not found "
found: .asciiz "Element was found at "
.text
.globl main
binary: bne $a0, $a1, exec
        sll $t2, $a0, 2
        add $t3, $t1, $t2
        lw $t4, 0($t3)
        beq $t4, $a2, fou
        la $a0, notf
        li $v0, 4
        syscall
        jr $ra
fou: la $a0, found
     li $v0, 4
     syscall
     li $v0, 1
     add $a0, $a1, $0
     syscall
     jr $ra
exec: addi $sp, $sp, -4
      sw $ra, 0($sp)
      add $t5, $a0, $a1
      srl $t5, $t5, 1
      sll $t6, $t5, 2
      add $t6, $t1, $t6
      lw $t7, 0($t6)
      slt $t2, $t7, $a2
      beq $t2, $0, rig
      addi $a0, $t5, 1
      j recur
rig: add $a1, $t5, $0
recur: jal binary
       lw $ra, 0($sp)
       addi $sp, $sp, 4
       jr $ra
main: li $v0, 5
      syscall
      add $t0, $v0, $0
      xor $a0, $a0, $a0
      addi $a1, $t0, -1
      la $t1, arrayX
      add $t3, $t1, $0
loop: li $v0, 5
      syscall
      sw $v0, 0($t3)
      addi $t3, $t3, 4
      addi $t0, $t0, -1
      bne $t0, $0, loop
      li $v0, 5
      syscall
      add $a2, $v0, $0
      addi $sp, $sp, -4
      sw $ra, 0($sp)
      jal binary
      lw $ra, 0($sp)
      addi $sp, $sp, 4
      jr $ra
      
