program run_tests
    use test_interface
    use test_utility
    implicit none

    call test_split()
    call test_getNumbersPositiveImag_format0()
    call test_getNumbersNegativeImag_format0()
    call test_getNumbersPositiveReal_format0()
    call test_getNumbersNegativeReal_format0()
    call test_getNumbersPositiveImag_format1()
    call test_getNumbersNegativeImag_format1()
    call test_getNumbersPositiveReal_format1()
    call test_getNumbersNegativeReal_format1()
    call test_validate()

    print *, "All tests passed."
end program run_tests
