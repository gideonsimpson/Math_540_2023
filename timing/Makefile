LIBS = -lgsl -lm
LDFLAGS = -L/Users/grs53/miniconda3/lib
CFLAGS = -Wall -O2 -I/Users/grs53/miniconda3/include
INCLUDES = 
CC = clang

all: timing_test

timing_test: timing_test.o compute_avg.o
	${CC} timing_test.o compute_avg.o ${LDFLAGS} ${LIBS} -o timing_test

clean:
	rm -f *.o timing_test
