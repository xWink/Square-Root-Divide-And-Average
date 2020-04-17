identification division.
program-id. sqrtbabyex.

environment division.

data division.

working-storage section.
77 precision  pic   s9(10)v9(5) value .00001.
77 y          pic   9(11)v9(6).
77 z          pic   9(11)v9(6).
77 out-y      pic   z(11)9.9(6).
77 in-z       pic   s9(10)v9(6) sign leading separate.

procedure division.
*> Gets user input infinitely until the user enters 0 to exit.
*> Performs error checking to ensure that the input is a positive real.
*> Failure to enter valid input leads the user to the first prompt.
*> Valid input leads to the squareroot function to be called.
*> The root is stored in the y picture.
*> Root is then printed for the user.
get-input.
    perform forever
        display "Enter a positive number to square root or 0 to exit"
        accept in-z
        if in-z = 0 then
            stop run
        else if in-z < 0 then
            display "                 Invalid input"
        else
            move in-z to z
            call "squareroot" using z, y, precision
            move y to out-y
            display "                 Square root: " out-y
        end-if
    end-perform.
