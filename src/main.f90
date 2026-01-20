program main
    use complex_module
    implicit none

    type(complex_number) :: a, b, c
    integer :: n

    ! Initialize two complex numbers
    a%real = 3.0_8
    a%imag = 4.0_8

    b%real = 1.0_8
    b%imag = 2.0_8

    ! Add them
    c = a%add(b)
    print *, "a + b =", c%real, c%imag

    ! Multiply them
    c = a%multiply(b)
    print *, "a * b =", c%real, c%imag

    ! Raise a to the 3rd power
    n = 3
    c = a%power(n)
    print *, "a^3 =", c%real, c%imag

end program main
