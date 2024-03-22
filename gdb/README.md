<h1>Compiling with debugging information</h1>

```
nasm file.asm -f elf64 -g
ld file.o -o file
```

<h1>Using layout regs in GDB</h1>

```
break _start
break _end
layout regs
```

![image](https://github.com/diego-tella/ASM/assets/70545257/ffa4ff4b-9267-495e-9b7f-30066574b54a)

![image](https://github.com/diego-tella/ASM/assets/70545257/1bcfccb6-c346-4520-972d-2578c61d3b5a)
