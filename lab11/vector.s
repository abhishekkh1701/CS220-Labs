.text
.globl main
main: li $v0, 5
      syscall
      add $t1, $v0, $0
      mtc1 $0, $f2
      addi $t2, $0, 1 
loop: blez $t1, exit
      li $v0, 6
      syscall
      beq $t2, $0, else
      add.s $f2, $f2, $f0
      j ifend
else: sub.s $f2, $f2, $f0
ifend: xori $t2, $t2, 1
      addi $t1, $t1, -1
      j loop
exit: mov.s $f12, $f2
      li $v0, 2
      syscall
      jr $ra          
      
      
      
            

