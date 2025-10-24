NVCC = nvcc

ARCH = -arch=sm_70
PTXAS = -Xptxas=-v

TARGET = benchmarkTest

SRC = test.cu

all: $(TARGET)

$(TARGET): $(SRC)
	$(NVCC) $(ARCH) $(PTXAS) $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)