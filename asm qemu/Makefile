# Makefile  
# Liste os arquivos fonte aqui:
FONTES = teste.s
LDSCRIPT = kernel.ld
PROJETO = teste_asm
# Você pode usar FONTES = $(wildcard *.s)
# todos os arquivos .s serão incluídos: cuidado!

# Arquivos de saída
EXEC = ${PROJETO}.elf
MAP = ${PROJETO}.map

PREFIXO = arm-none-eabi-
AS = ${PREFIXO}as
LD = ${PREFIXO}ld
OBJETOS = $(FONTES:.s=.o)

# Alvo: gerar executável
${EXEC}: ${OBJETOS}
	${LD} -T ${LDSCRIPT} -M=${MAP} -o $@ ${OBJETOS}

# Alvo: montar arquivos em assembler
.s.o:
	${AS} -g -o $@ $<

# Alvo: limpar tudo
clean:
	rm -f *.o ${EXEC} ${MAP}

# Alvo: iniciar qemu
qemu: ${EXEC}
	@if lsof -Pi :1234 >/dev/null ; then\
		echo "qemu já está executando"; \
	else qemu-system-arm -s -M virt -kernel ${EXEC} & \
	fi

# Alvo: iniciar gdb
gdb: ${EXEC}
	gdb-multiarch -ex "set architecture arm" \
		-ex "target extended-remote :1234" \
		-ex "load" \
		${EXEC}

