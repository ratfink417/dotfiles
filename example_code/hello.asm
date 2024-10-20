.section.data
hello:
     .ascii "Hello, World!\0"

.section.text
.globl_start

_start:
     mov $1, %rax # syscall: sys_write
     mov $1, %rdi # file descriptor: stdout
     mov $hello, %rsi # string address
     mov $13, %rdx # string length
     syscall # calls the kernel

     mov $60, %rax # syscall: sys_exit
     xor %rdi, %rdi # exit status: 0
     syscall # calls the kernel
		
