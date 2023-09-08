LIBS = -lgsl -lm
LDFLAGS = -L/Users/grs53/miniconda3/lib # change these as appropriate
INCLUDES = -I/Users/grs53/miniconda3/include
CFLAGS = -Wall -O2 ${INCLUDES}
CC = clang  # change to gcc if needed

all: timing_test

timing_test: timing_test.o compute_avg.o
	${CC} timing_test.o compute_avg.o ${LDFLAGS} ${LIBS} -o timing_test

clean:
	rm -f *.o timing_test
