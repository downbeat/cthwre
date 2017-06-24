# Russ Bielawski
# 2017-06-17
#
# From: https://stackoverflow.com/questions/18416564/how-to-resolve-crt0-o-linking-issue-in-cross-compiling

NAME=null

ARM-NONE-EABI-GCC-LOCATION=/opt/local/bin

AS=$(ARM-NONE-EABI-GCC-LOCATION)/arm-none-eabi-as
CC=$(ARM-NONE-EABI-GCC-LOCATION)/arm-none-eabi-gcc
LD=$(ARM-NONE-EABI-GCC-LOCATION)/arm-none-eabi-ld
OBJDUMP=$(ARM-NONE-EABI-GCC-LOCATION)/arm-none-eabi-objdump
OBJCOPY=$(ARM-NONE-EABI-GCC-LOCATION)/arm-none-eabi-objcopy

AS_SOURCE=vectors.s main.s
MEMMAP=memmap.ld

OBJ_FILES=$(patsubst %.s,%.o,$(AS_SOURCE))

all: $(NAME).elf $(NAME).list $(NAME).bin

%.o: %.s
	$(AS) -o $@ $<

$(NAME).elf: $(MEMMAP) $(OBJ_FILES)
	$(LD) $(OBJ_FILES) -T $(MEMMAP) -o $(NAME).elf

$(NAME).list: $(NAME).elf
	$(OBJDUMP) -D $(NAME).elf > $(NAME).list

$(NAME).bin: $(NAME).elf
	$(OBJCOPY) $(NAME).elf -O binary $(NAME).list

clean:
	rm -f $(NAME).elf $(NAME).list $(NAME).bin $(OBJ_FILES)

.PHONY: clean
