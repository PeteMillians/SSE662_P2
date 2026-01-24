program run_tests
    use test_interface
    implicit none

    call test_split()
    call test_getNumbersPositiveImag()
    call test_getNumbersNegativeImag()
    call test_getNumbersPositiveReal()
    call test_getNumbersNegativeReal()

    print *, "All tests passed."
end program run_tests
