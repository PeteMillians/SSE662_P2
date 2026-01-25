module util
    use complex_module
    implicit none

contains

    subroutine split(partition, input, tokens, numTokens)

        ! Splits the input string by the partition

        ! Arguments:
            ! partition (str): the string we are splitting the input by
            ! input (str): the input string we are splitting
            ! tokens (array): an array of split strings
            ! numTokens (integer): the number of tokens after the split

        implicit none
        character(len=*), intent(in) :: partition, input
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
            do while (i <= lenline .and. input(i:i) == partition)

                i = i + 1

            end do

            if (i > lenline) exit

            ! Start of a token
            start = i

            ! Move until next space
            do while (i <= lenline .and. input(i:i) /= partition)
                i = i + 1
            end do

            ! Add one to the number of found tokens
            numTokens = numTokens + 1

            ! Save this substring in the array of tokens
            tokens(numTokens) = input(start : i - 1)

        end do

    end subroutine split

    subroutine getNumbers(string, realNum, imagNum)

        ! Splits the number string into a real and an imaginary piece

        ! Arguments:
        !     input (str): the input string we are splitting
        ! Returns:
        !     realNum (float): the real part of the string
        !     imagNum (float): the imaginary part of the string

        ! I/O Variables
        character(len = 256), intent(in) :: string
        real(kind = 8) :: realNum, imagNum
        
        ! Trimmed string
        character(len = 256) :: trimmed

        ! Character index variable
        integer :: ind
        
        ! Trim space padding
        trimmed = trim(string)

        ! Check for ()
        ind = index(trimmed, "(")
        
        ! Check if the ( exists
        if (ind /= 0) then
            call getNumbers_format0(trimmed, realNum, imagNum)
        else 
            call getNumbers_format1(trimmed, realNum, imagNum)
        end if

    end subroutine getNumbers

    subroutine getNumbers_format0(string, realNum, imagNum)

        ! Logic for interpreting real and imaginary numbers in a format 0 string

        ! Arguments:
            ! string (str): the string containing the complex number
        ! Returns:
            ! realNum (float): the real number in the complex number
            ! imagNum (float): the imaginary number in the complex number

        character(len = 256), intent(in) :: string
        real(kind = 8) :: realNum, imagNum

        ! Split information
        character(len=256) :: tokens(2)     ! There will be at most 2 tokens
        integer :: numTokens

        character(len = 256) :: trimmed
        integer :: ind
        
        ind = index(string, "(")
        
        ! Remove the parentheses from the number string
        trimmed = string(ind + 1 :)

        ind = index(trimmed, ")")

        trimmed = trimmed(1 : ind - 1)
        
        ! Find the index of the comma
        call split(",", trimmed, tokens, numTokens)

        read(tokens(1), *) realNum
        read(tokens(2), *) imagNum

    end subroutine getNumbers_format0

    subroutine getNumbers_format1(string, realNum, imagNum)

        ! Logic for interpreting real and imaginary numbers in a format 1 string

        ! Arguments:
            ! string (str): the string containing the complex number
        ! Returns:
            ! realNum (float): the real number in the complex number
            ! imagNum (float): the imaginary number in the complex number
    
        character(len = 256), intent(in) :: string
        real(kind = 8) :: realNum, imagNum
    
        ! Split information
        character(len=256) :: tokens(2)     ! There will be at most 2 tokens
        integer :: numTokens
    
        character(len = 256) :: trimmed

        trimmed = trim(string)

        ! Split the string around the plus sign
        call split("+", trimmed, tokens, numTokens)

        if (numTokens /= 1) then    ! If there is a plus sign

            call getNumbers_positiveImag(tokens(1), tokens(2), realNum, imagNum)

        else    ! Could be just a real, just an imag, or minus sign

            call getNumbers_negativeImag(trimmed, realNum, imagNum)
            
        end if

    end subroutine getNumbers_format1

    subroutine getNumbers_positiveImag(first, second, realNum, imagNum)

        ! Logic to get the real and imaginary numbers in a complex number if the imaginary number is positive

        ! Arguments:
        !     first (str): the token containing the real number
        !     second (str): the token containing the imaginary number
        ! Returns:
        !     realNum (float): the real number
        !     imagNum (float): the imaginary number

        character(len = 256), intent(in) :: first, second
        real(kind = 8) :: realNum, imagNum
        integer :: ind
        
        ! Save the real number
        read(first, *) realNum

        
        ! Remove the trailing i
        ind = index(second, "i")
        read(second(1 : ind - 1), *) imagNum

    end subroutine getNumbers_positiveImag

    subroutine getNumbers_negativeImag(string, realNum, imagNum)

        ! Logic to get the real and imaginary numbers in a complex number if the imaginary number is negative

        ! Arguments:
        !     first (str): the token containing the real number
        !     second (str): the token containing the imaginary number
        ! Returns:
        !     realNum (float): the real number
        !     imagNum (float): the imaginary number
        
        character(len = 256), intent(in) :: string
        real(kind = 8) :: realNum, imagNum
        integer :: ind

        ! Split information
        character(len=256) :: tokens(2)     ! There will be at most 2 tokens
        integer :: numTokens

        call split("-", string, tokens, numTokens)
            
        if (numTokens /= 1) then    ! If negative real part
            
            ! Save the real number
            read(tokens(1), *) realNum
            
            ! Check if the real value is negative
            if (index(string, "-") == 1) then
                realNum = realNum * (-1)
            end if
            
            ! Remove the trailing i
            ind = index(tokens(2), "i")
            read(tokens(2)(1 : ind - 1), *) imagNum
            imagNum = imagNum * (-1)

        else    ! No signs, so either a real or an imag

            ! Determine if real or imag
            ind = index(string, "i")

            if (ind /= 0) then  ! An i is present, so imaginary

                realNum = 0.0_8
                read(string(1 : ind - 1), *) imagNum
            else
                
                ! Just a real number
                read(string, *) realNum
                imagNum = 0.0_8

            end if

        end if

    end subroutine getNumbers_negativeImag
    
end module util