module complex_module
    implicit none

    type :: complex_number
        ! Type definition for a Complex Number, containing a real and imaginary 2-point precision float

        real(kind = 8) :: real, imag
        
    contains
        procedure :: print

    end type complex_number


contains

    function instantiate(real, imag) result (complexNumber)

        ! Instantiates a complex number from a real and imaginary integers

        ! Arguments:
        !     real (int): the real number
        !     imag (int): the imaginary number
        ! Returns:
        !     the instantiated complex number

        real(kind = 8), intent(in) :: real, imag
        type(complex_number) :: complexNumber

        complexNumber%real = real
        complexNumber%imag = imag

    end function instantiate

    function print(self, style) result (string)
        
        ! Creates a properly-styled string depending on the style

        ! Arguments:
        !     style (enumeration): 0 for (real, imag), 1 for real+imag
        ! Returns:
        !     the styled string representing the complex number

        implicit none

        class(complex_number), intent(in) :: self
        integer, intent(in) :: style

        character(len=256) :: string
        character(len=32) :: rstr, istr

        ! Convert numbers to strings 
        write(rstr, '(F0.4)') self%real 
        write(istr, '(F0.4)') self%imag

        select case (style)
        case (0)
            string = "(" // trim(rstr) // ", " // trim(istr) // ")"
        case (1)
            string = trim(rstr) // " + " // trim(istr) // "i"
        case default
            string = ""
        end select
        
    end function print

    function add(a, b) result(c)
        ! Adds two complex number objects together 

        ! Arguments:
        !     a (complex_number): one of the complex numbers to add
        !     b (complex_number): the other complex number to add
        ! Returns
        !     the resulting complex number
        
        implicit none

        ! Define the inputs a and b as explicitly input variables
        type(complex_number), intent(in) :: a, b

        ! Define the output c as a complex number
        type(complex_number) :: c

        ! Assign the components of c
        c%real = a%real + b%real
        c%imag = a%imag + b%imag
        
    end function add

    function subtract(a, b) result (c)

        ! Subracts b from a

        ! Arguments
        !     a (complex_number): the complex number to subtract the other from
        !     b (complex_number): the complex number to subtract from a
        ! Returns:
        !     the difference between a and b

        implicit none

        ! Define the inputs a and b as explicitly input variables
        type(complex_number), intent(in) :: a, b

        ! Define the output c as a complex number
        type(complex_number) :: c

        ! Assign the components of c
        c%real = a%real - b%real
        c%imag = a%imag - b%imag

    end function subtract

    function multiply(a, b) result (c)

        ! Multiplies a and b

        ! Arguments:
        !     a (complex_number): the first complex number to multiply
        !     b (complex_number): the second complex number to multiply
        ! Returns:
        !     the product of a and b

        implicit none

        ! Define the inputs a and b as explicitly input variables
        type(complex_number), intent(in) :: a, b

        ! Define the output c as a complex number
        type(complex_number) :: c

        ! Assign the components of c
        c%real = a%real * b%real - a%imag * b%imag 
        c%imag = a%real * b%imag + a%imag * b%real

    end function multiply

    function divide(a, b) result (c)

        ! Divides a and b

        ! Arguments:
        !     a (complex_number): the dividend
        !     b (complex_number): the divisor
        ! Returns:
        !     the quotient of a/b

        implicit none

        ! Define the inputs a and b as explicitly input variables
        type(complex_number), intent(in) :: a, b
        
        ! Define the output c as a complex number
        type(complex_number) :: c

        ! Define the denominator variable
        real(kind = 8) :: denom

        ! Create the denominator value
        denom = b%real*b%real + b%imag*b%imag 
        
        ! Assign the components of c
        c%real = (a%real*b%real + a%imag*b%imag) / denom 
        c%imag = (a%imag*b%real - a%real*b%imag) / denom

    end function divide

    function power(a, n) result (c)

        ! Finds a raised to the nth power

        ! Arguments:
        !     a (complex_number): the complex number we are raising to the nth power
        !     n (int): the 8-bit integer to raise a to
        ! Returns:
        !     a^n

        implicit none

        ! Define the inputs a and b as explicitly input variables
        type(complex_number), intent(in) :: a
        integer, intent(in) :: n
        
        ! Define the output c as a complex number
        type(complex_number) :: c
        
        ! Define the for-loop counter variable
        integer :: i

        ! Default the c values to 1 + 0i because a^0 = 1 + 0i
        c%real = 1.0_8
        c%imag = 0.0_8

        ! Loop to multiple c by a for every n power
        do i = 1, n
            c = multiply(c, a)
        end do

    end function power

    function conjugate(input) result (output)
        
        ! Calculate the conjugate of a complex number

        ! Arguments:
        !   input (complex_number): the complex number we want to find the conjugate of
        ! Returns:
        !   output (complex_number): the conjugate of the input

        implicit none

        ! Define the input and output types
        type(complex_number), intent(in) :: input
        type(complex_number) :: output

        ! Assign the real and imaginary values of the output
        output%real = input%real
        output%imag = input%imag * (-1)

    end function conjugate

end module complex_module
