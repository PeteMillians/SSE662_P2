
module cli

    implicit none

contains

    subroutine CommandLineInterface() 

        ! Main method to control the command-line interface

        implicit none

        character(len=256) :: input
        logical :: valid

        do
            input = TakeInput()
            valid = Validate(input)

            if (valid) then
                call GiveOutput(input)
            end if
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

        ! Placeholder logic
        isValid = .true.
    end function Validate

end module cli