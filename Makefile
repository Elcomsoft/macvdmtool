CXXFLAGS := -std=c++14
LDFLAGS := -framework CoreFoundation -framework IOKit -lc++

OBJS := main.o

all: macvdmtool

macvdmtool: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)

ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

INSTALL := /usr/bin/install

.PHONY: install
install: macvdmtool
	$(INSTALL) -d "$(PREFIX)/bin/"
	$(INSTALL) -m 755 -o 0 -g 0 "$(<)" "$(PREFIX)/bin/"

clean:
	rm -f macvdmtool
	rm -f main.o
