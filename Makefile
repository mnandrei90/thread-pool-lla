TARGET = bin/threadpool
CFLAGS = -std=c17 -Wall -Wextra -pedantic -g -Iinc

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=obj/%.o)

run: clean default
	# ./$(TARGET)

default: $(TARGET)

clean:
	rm -f obj/*.o
	rm -f bin/*

$(TARGET): $(OBJ)
	gcc -o $@ $? $(CFLAGS)

$(OBJ): obj/%.o: src/%.c
	gcc -c $< -o $@ $(CFLAGS)

