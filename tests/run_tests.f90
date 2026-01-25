program run_tests
    use test_interface
    use test_utility
    implicit none

    ! Utility tests
    call test_split()
    call test_getNumbersPositiveImag_format0()
    call test_getNumbersNegativeImag_format0()
    call test_getNumbersPositiveReal_format0()
    call test_getNumbersNegativeReal_format0()
    call test_getNumbersPositiveImag_format1()
    call test_getNumbersNegativeImag_format1()
    call test_getNumbersPositiveReal_format1()
    call test_getNumbersNegativeReal_format1()

    ! Interface Tests
    call test_validate()
    call test_add()
    call test_subtract()
    call test_multiply()
    call test_divide()
    call test_power()
    call test_conjugate()
    call test_format()

    print *, "All tests passed."
end program run_tests
