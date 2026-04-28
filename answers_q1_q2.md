# Exercise 2: Questions 1 and 2

## Question 1: Functional List Operations

All functions are implemented in `Question1_2.hs` and tested from the single
`main` method in the same file.

### a) Sum and multiply by 5

`sumTimesFive` first applies Haskell's built-in `sum` to the input list and then
multiplies the result by `5`.

Example:

```haskell
sumTimesFive [1,2,3,4] == 50
```

### b) Split even and odd indices

`splitEvenOddIndices` treats the first element as index `0`, so it goes into the
even-index list. The function recursively consumes two elements at a time: the
first goes to the even list, the second goes to the odd list.

Example:

```haskell
splitEvenOddIndices [1,2,3,4,5] == ([1,3,5],[2,4])
```

### c) Reverse middle of a string

`reverseMiddle` keeps the first and last characters unchanged and reverses only
the characters between them. Empty strings and one-character strings are returned
unchanged.

Example:

```haskell
reverseMiddle "Haskell" == "Hleksal"
```

### d) Perfect square

`isPerfectSquare` rejects non-positive input. For positive input, it calculates
the integer part of the square root and checks whether squaring it gives the
original number.

Example:

```haskell
isPerfectSquare 16 == True
isPerfectSquare 20 == False
```

### e) Count even numbers

`countEvenNumbers` uses a list comprehension to keep only even values and then
counts the length of that list.

Example:

```haskell
countEvenNumbers [1..10] == 5
```

### f) GCD of three integers

`gcdThree` uses the fact that the greatest common divisor can be applied step by
step:

```haskell
gcdThree a b c = gcd (gcd a b) c
```

Example:

```haskell
gcdThree 24 60 96 == 12
```

### g) Perfect numbers below 10000

`properDivisors` finds all positive divisors smaller than the number itself.
`perfectNumbersBelow10000` then keeps exactly those numbers that equal the sum
of their proper divisors.

Result:

```haskell
[6,28,496,8128]
```

## Question 2: Simple Infinite Lists

### a) Infinite list of multiples of 3

The list is defined as:

```haskell
multiplesOfThree = [3, 6 ..]
```

The first 15 values are:

```haskell
[3,6,9,12,15,18,21,24,27,30,33,36,39,42,45]
```

Lazy evaluation is useful here because the full infinite list is never computed.
Haskell only evaluates as many elements as are actually requested. For example,
`take 15 multiplesOfThree` only asks for the first 15 elements, so the program
can work with an infinite definition without running forever.

### b) Infinite list of natural numbers and their squares

The function is:

```haskell
numberSquarePairs = [(n, n * n) | n <- [1 ..]]
```

The first 10 pairs are:

```haskell
[(1,1),(2,4),(3,9),(4,16),(5,25),(6,36),(7,49),(8,64),(9,81),(10,100)]
```

### c) Numbers divisible by both 3 and 5

Numbers divisible by both `3` and `5` are multiples of `15`, so the infinite list
can be written directly:

```haskell
divisibleByThreeAndFive = [15, 30 ..]
```

The first 15 values are:

```haskell
[15,30,45,60,75,90,105,120,135,150,165,180,195,210,225]
```
