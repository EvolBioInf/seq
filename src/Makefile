CC=gcc
export VERSION = $(shell bash ../scripts/version.sh) # The single, trailing blank is essential
export DATE    = $(shell bash ../scripts/date.sh) #    The single, trailing blank is essential
CFLAGS         = -DVERSION=\"$(VERSION)\" -DDATE=\"$(DATE)\" -O3 -Wall -Wshadow -pedantic -std=gnu99 -g -I../common/ -L../common/ #-pg

SRCFILES  = testSeq.c seq.c
OBJFILES  = testSeq.o seq.o
LIBS      = -lm -lcommon -lbsd
EXECFILE  = testSeq

.PHONY : all
all : $(EXECFILE)
$(EXECFILE) : $(OBJFILES)
	$(CC) $(CFLAGS) -o $(EXECFILE) $(OBJFILES) $(LIBS)
seq.c: seq.org seq.h
	bash ../scripts/org2nw seq.org | notangle -Rseq.c > seq.c
seq.h: seq.org
	bash ../scripts/org2nw seq.org | notangle -Rseq.h > seq.h
testSeq.c: seq.org seq.h seq.c
	bash ../scripts/org2nw seq.org | notangle -RtestSeq.c > testSeq.c

clean:
	rm -f *.o *~ testSeq testSeq.c seq.c seq.h
test:
	bash ../scripts/seq.sh 
