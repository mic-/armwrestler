arm-elf-as -march=armv5te -mno-fpu -EL -o awr9.o armwrestler-ds.asm
arm-elf-as -mcpu=arm9tdmi -mno-fpu -mthumb -EL -o twr9.o thumbwrestler-ds.asm
arm-elf-as -mcpu=arm9tdmi -mno-fpu -EL -o ds_arm9_crt0.o ds_arm9_crt0.S
arm-elf-ld -T ds_arm9.ld -EL -e _start ds_arm9_crt0.o awr9.o twr9.o 
arm-elf-objcopy -O binary a.out armwrestler.ds.arm9.bin
arm-elf-as -mcpu=arm7tdmi -mno-fpu -EL -o awr7.o armwrestler-arm7.asm
arm-elf-ld -Ttext 0x3800000  -EL -e arm7_main awr7.o 
arm-elf-objcopy -O binary a.out armwrestler.ds.arm7.bin
ndstool -c armwrestler.nds -r9 0x2004000 -e9 0x2004000 -r7 0x3800000 -e7 0x3800000 -9 armwrestler.ds.arm9.bin -7 armwrestler.ds.arm7.bin