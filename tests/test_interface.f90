module test_interface

    use cli

contains

    subroutine test_split()
        character(len = 256) :: splitChar, string, tokens(20)
        integer :: numTokens

        splitChar = "+"
        string = "4-2i"

        call split(splitChar, string, tokens, numTokens)

        if (numTokens - 1 >= 1e-6) then
            print *, "FAIL test_split:", numTokens 
            stop 1
        end if



    end subroutine test_split

    subroutine test_getNumbersPositiveImag()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag

        testString = "4+2i"

        call getNumbers(testString, testReal, testImag)

        if (testReal - 4 >= 1e-12) then
            print *, "FAIL: test_getNumbersPositiveImag", testReal 
            stop 1
        end if
        
        if (testImag - 2 >= 1e-12) then
            print *, "FAIL: test_getNumbersPositiveImag", testImag 
            stop 1
        end if

    end subroutine test_getNumbersPositiveImag
    
    subroutine test_getNumbersNegativeImag()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag

        testString = "4-2i"

        call getNumbers(testString, testReal, testImag)

        if (testReal - 4 >= 1e-12) then
            print *, "FAIL: test_getNumbersNegativeImag", testReal 
            stop 1
        end if
        
        if (testImag + 2 >= 1e-12) then
            print *, "FAIL: test_getNumbersNegativeImag", testImag 
            stop 1
        end if

    end subroutine test_getNumbersNegativeImag

    subroutine test_getNumbersPositiveReal()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag

        testString = "4-2i"

        call getNumbers(testString, testReal, testImag)

        if (testReal - 4 >= 1e-12) then
            print *, "FAIL: test_getNumbersPositiveReal", testReal 
            stop 1
        end if
        
        if (testImag - 2 >= 1e-12) then
            print *, "FAIL: test_getNumbersPositiveReal", testImag 
            stop 1
        end if

    end subroutine test_getNumbersPositiveReal
    
    subroutine test_getNumbersNegativeReal()

        character(len = 256) :: testString
        real(kind = 8) :: testReal, testImag

        testString = "-4-2i"

        call getNumbers(testString, testReal, testImag)

        if (testReal + 4 >= 1e-12) then
            print *, "FAIL: test_getNumbersNegativeReal ", testReal 
            stop 1
        end if
        
        if (testImag + 2 >= 1e-12) then
            print *, "FAIL: test_getNumbersNegativeReal ", testImag 
            stop 1
        end if

    end subroutine test_getNumbersNegativeReal

end module test_interface