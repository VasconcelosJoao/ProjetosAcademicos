CC = gcc
LDFLAGS = -pthread -lbcm2835 -lwiringPi -lm

BLDDIR = .
INCDIR = $(BLDDIR)/include
SRCDIR = $(BLDDIR)/src
OBJDIR = $(BLDDIR)/obj
BINDIR = $(BLDDIR)/bin

CFLAGS = -c -Wall -I$(INCDIR)

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SRC)) 
EXE = $(BINDIR)/bin

all: clear $(EXE)

$(EXE): $(OBJ) | $(BINDIR)
	$(CC)  $(OBJDIR)/*.o -o $@ $(LDFLAGS)

$(OBJDIR)/%.o : $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

clear:
	-rm -f $(OBJDIR)/*.o $(EXE)

.PHONY: all clear
