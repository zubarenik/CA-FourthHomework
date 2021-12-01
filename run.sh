rm -rf out
mkdir out
nasm -f elf64 main.asm -o out/nasm.o
ld -lm -lc -dynamic-linker /lib64/ld-linux-x86-64.so.2 ./out/nasm.o -o ./out/res
./out/res $1 $2 $3