# Calculator Interface Design

This document describes the design of the Calculator Interface, which allows the user to interact with the calculator. The interface will all reading user input, displaying options, and outputting calculator results.

## Requirements
- Take user input
- Display calculator options
- Display calculator results
- Command-Line interface

## Public Methods
***function CommandLineInterface()***

    Main method to control the command-line interface

## Private Methods
***function _TakeInput() result (input)***

    Method to read the command-line input from the user
        - Should also be able to interpret the other input syntaxes

***function _GiveOutput(output)***
    
    Method to output to the command line

***function _Validate(input) result(isValid)***

    Validates an input 