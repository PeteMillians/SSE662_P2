# Fortran compiler
FC = gfortran

# Compiler flags
FFLAGS = -Wall -O2

# Source directory
SRC = src

# Source files
SRCS = $(SRC)/complex_number.f90 $(SRC)/main.f90 $(SRC)/command_line.f90

# Object files
OBJS = $(SRCS:.f90=.o)

# Output executable
TARGET = main

# Default rule
all: $(TARGET)

# Link step
$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^

# Compile .f90 → .o
%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

# Clean rule
clean:
	rm -f $(OBJS) $(TARGET)
