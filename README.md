# Complex Number Calculator in FORTRAN

TODO: Add description

## Compiling

To use the Complex Number Calculator, ensure you have FORTRAN installed. Installation guides can be found [here](https://gcc.gnu.org/wiki/GFortranBinaries).

To compile the Complex Number Calculator, simply use the **make** command. This will compile the binary using the additional object files required by the main file. 

```
make
```

To ensure the files were created properly, you can optionally test the functionality using built-in test scripts. These tests compile and run via the following command:

```
make tests
```

Following this run, you should see that the last printed line states

```
All tests passed.
```

## Usage
Once the main file has been compiled, run the Complex Number Calculator using the following command:

```
./main
```

The calculator has the following features:
- Addition
- Subtraction
- Multiplication
- Division
- Exponent

*Note: Each of these functions work with complex numbers*

To use any function in the calculator, enter the command you wish to apply followed by your two values, each separated by a space. To create a readable complex number, there are two valid formats:
- real+imagi
- (real,imag)

*Note: Complex numbers cannot contain spaces*


```
Enter a command: <command> complex1 complex2
```


For example, to add two complex numbers:

```
Enter a command: add 4-2i (-3,5)
```

After each calculation, you will be prompted, asking if you wish to continue or not. Simply type **y** to continue using the calculator, or **n** to exit.

```
Do you wish to continue (y/n): 
```


## Addition
To use the addition tool in the Complex Number Calculator, precede your complex numbers with the keyword **add**:

```
Enter a command: add 4+2i (3,-5)
```