.ONESHELL:
# PYTHON
SHELL := /bin/zsh
ENTRY := src/gui.py
CONDA_ENV_NAME := modern
CONDA_ACTIVATE := $(shell conda info --base)/bin/activate && conda activate modern



# CPP

# COMPILER OPTIONS
CC := clang
CFLAGS := -g -Wall -std=c++20 -pedantic -pthread 
TARGET := timetable

# FILES 

SRCDIR := ./src/genetic/
OBJDIR := ./obj/
BUILDDIR := ./bin/
TESTDIR := ./test/
CPP_SRC := main.cpp

SRC := $(patsubst %, $(SRCDIR)%, $(CPP_SRC))
OBJ := $(patsubst %, $(OBJDIR)%, $(CPP_SRC:.cpp=.o))

run:
	@source $(CONDA_ACTIVATE)
	@python $(ENTRY)

build: $(BUILDDIR)$(TARGET)
$(OBJDIR)%.o : $(SRCDIR)%.cpp
	@echo "Creating object file"
	$(CC) -c $< -o $@ $(CFLAGS) -I .
	
$(BUILDDIR)$(TARGET):$(OBJ)
	@echo "Creating executable file"
	$(CC) $^ -o $@ $(CFLAGS) $(LIB) -I .

clean:
	rm -rf $(OBJDIR)* $(BUILDDIR)*


.PHONY: clean