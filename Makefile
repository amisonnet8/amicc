all: amicc

amicc: amicc.c

test: amicc
	./test.sh

clean:
	rm -f amicc *.o *~ *.out *.s

.PHONY: all test clean
