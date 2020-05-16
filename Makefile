CC = gcc

TARGET = demod
CFLAGS = -Wall -O3
LDFLAGS = $(shell pkg-config --libs libpulse-simple)

SOURCES = demod.c fsync_decode.c mdc_decode.c

OBJECTS = $(patsubst %.c,%.o, $(SOURCES))

.PHONY: all
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $^ $(LDFLAGS) -o $@

.PHONY: clean
clean:
	rm -rf $(TARGET) $(OBJECTS)

.PHONY: format
format:
	clang-format -i *.c *.h
