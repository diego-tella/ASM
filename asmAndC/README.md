I am trying to exploit a format string vulnerabilty using %s to get the 0x4141 value in pushbro.s (send it to the stack).

```
as pushbro.s -o pushbro.o
gcc file.c pushbro.o
./file.out
```

I am linking the assembly code to the C code and trying to exploit the format string vulnerability printing 0x41 from the stack!
