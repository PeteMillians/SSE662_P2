module cli
    
    use util
    implicit none

    integer :: format = 0
    
    
contains
    
    subroutine CommandLineInterface() 
        
        ! Main method to control the command-line interface
        
        implicit none
        
        character(len=256) :: input
        logical :: isContinue
        
        character(len = 400) :: outputStr
        
        isContinue = .true.
        
        do while (isContinue)
            ! Take the initial input
            call GiveOutput("Enter a command: ")
            input = TakeInput()
            
            ! Validate the input
            if (Validate(input)) then
                outputStr = Calculate(input)
            else
                outputStr = HelpMenu()
            end if
            
            call GiveOutput(outputStr)
            
            isContinue = checkContinue()
            
        end do
        
    end subroutine CommandLineInterface
    
    ! Private Methods
    function TakeInput() result (input)
        
        ! Method to read the command-line input from the user
        
        implicit none
        
        character(len = 256) :: input
        
        read(*, '(A)') input 
        
        ! Trim whitespace 
        input = trim(input)
        
    end function TakeInput
    
    subroutine GiveOutput(output)
        
        ! Method to output to the command line
        
        implicit none
        character(len=*), intent(in) :: output
        
        write(*,'(A)', advance='no') new_line('a') // output
        
    end subroutine GiveOutput
    
    function Validate(input) result(isValid)
        
        ! Validates an input

        use complex_module
        
        implicit none
        
        character(len=*), intent(in) :: input
        character(len = 64) :: tokens(20)
        integer :: n
        logical :: isValid
        
        ! Split the input by spaces
        call split(" ", input, tokens, n)
        
        ! Determine if the input is valid
        select case (tokens(1))
        case ("add")
            isValid = .true.
        case ("subtract")
            isValid = .true.
        case ("multiply")
            isValid = .true.
        case ("divide")
            isValid = .true.
        case ("exponent")
            isValid = .true.
        case ("format")
            isValid = .true.
        case default
            isValid = .false.
            
        end select
        
    end function Validate
    
    function checkContinue() result (isContinue)
        
        implicit none
        
        logical :: isContinue
        character(len=256) :: input
        
        call GiveOutput("Do you wish to continue (y/n): " )
        input = trim(TakeInput())
        
        
        if (input == 'y' .or. input == 'Y') then
            isContinue = .true.
        else
            isContinue = .false.
        end if
        
    end function checkContinue
    
    function HelpMenu() result (menu)
        
        ! Creates a string showing the help menu
        
        ! Returns:
        !     the help menu string
        
        character(len=400) :: menu 
        
        menu = &
        "Available commands:" // new_line('a') // &
        "  add               - Add two complex numbers" // new_line('a') // &
        "  subtract          - Subtract b from a" // new_line('a') // &
        "  multiply          - Multiply two complex numbers" // new_line('a') // &
        "  divide            - Divide a by b" // new_line('a') // &
        "  exponent          - Raise a to the nth power" // new_line('a') // &
        "  format            - Change output format. 0 = (real, imag), 1 = real + imag" // new_line('a') // &
        " Note*: Examples can be found in README.md" // new_line('a')
               
    end function HelpMenu
    
    function Calculate(input) result (answer)
        
        ! Performs the calculation on the input string
        
        ! Arguments:
        !     input (string): the user input
        ! Returns:
        !     the complex number answer
        
        use complex_module

        ! I/O Variables
        character(len = 256), intent(in) :: input
        character(len = 256) :: answer

        ! Variables used for calculations
        type(complex_number) :: a, b, result
        character(len=256) :: tokens(20)
        integer :: n
        real(kind = 8) :: a_real, a_imag, b_real, b_imag

        ! Split the input by spaces
        call split(" ", input, tokens, n)
        
        ! Determine if the input is valid
        select case (tokens(1))
        case ("add")
            ! Get the real and imaginary parts of the input numbers
            call getNumbers(tokens(2), a_real, a_imag)
            call getNumbers(tokens(3), b_real, b_imag)
            
            ! Instantiate complex_number a 
            a = instantiate(a_real, a_imag)
            
            ! Instantiate complex_number b
            b = instantiate(b_real, b_imag)
            
            ! Compute the addition of a and b
            result = add(a, b)

            ! Create the string for the result given the selected format
            answer = result%print(format)

        case ("subtract")
            ! Get the real and imaginary parts of the input numbers
            call getNumbers(tokens(2), a_real, a_imag)
            call getNumbers(tokens(3), b_real, b_imag)
            
            ! Instantiate complex_number a 
            a = instantiate(a_real, a_imag)
            
            ! Instantiate complex_number b
            b = instantiate(b_real, b_imag)

            ! Compute the difference between a and b
            result = subtract(a, b)
            
            ! Create the string for the result given the selected format
            answer = result%print(format)
            
        case ("multiply")
            ! Get the real and imaginary parts of the input numbers
            call getNumbers(tokens(2), a_real, a_imag)
            call getNumbers(tokens(3), b_real, b_imag)
            
            ! Instantiate complex_number a 
            a = instantiate(a_real, a_imag)

            ! Instantiate complex_number b
            b = instantiate(b_real, b_imag)
            
            ! Compute the difference between a and b
            result = multiply(a, b)
            
            ! Create the string for the result given the selected format
            answer = result%print(format)
            
        case ("divide")
            ! Get the real and imaginary parts of the input numbers
            call getNumbers(tokens(2), a_real, a_imag)
            call getNumbers(tokens(3), b_real, b_imag)
            
            ! Instantiate complex_number a 
            a = instantiate(a_real, a_imag)

            ! Instantiate complex_number b
            b = instantiate(b_real, b_imag)
            
            ! Compute the difference between a and b
            result = divide(a, b)

            ! Create the string for the result given the selected format
            answer = result%print(format)
            
        case ("exponent")
            ! Get the real and imaginary parts of the input numbers
            call getNumbers(tokens(2), a_real, a_imag)
            call getNumbers(tokens(3), b_real, b_imag)
            
            ! Instantiate complex_number a 
            a = instantiate(a_real, a_imag)

            ! Get the exponent b
            n = int(b_real)

            ! Compute the difference between a and b
            result = power(a, n)

            ! Create the string for the result given the selected format
            answer = result%print(format)
            
        case ("format")
            
            ! Update the format to the selected format
            read(tokens(2), *) format

        end select
    
    end function Calculate
    
end module cli