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

        input = "power 2 4"

        if (.not. Validate(input)) then
            print *, "FAIL: test_validate: ", input 
            stop 1
        end if

        input = "format 1"

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

    subroutine test_subtract()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "subtract 4-2i 4+3i"

        answer = Calculate(input)

        if (answer /= "(.0000, -5.0000)") then
            print *, "FAIL test_subtract: ", answer 
            stop 1

        end if

        input = "subtract (3,2) (-3,70.5)"

        answer = Calculate(input)

        if (answer /= "(6.0000, -68.5000)") then
            print *, "FAIL test_subtract: ", answer 
            stop 1

        end if

    end subroutine test_subtract

    subroutine test_multiply()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "multiply 4-2i 4+3i"

        answer = Calculate(input)

        if (answer /= "(22.0000, 4.0000)") then
            print *, "FAIL test_multiply: ", answer 
            stop 1

        end if

        input = "multiply (3,2) (-3,70.5)"

        answer = Calculate(input)

        if (answer /= "(-150.0000, 205.5000)") then
            print *, "FAIL test_multiply: ", answer 
            stop 1

        end if

    end subroutine test_multiply

    subroutine test_divide()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "divide 4-2i 4+3i"

        answer = Calculate(input)

        if (answer /= "(.4000, -.8000)") then
            print *, "FAIL test_divide: ", answer 
            stop 1

        end if

        input = "divide (3,2) (-3,70.5)"

        answer = Calculate(input)

        if (answer /= "(.0265, -.0437)") then
            print *, "FAIL test_divide: ", answer 
            stop 1

        end if

    end subroutine test_divide

    subroutine test_power()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "power 4-2i 3"

        answer = Calculate(input)

        if (answer /= "(16.0000, -88.0000)") then
            print *, "FAIL test_power: ", answer 
            stop 1

        end if

        input = "power (3,2) -1"

        answer = Calculate(input)

        if (answer /= "(.2308, -.1538)") then
            print *, "FAIL test_power: ", answer 
            stop 1

        end if

    end subroutine test_power

    subroutine test_conjugate()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "conjugate 4-2i"

        answer = Calculate(input)

        if (answer /= "(4.0000, 2.0000)") then
            print *, "FAIL test_conjugate: ", answer 
            stop 1

        end if

        input = "conjugate (3,2)"

        answer = Calculate(input)

        if (answer /= "(3.0000, -2.0000)") then
            print *, "FAIL test_conjugate: ", answer 
            stop 1

        end if

    end subroutine test_conjugate

    subroutine test_format()

        character(len = 256) :: input
        character(len = 256) :: answer

        input = "format 0"

        answer = Calculate(input)

        input = "add (1,1) (2,2)"

        answer = Calculate(input)

        if (answer /= "(3.0000, 3.0000)") then
            print *, "FAIL test_format: ", answer 
            stop 1

        end if

        input = "format 1"

        answer = Calculate(input)

        input = "add (1,1) (2,2)"

        answer = Calculate(input)

        if (answer /= "3.0000 + 3.0000i") then
            print *, "FAIL test_format: ", answer 
            stop 1

        end if

    end subroutine test_format

end module test_interface