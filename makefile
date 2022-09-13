# Name: Jackson Horton
# Date: 9-11-2022
# Description: makefile makes compiling the main.cpp file with all it dependencies easier. Has an all target to compile everything  and a clean target to remove unwanted files..

# target is the name of the binary executable
TARGET=main
# compiler is g++
CC=g++
# compile with all warnings and extras
CFLAGS=-g -Wall -Wextra


# compile everything
all: TARGET

TARGET: main.o Employee.o Officer.o Supervisor.o
	$(CC) $(CFLAGS) -o $(TARGET) main.o Employee.o Officer.o Supervisor.o

main.o: main.cpp Employee.cpp Supervisor.cpp Officer.cpp
	$(CC) $(CFLAGS) -c main.cpp

Officer.o: Officer.cpp
	$(CC) $(CFLAGS) -c Officer.cpp

Employee.o: Employee.cpp
	$(CC) $(CFLAGS) -c Employee.cpp

Supervisor.o: Supervisor.cpp
	$(CC) $(CFLAGS) -c Supervisor.cpp

# remove all temp files, machine code, binary files, etc.
clean:
	$(RM) dyn *.o *~ *# $(TARGET)
