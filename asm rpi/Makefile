FONTES = boot.s
LDSCRIPT = linker.ld

#
# Arquivos de saída 
#
PROJETO = pisca
EXEC = ${PROJETO}.elf
MAP = ${PROJETO}.map
IMAGE = ${PROJETO}.img
LIST = ${PROJETO}.list
HEXFILE = ${PROJETO}.hex

PREFIXO = arm-none-eabi-
AS = ${PREFIXO}as
LD = ${PREFIXO}ld
OBJCPY = ${PREFIXO}objcopy
OBJDMP = ${PREFIXO}objdump
OPTS = -march=armv7-a -mtune=cortex-a7 -g 
OBJ = $(FONTES:.s=.o)

all: ${EXEC} ${IMAGE} ${LIST} ${HEXFILE}

#
# Gerar executável
#
${EXEC}: ${OBJ}
	${LD} -T ${LDSCRIPT} -M=${MAP} -o $@ ${OBJETOS}

#
# Gerar imagem
#
${IMAGE}: ${EXEC}
	${OBJCPY} ${EXEC} -O binary ${IMAGE}

#
# Gerar arquivo HEX para bootloader 
#
${HEXFILE}: ${EXEC}
	${OBJCPY} ${EXEC} -O ihex ${HEXFILE}

#
# Gerar listagem
#
${LIST}: ${EXEC}
	${OBJDMP} -std ${EXEC} > ${LIST}

#
# Montar arquivos em assembler
#
.s.o:
	${AS} -g -o $@ $<

#
# Limpar tudo
#
clean:
	rm -f *.o ${EXEC} ${MAP} ${LIST} ${IMAGE} ${HEXFILE}

#
# Iniciar openocd
#
ocd: 
	@if pgrep openocd >/dev/null ; then\
		echo "openocd já está executando"; \
	else openocd -f jtag.cfg & \
	fi

#
# Iniciar gdb
#
gdb: ${EXEC} ocd
	gdb-multiarch -ex "set architecture arm" \
		           -ex "target extended-remote :3333" \
					  -ex "load" \
					  ${EXEC}

stop:
	-pkill openocd
	-pkill gdb-multiarch

rebuild: clean all