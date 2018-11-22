# st version
VERSION = 0.8.1

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I$(X11INC) \
       `pkg-config --cflags fontconfig` \
       `pkg-config --cflags freetype2`
LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
       `pkg-config --libs fontconfig` \
       `pkg-config --libs freetype2`

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\"
CFLAGS   = -std=c11 -pedantic -Wall -Wno-unused-result -Wno-deprecated-declarations -Oz ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# compiler and linker
CC = clang
