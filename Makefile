SIF = ubuntu-ve-llvm-build.sif
DEF = ubuntu-ve-llvm-build.def

.PHONY: all clean verify

all: $(SIF)

$(SIF): $(DEF)
	apptainer build $@ $<

verify: $(SIF)
	apptainer exec $(SIF) g++ --version
	apptainer exec $(SIF) cmake --version

clean:
	rm -f $(SIF)
