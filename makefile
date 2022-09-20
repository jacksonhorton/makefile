# Name: Jackson Horton
# Date: 9-19-2022
# Description: makefile makes compiling the main.cpp file with all it dependencies easier. Has an all target to compile everything and a clean target to remove unwanted files..
# All the user has to do is type "make" in the console to recompile the binary executable after any changes.

## Variables
# target is the name of the binary executable
TARGET=main
# compiler is g++
CC=g++
# compile with all warnings and extras
CFLAGS=-g -Wall -Wextra


## Targets
# compile everything
all: TARGET

# this target compiles the binary executable; it requires all of the object code files from the headers and other files
TARGET: main.o Employee.o Officer.o Supervisor.o
	$(CC) $(CFLAGS) -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

main.o: main.cpp Employee.cpp Supervisor.cpp Officer.cpp
	$(CC) $(CFLAGS) -c main.cpp

Officer.o: Officer.cpp Employee.cpp
	$(CC) $(CFLAGS) -c Officer.cpp

Employee.o: Employee.cpp
	$(CC) $(CFLAGS) -c Employee.cpp

Supervisor.o: Supervisor.cpp Employee.cpp
	$(CC) $(CFLAGS) -c Supervisor.cpp

# remove all temp files, machine code, binary files, etc.
clean:
	$(RM) *.o *~ *# $(TARGET)
