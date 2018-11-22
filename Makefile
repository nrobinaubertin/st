# st - simple terminal
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = st.c x.c
OBJ = $(SRC:.c=.o)

all: options st

options:
	@echo st build options:
	@echo "CFLAGS  = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "CC      = $(CC)"

.c.o:
	$(CC) $(CFLAGS) -c $<

st.o: st.h win.h
x.o: arg.h st.h win.h

$(OBJ): config.mk

st: $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS)

clean:
	rm -f st $(OBJ)

install: st
	mkdir -p $(HOME)/.local/bin
	cp -f st $(HOME)/.local/bin
	chmod 755 $(HOME)/.local/bin/st

uninstall:
	rm -f $(HOME)/.local/bin/st

.PHONY: all options clean install uninstall
