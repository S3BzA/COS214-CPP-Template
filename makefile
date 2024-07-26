all: build run

build:
	mkdir -p build
	rm -f build/*
	g++ -std=c++11 -g src/* -o build/main

clean:
	rm -f build/*

run:
	./build/main

gdb: # Assumes gdb is installed
	gdb ./build/main

valgrind: # Assumes valgrind is installed
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes -s ./build/main

.PHONY: all build clean run gdb valgrind