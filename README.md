# Square-Root-Divide-And-Average
A Cobol square root calculator using the Divide and Average algorithm

#### Contained in this folder are two programs:
* sqrtbaby.cob
* sqrtbabyex.cob + squareroot.cob

## How to Use sqrtbaby.cob:

1. Compile with `cobc -x -free sqrtbaby.cob`
2. Run with `./sqrtbaby`
3. Input a positive real number to square root or 0 to exit
4. Program will calculate square root with up to 1000 iterations of the algorithm. On success, the program outputs the square root. Otherwise, it outputs an abort message.

#### Example:
Input: `10`

Output: `Square root: 3.162278`

## How to Use sqrtbabyex.cob:

1. Compile with `cobc -x -free sqrtbabyex.cob squareroot.cob`
2. Run with `./sqrtbabyex`
3. Input a positive real number to square root or 0 to exit
4. Program will calculate square root with up to 1000 iterations of the algorithm. On success, the program outputs the square root. Otherwise, it outputs an abort message.

#### Example:
Input: `999123`

Output: `Square root: 999.561404`
