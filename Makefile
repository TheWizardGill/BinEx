# Defining the compiler, assembler, and flags
CC=gcc
CFLAGS=-ggdb
AS=nasm
ASFLAGS=-f elf64 -g

# Defining the output executable and object files
EXECUTABLE=testStudentStrncmp
C_OBJ=testStudentStrncmp.o
ASM_OBJ=studentStrncmp.o
ASM_SOURCE=studentStrncmp.asm
C_SOURCE=testStudentStrncmp.c

all: $(EXECUTABLE)

$(EXECUTABLE): $(C_OBJ) $(ASM_OBJ)
	$(CC) $(CFLAGS) $(C_OBJ) $(ASM_OBJ) -o $(EXECUTABLE)

$(C_OBJ): $(C_SOURCE)
	$(CC) $(CFLAGS) -c $(C_SOURCE) -o $(C_OBJ)

$(ASM_OBJ): $(ASM_SOURCE)
	$(AS) $(ASFLAGS) $(ASM_SOURCE) -o $(ASM_OBJ)

clean:
	rm -f $(C_OBJ) $(ASM_OBJ) $(EXECUTABLE)

run: all
	./$(EXECUTABLE)
