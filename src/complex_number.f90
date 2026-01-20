module complex_module
    implicit none

    type :: complex_number
        ! Type definition for a Complex Number, containing a real and imaginary 2-point precision float

        real(kind = 8) :: real, imag

    contains

        procedure :: add
        procedure :: subtract
        procedure :: multiply
        procedure :: divide
        procedure :: power

    end type complex_number

contains

    function add(a, b) result(c)
        ! Adds two complex number objects together 

        ! Arguments:
        !     a (complex_number): one of the complex numbers to add
        !     b (complex_number): the other complex number to add
        ! Returns
        !     the resulting complex number
        
        ! Define the inputs a and b as explicitly input variables
        class(complex_number), intent(in) :: a, b

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

        ! Define the inputs a and b as explicitly input variables
        class(complex_number), intent(in) :: a, b

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

        ! Define the inputs a and b as explicitly input variables
        class(complex_number), intent(in) :: a, b

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

        ! Define the inputs a and b as explicitly input variables
        class(complex_number), intent(in) :: a, b
        
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

        ! Define the inputs a and b as explicitly input variables
        class(complex_number), intent(in) :: a
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

end module complex_module
