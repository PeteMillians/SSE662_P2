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

***function GiveOutput(output)***
    
    Method to output to the command line

***function Validate(input) result(isValid)***

    Method to validate an input command

    Arguments:
        input (string): the input that the user entered in the command lne
    Returns:
        isValid (logical): true if valid, false otherwise

***function HelpMenu() result (menu)***

    Creates a string showing the help menu

    Returns:
        the help menu string

***function Calculate(input) result (answer)***

    Performs the calculation on the input string

    Arguments:
        input (string): the user input
    Returns:
        the complex number answer

***subroutine split(input, tokens, numTokens)***

    Splits the input string by space

    Arguments:
        input (str): the input string we are splitting
        tokens (array): an array of split strings
        numTokens (integer): the number of tokens after the split

***subroutine getNumbers(string, real, imag)***

    Splits the number string into a real and an imaginary piece

    Arguments:
        input (str): the input string we are splitting
        real (float): the real part of the string
        imag (float): the imaginary part of the string

***function checkContinue() result (isContinue)***

    Checks if the user wants to continue or quit

    Returns:
        true if the user wants to continue, false otherwise