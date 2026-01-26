module test_utility

    use util

contains

    subroutine test_split()
        character(len = 256) :: splitChar, string, tokens(20)
        integer :: numTokens

        splitChar = "+"
        string = "4-2i"

        call split(splitChar, string, tokens, numTokens)

        if (numTokens - 1 >= 1e-6 .or. error /= 0) then
            print *, "FAIL test_split:", numTokens 
            stop 1
        end if

        splitChar = "-"

        call split(splitChar, string, tokens, numTokens)

        if (numTokens - 2 >= 1e-6 .or. error /= 0) then
            print *, "FAIL test_split:", numTokens 
            stop 1
        end if

        splitChar = "-"
        string = "-4-2i"

        call split(splitChar, string, tokens, numTokens)

        if (numTokens - 3 >= 1e-6 .or. error /= 0) then
            print *, "FAIL test_split:", numTokens 
            stop 1
        end if

    end subroutine test_split

    subroutine test_getNumbersPositiveImag_format1()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "4+2i"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal - 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveImag_format1 ", testReal 
            stop 1
        end if
        
        if (testImag - 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveImag_format1 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersPositiveImag_format1
    
    subroutine test_getNumbersNegativeImag_format1()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "-4-2i"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal + 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeImag_format1 ", testReal 
            stop 1
        end if
        
        if (testImag + 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeImag_format1 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersNegativeImag_format1

    subroutine test_getNumbersPositiveReal_format1()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "4-2i"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal - 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveReal_format1 ", testReal 
            stop 1
        end if
        
        if (testImag + 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveReal_format1 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersPositiveReal_format1
    
    subroutine test_getNumbersNegativeReal_format1()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "-4+2i"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal + 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeReal_format1 ", testReal 
            stop 1
        end if
        
        if (testImag - 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeReal_format1 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersNegativeReal_format1

    subroutine test_getNumbersPositiveImag_format0()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "(-4,2)"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal - 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveImag_format0 ", testReal 
            stop 1
        end if
        
        if (testImag - 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveImag_format0 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersPositiveImag_format0
    
    subroutine test_getNumbersNegativeImag_format0()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "(4,-2)"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal - 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeImag_format0 ", testReal 
            stop 1
        end if
        
        if (testImag + 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeImag_format0 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersNegativeImag_format0

    subroutine test_getNumbersPositiveReal_format0()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "(4,2)"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal - 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveReal_format0 ", testReal 
            stop 1
        end if
        
        if (testImag - 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersPositiveReal_format0 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersPositiveReal_format0
    
    subroutine test_getNumbersNegativeReal_format0()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag
        integer :: error

        testString = "(-4,-2)"

        call getNumbers(testString, testReal, testImag, error)

        if (testReal + 4 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeReal_format0 ", testReal 
            stop 1
        end if
        
        if (testImag + 2 >= 1e-12 .or. error /= 0) then
            print *, "FAIL: test_getNumbersNegativeReal_format0 ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersNegativeReal_format0

end module test_utility