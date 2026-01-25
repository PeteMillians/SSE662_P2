module test_interface

    use cli

contains

    subroutine test_validate()
        character(len = 256) :: input

        input = "add 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "subtract 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "multiply 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "divide 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "exponent 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "format 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "asdasd"

        if (Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

    end subroutine test_validate
end module test_interface