module complex_module
    implicit none

    type :: complex_number
        ! Type definition for a Complex Number, containing a real and imaginary 2-point precision float

        real(kind = 8) :: real, imag
        
    contains
        procedure :: print

    end type complex_number


contains

    function instantiate(string, format) result (instance)

        ! Instantiates a complex number given the input string

        ! Arguments:
        !     string (str): the string describing the complex number
        !     format (int): 0 for (real, imag) and 1 for real + image
        ! Returns:    
        !     the instantiated complex number

        character(len=256), intent(in) :: string
        integer, intent(in) :: format

        character(len=:), allocatable :: s
        type(complex_number) :: instance
        character(len=64) :: realstr, imagstr 
        integer :: comma, pos, signpos

        ! Normalize input 
        s = adjustl(string) 
        s = s(1:len_trim(s))

        ! Check format
        if (format == 0) then   ! (real,imag)

            ! Remove parentheses 
            if (s(1:1) == '(' .and. s(len_trim(s):len_trim(s)) == ')') then 
                s = s(2:len_trim(s)-1) 
            end if 
            
            ! Split comma 
            comma = index(s, ",") 
            if (comma == 0) then 
                instance%real = 0.0_8 
                instance%imag = 0.0_8 
                return 
            end if 
            
            ! Part 1 = real, Part 2 = imag 
            realstr = s(1:comma-1) 
            imagstr = s(comma+1:len_trim(s)) 

            read(realstr, *) instance%real 
            read(imagstr, *) instance%imag
            
        else    ! real+imag

            ! Split + or - (find last sign not at position 1) 
            signpos = 0 
            
            do pos = len_trim(s)-1, 2, -1 
                if (s(pos:pos) == '+' .or. s(pos:pos) == '-') then 
                    signpos = pos 
                    exit 
                end if 
            end do 

            if (signpos == 0) then 
                
                ! No + or - → lone real number
                read(s, *) instance%real 
                instance%imag = 0.0_8 
                return 
            end if 
            
            ! Extract parts 
            realstr = s(1:signpos-1) 
            imagstr = s(signpos:len_trim(s)) 
            
            ! if Part has 'i', that is imag ! (we already removed trailing i above) 
            read(realstr, *) instance%real 

            read(imagstr, *) instance%imag

        end if  

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
            string = "(" // trim(rstr) // ", " // trim(istr) // "i)"
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
