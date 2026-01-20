# Compiler
FC = gfortran

# Flags
FFLAGS = -Wall -O2

# Output executable
TARGET = program.exe

# Source files
SRCS = main.f90 complex_number.f90 interface.f90

# Object files (replace .f90 with .o)
OBJS = $(SRCS:.f90=.o)

# Default rule
all: $(TARGET)

# Link step
$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^

# Compile each .f90 file into .o
%.o: %.f90
	$(FC) $(FFLAGS) -c $<

# Clean rule
clean:
	rm -f $(OBJS) $(TARGET)
