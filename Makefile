SIF = ubuntu-ve-llvm-build.sif
DEF = ubuntu-ve-llvm-build.def

.PHONY: all clean verify

all: $(SIF)

$(SIF): $(DEF)
	apptainer build $@ $<

verify: $(SIF)
	apptainer exec $(SIF) g++ --version
	apptainer exec $(SIF) cmake --version
	apptainer exec $(SIF) /opt/nec/ve/bin/nas --version
	apptainer exec $(SIF) /opt/nec/ve/bin/nld --version
	apptainer exec $(SIF) ls /opt/nec/ve/include/asm/
	apptainer exec $(SIF) ls /opt/nec/ve/lib/

clean:
	rm -f $(SIF)
