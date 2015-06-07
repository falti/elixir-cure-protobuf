# This Makefile is automatically generated with "mix cure.bootstrap"!
# Please do not remove the following variables as they point to
# the necessary source-files.

INC_PARAMS = /Users/frank/elixir/ipc/deps/cure/c_src
ELIXIR_COMM_C = $(INC_PARAMS)/elixir_comm.c
C_FLAGS = -I$(INC_PARAMS) -I.

CXX = clang++
CXXFLAGS=-g -std=c++11 -Wall -pedantic -v


# You can add other build targets on the next line:
ALL = program

USER = user.pb.o

ELIXIR_COMM = elixir_comm.o

# Targets:
all: $(ALL)
program: $(ELIXIR_COMM) $(USER)
	$(CXX) main.cpp $(CXXFLAGS) $(C_FLAGS) -o program `pkg-config --cflags --libs protobuf`
user.pb.o:
	$(CXX) user.pb.cc $(pkg-config --cflags --libs protobuf) -c $(CXXFLAGS)
elixir_comm.o:
	gcc -c $(ELIXIR_COMM_C) $(C_FLAGS)

