
module cli

    implicit none

contains

    subroutine CommandLineInterface() 

        ! Main method to control the command-line interface

        implicit none

        character(len=256) :: input
        logical :: valid
        logical :: isContinue

        isContinue = .true.

        do while (isContinue)
            ! Take the initial input
            input = TakeInput()

            ! Validate the input
            valid = Validate(input)

            if (valid) then
                call GiveOutput(input)
            else
                write(*, '(A)', advance='no') "Invalid command. Please try again... " 
            end if

            isContinue = checkContinue()

        end do

    end subroutine CommandLineInterface

    ! Private Methods
    function TakeInput() result (input)

        ! Method to read the command-line input from the user
        !     - Should also be able to interpret the other input syntaxes

        implicit none

        character(len = 256) :: input

        write(*, '(A)', advance='no') "Enter a command: " 
        read(*, '(A)') input 

        ! Trim whitespace 
        input = trim(input)
            
    end function TakeInput

    subroutine GiveOutput(output)

        ! Method to output to the command line

        implicit none
        character(len=*), intent(in) :: output

        write(*,'(A)') output
        
    end subroutine GiveOutput

    function Validate(input) result(isValid)

        ! Validates an input

        implicit none
        
        character(len=*), intent(in) :: input
        logical :: isValid

        ! Determine if the input is valid
        select case (input)
        case ("+")
            write(*, '(A)') "Addition selected"
            isValid = .true.
        
        end select
        
        
    end function Validate

    function checkContinue() result (isContinue)

        implicit none

        logical :: isContinue
        character(len=256) :: input

        write(*, '(A)', advance='no') "Do you wish to continue (y/n): " 
        read(*, '(A)') input

        input = trim(input)

        if (input == 'y' .or. input == 'Y') then
            isContinue = .true.
        else
            isContinue = .false.
        end if


    end function checkContinue

end module cli