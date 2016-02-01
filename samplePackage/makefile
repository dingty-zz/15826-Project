CFLAGS= -g -ansi
SRC= fern.c sierpinski.c
OBJ= fern.o sierpinski.o
# set gnu-cc to be the compiler
CC= gcc

# MUST HAVE IT ###################
demo: sierpinski fern
	sierpinski | xgraph -nl -P
	fern | xgraph -nl -P

# MUST HAVE IT ###################
# makes the two executables
install: sierpinski fern

# MUST HAVE IT ###################
paper.ps:
	cd DOC; make paper.ps
	mv DOC/paper.ps .

sierpinski: sierpinski.o
	$(CC) $(CFLAGS) sierpinski.o -lm -o sierpinski

fern: fern.o
	$(CC) $(CFLAGS) fern.o -lm -o fern

# erases the *.o files AND the DOC directory
clean:
	\rm -f $(OBJ)
	cd DOC; make clean
	
# erases the executables, too
# MUST HAVE IT ###################
spotless: clean
	\rm -f sierpinski fern paper.ps  all.tar all.tar.gz uu

all.tar: $(SRC)
	cd DOC; make spotless
	tar cvf all.tar $(SRC) DOC makefile README

all.tar.gz: all.tar
	gzip all.tar

# ready to ship with e-mail
# MUST HAVE IT ###################
uu: all.tar.gz
	uuencode all.tar.gz all.tar.gz > uu
