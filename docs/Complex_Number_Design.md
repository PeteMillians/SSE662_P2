# Complex Number Design

This document describes the design of the Complex Number type, which is a custom datatype to describe a complex number. A complex number contains a real and imaginary component (though either component can be 0 and omitted). This data class is used by the calculator.

## Requirements
- Contain a real component
- Contain an imaginary component
- 8-byte precision
- Built-in class methods:
    - I/O Functions - formatting 
    - Calculator Functions:
        - Add
        - Subtract
        - Multiply
        - Divide
        - Power

## Methods
***type complex_number***

    Type definition for a Complex Number, containing a real and imaginary 2-point precision float

***function add(a, b) result (c)***
    
    Adds two complex number objects together 

    Arguments:
        a (complex_number): one of the complex numbers to add
        b (complex_number): the other complex number to add
    Returns
        the resulting complex number

***function subtract(a, b) result (c)***

    Subracts b from a

    Arguments
        a (complex_number): the complex number to subtract the other from
        b (complex_number): the complex number to subtract from a
    Returns:
        the difference between a and b

***function multiply(a, b) result (c)***

    Multiplies a and b

    Arguments:
        a (complex_number): the first complex number to multiply
        b (complex_number): the second complex number to multiply
    Returns:
        the product of a and b

***function divide(a, b) result (c)***

    Divides a and b

    Arguments:
        a (complex_number): the dividend
        b (complex_number): the divisor
    Returns:
        the quotient of a/b
    
***function power(a, n) result (c)***

    Finds a raised to the nth power

    Arguments:
        a (complex_number): the complex number we are raising to the nth power
        n (int): the 8-bit integer to raise a to
    Returns:
        a^n