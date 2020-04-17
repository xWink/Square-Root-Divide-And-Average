identification division.
program-id. sqrtbaby.

environment division.

data division.

working-storage section.
77 success      pic   9.
77 precision    pic   v9(5) value .00001.
77 temp         pic   s9(11)v9(6).
77 i            pic   s9999.
77 x            pic   9(11)v9(6).
77 y            pic   9(11)v9(6).
77 z            pic   9(11)v9(6).
77 out-y        pic   z(11)9.9(6).
77 in-z         pic   s9(10)v9(6) sign leading separate.

procedure division.
*> Gets user input infinitely until the user enters -1 to exit.
*> Performs error checking to ensure that the input is a positive real.
*> Failure to enter valid input leads the user to the first prompt.
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
            perform calculate-root
        end-if
    end-perform.

*> Calculates the root of z to a given precision, diff, using the
*> approximate-root paragraph. If 1000 attempts at getting the root
*> at the desired precision fails, the attempt is aborted with a message.
calculate-root.
    move 0 to success.
    compute x rounded = z / 2.
    perform approximate-root
        varying i from 1 by 1
        until i > 1000 or success = 1.
    if success = 0 then
        display "Attempt aborted, too many iterations"
    end-if.

*> Puts the approximate root of z in x using the 'divide and average' algorithm
approximate-root.
    compute y rounded = 0.5 * (x + z / x).
    compute temp = y - x.
    
    if temp < 0 then
        compute temp = - temp
    end-if.
    
    if temp / (y + x) <= precision then
        move y to out-y
        display "                 Square root: " out-y
        move 1 to success
    else
        move y to x
    end-if.
