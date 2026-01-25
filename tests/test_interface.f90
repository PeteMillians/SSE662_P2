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

    !--------------------!
    !   Calculate Tests  !
    !--------------------!
    subroutine test_add()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "add 4-2i 4+3i"

        answer = Calculate(input)

        if (answer /= "(8.0000, 1.0000)") then
            print *, "FAIL test_add: ", answer 
            stop 1

        end if

        input = "add (3,2) (-3,70.5)"

        answer = Calculate(input)

        if (answer /= "(.0000, 72.5000)") then
            print *, "FAIL test_add: ", answer 
            stop 1

        end if

    end subroutine test_add

end module test_interface