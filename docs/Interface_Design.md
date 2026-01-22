# Calculator Interface Design

This document describes the design of the Calculator Interface, which allows the user to interact with the calculator. The interface will all reading user input, displaying options, and outputting calculator results.

## Requirements
- Take user input
- Display calculator options
- Display calculator results
- Command-Line interface

## Interface Design
1) Ask the user to input a complex number
2) Ask the user to input an operator
3) Ask the user to input another complex number
4) Provide answer
5) Ask if the user wishes to continue
6) If so, show the answer and prompt the user for an operator
7) If not, close the program

## Public Methods
***function CommandLineInterface()***

    Main method to control the command-line interface

## Private Methods
***function TakeInput() result (input)***

    Method to read the command-line input from the user
        - Should also be able to interpret the other input syntaxes

***function GiveOutput(output)***
    
    Method to output to the command line

***function validateOperator(input) result(isValid)***

    Validates an input 

    Arguments:
        input (string): the user input
    Returns:
        true if valid, false otherwise

***function checkContinue() result (isContinue)***

    Checks if the user wants to continue or quit

    Returns:
        true if the user wants to continue, false otherwise

***function validateNumber(input) result (isValid)***

    Checks if the input complex number is valid

    Arguments:
        input (string): the user input
    Returns:
        true if valid, false otherwise