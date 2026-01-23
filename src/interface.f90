
module cli
    
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
        call split(input, tokens, n)
        
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

        character(len = 256), intent(in) :: input
        character(len = 256) :: answer

        type(complex_number) :: a, b, result
        character(len=64) :: tokens(20)
        integer :: n, i

        ! Split the input by spaces
        call split(input, tokens, n)
        
        ! Determine if the input is valid
        select case (tokens(1))
        case ("add")
            a = instantiate(tokens(2), format)
            b = instantiate(tokens(3), format)
            result = add(a, b)
            answer = result%print(format)

        case ("subtract")
            a = instantiate(tokens(2), format)
            b = instantiate(tokens(3), format)
            result = subtract(a, b)
            answer = result%print(format)

        case ("multiply")
            a = instantiate(tokens(2), format)
            b = instantiate(tokens(3), format)
            result = multiply(a, b)
            answer = result%print(format)

        case ("divide")
            a = instantiate(tokens(2), format)
            b = instantiate(tokens(3), format)
            result = divide(a, b)
            answer = result%print(format)

        case ("exponent")
            a = instantiate(tokens(2), format)
            read(tokens(3), *) i
            result = power(a, i)
            answer = result%print(format)

        case ("format")
            read(tokens(2), *) format

        end select
    
    end function Calculate

    subroutine split(input, tokens, numTokens)

        ! Splits the input string by space

        ! Arguments:
            ! input (str): the input string we are splitting
            ! tokens (array): an array of split strings
            ! numTokens (integer): the number of tokens after the split

        implicit none
        character(len=*), intent(in) :: input
        character(len=*), dimension(:), intent(out) :: tokens
        integer, intent(out) :: numTokens

        integer :: i, start, lenline

        ! Initialize numTokens to 0
        numTokens = 0

        ! Trim input 
        lenline = len_trim(input)
        i = 1

        ! Search through each character in the line
        do while (i <= lenline)

            ! Skip leading spaces
            do while (i <= lenline .and. input(i:i) == ' ')

                i = i + 1

            end do

            if (i > lenline) exit

            ! Start of a token
            start = i

            ! Move until next space
            do while (i <= lenline .and. input(i:i) /= ' ')
                i = i + 1
            end do

            ! Add one to the number of found tokens
            numTokens = numTokens + 1

            ! Save this substring in the array of tokens
            tokens(numTokens) = input(start : i - 1)

        end do

    end subroutine split

    
end module cli