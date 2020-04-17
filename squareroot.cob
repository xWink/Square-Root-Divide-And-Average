*> Name: Shawn Kaplan
*> ID: 0966499
*> Email: skaplan@uoguelph.ca
*>
*> This is a function that calculates the square root of a value, "z",
*> up to a precision, "precision", and stores the result in "y".
identification division.
program-id. squareroot.

environment division.

data division.
working-storage section.
77 success      pic   9.
77 temp         pic   s9(11)v9(6).
77 i            pic   s9999.
77 x            pic   9(11)v9(6).

linkage section.
77 z            pic   9(11)v9(6).
77 y            pic   9(11)v9(6).
77 precision    pic   s9(10)v9(5).

procedure division using z, y, precision.
*> Calculates the root of "z" to a given precision, "precision", using the
*> approximate-root paragraph. If 1000 attempts at getting the root
*> at the desired precision fails, the attempt is aborted with a message.
calculate-root.
    move 0 to success.
    compute x rounded = z / 2.
    
    perform approximate-root
        with test before
        varying i from 1 by 1
        until i > 1000 or success = 1.
    if success = 0 then
        display "Aborting - too many iterations"
    end-if.
go-back.

*> Puts the approximate root of z in x using the 'divide and average' algorithm
approximate-root.
    compute y rounded = 0.5 * (x + z / x).
    compute temp = y - x.

    if temp < 0 then
        compute temp = - temp
    end-if.

    if temp / (y + x) <= precision then
        move 1 to success
    else
        move y to x
    end-if.
