# Complex Number Calculator in FORTRAN

The Complex Number Calculator is a FORTRAN-operated command-line-interface powered tool used to perform calculations between complex numbers. This calculator is functional with purely-real components and purely-imaginary components. 

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
| Feature | Example |
| ------- | ------- |
| Addition | add a b|
| Subtraction | subtract a b |
| Multiplication | multiply a b|
| Division | divide a b |
| Exponents | power a n |
| Conjugation | conjugate a |

*Note: Each of these functions work with complex numbers*

To use any function in the calculator, enter the command you wish to apply followed by your two values, each separated by a space. To create a readable complex number, there are two valid formats:
- real+imagi
- (real,imag)

#### ----**Note: Complex numbers cannot contain spaces**----

The following table describes the possible formats to input complex numbers:

| Format | Example |
| ------ | ------- |
| real+imagi | 2+3i |
| (real,imag) | (2,3) |


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

## Subtraction
To use the subtraction tool in the Complex Number Calculator, precede your complex numbers with the keyword **subtract**:

```
Enter a command: subtract 4+2i (3,-5)
```

## Multiplication
To use the multiplication tool in the Complex Number Calculator, precede your complex numbers with the keyword **multiply**:

```
Enter a command: multiply 4+2i (3,-5)
```

## Division
To use the division tool in the Complex Number Calculator, precede your complex numbers with the keyword **divide**:

```
Enter a command: divide 4+2i (3,-5)
```

## Power
To use the power tool in the Complex Number Calculator, precede your complex number and power integer with the keyword **power**:

```
Enter a command: power 4+2i -5
```

## Format
Formatting in the Complex Number Calculator is used to change the output format from the calculator. The default format, format 0, outputs any answer in the following format:

```
(real, imag)
```

However, the user can change the format to format 1 to display the output in the following format:

```
real + imag
```

To use the format tool in the Complex Number Calculator, precede your format choice with the keyword **format**:

```
Enter a command: format 0
```