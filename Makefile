TARGET = amicc

all: $(TARGET)

$(TARGET): amicc.c

test: $(TARGET)
	./test.sh

clean:
	rm -f $(TARGET) *.o *~ *.out *.s

.PHONY: all test clean
