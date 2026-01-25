# Fortran compiler
FC = gfortran

# Compiler flags
FFLAGS = -Wall -O2

# Source directory
SRC = src
TEST = tests

# Source files for main program
SRCS =  $(SRC)/complex_number.f90 \
		$(SRC)/utility.f90 \
		$(SRC)/interface.f90 \
		$(SRC)/main.f90
OBJS = $(SRCS:.f90=.o)

# Test source files
TEST_SRCS = $(SRC)/complex_number.f90 \
            $(SRC)/utility.f90 \
            $(SRC)/interface.f90 \
            $(TEST)/test_interface.f90 \
            $(TEST)/test_utility.f90 \
            $(TEST)/run_tests.f90

TEST_OBJS = $(TEST_SRCS:.f90=.o)

# Output executables
TARGET = main
TEST_TARGET = run_tests

# Default rule
all: $(TARGET)

# Link main program
$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^

# Link test runner
$(TEST_TARGET): $(TEST_OBJS)
	$(FC) $(FFLAGS) -o $@ $^

# Compile .f90 → .o
%.o: %.f90
	$(FC) $(FFLAGS) -c $< -o $@

# Run tests
tests: $(TEST_TARGET)
	./$(TEST_TARGET)

# Clean rule
clean:
	rm -f $(OBJS) $(TARGET) $(TEST_OBJS) $(TEST_TARGET)