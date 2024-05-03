Individual Homework 1
================

## Roles for this assignment:

## Please push your assignment to GitHub by 10:00pm (Central) Monday, Apr 1.

You are currently in the GitHub repository (repo) for `hw1-username`.
The assignment prompt is shown below (i.e. in `README.Rmd`). You can
view this online in your homework 1 GitHub repository as a Markdown
file(`README.md`) or a pdf.

Please **use `hw1.Rmd` to complete this assignment**. Be sure to **knit
your file to PDF before your final push to GitHub**.

## Homework process

For help on the homework process, review

- [Assignments in Stat
  220](https://stat220-spring24.netlify.app/assignments) for
  content/formatting questions.

- [GitHub Guide for Students in Stat
  220](https://stat220-spring24.netlify.app/github_tutorial) for Git and
  Github instructions.

When you are done with your homework, **don’t forget to push your
changes to ALL files back to GitHub!** This means you should commit and
push all related files, not just your final PDF. Additionally, ensure
you post the link to your **GitHub repository to Gradescope for the
final submission and grading**. This step is crucial as it allows for a
comprehensive review of both your code and the rendered output.

------------------------------------------------------------------------

## Assignment prompt

## Problem 1: Markdown output

Consider the following code chunks (as shown in the .md or pdf), but
*don’t* add them to your homework write-up

    ```{r chunk1}
    x <- 1:3
    ```

    ```{r chunk2}
    x <- x + 1
    ```

    ```{r}
    x
    ```

### a.

What output is produced when all three chunks include the option
`echo = FALSE`. Explain your answer in words, not by adding these
options to chunks above.

### b.

What output is produced when all three chunks include the option
`echo = FALSE` **and** `chunk2` includes the options `eval=FALSE`.
Explain your answer in words, not by adding these options to chunks
above.

------------------------------------------------------------------------

## Problem 2: Logical vectors

Suppose we have a list of food (carrot, orange, m&m, apple, candy corn)
that we characterize by color (orange or not) and candy (candy or not).
Here are the data vectors describing each food:

``` r
orange <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
candy <- c(FALSE, FALSE, TRUE, FALSE, TRUE)
table(orange, candy)
```

### a.

What type of food does the product of these vectors represent?
(e.g. what does `x` of 0 mean? what does 1 mean?)

``` r
x <- orange*candy
x
```

### b.

What type of food does the vector `y` represent? (e.g. what does `y` of
0 mean? what does 1 mean?)

``` r
y <- (1-orange)*(1-candy)
y
```

### c. 

What type of food does the vector `z` represent? (e.g. what does `z` of
0 mean? 1?)

``` r
z <- orange*(1-candy)
```

------------------------------------------------------------------------

## Problem 3: Coercion

Suppose that the follow objects are defined:

    obj1 <- 2:10
    obj2 <- c(-1, 1)
    obj3 <- c(TRUE, FALSE)
    obj4 <- 10

For **a-e** lines below, describe the value of the output that is
produced and explain why that command produces the object. Try to answer
these questions without using R, but you can use R to help or verify
your answer. (e.g. This would be practice for an exam where you can’t
use R!)

    obj1[2:4] #a
    obj1[-3]  #b
    obj1 + obj2  #c
    obj1 * obj2  #d
    sum(obj3)  #e

------------------------------------------------------------------------

## Problem 4: Data frames

Install the R package `dslabs` if needed (see [Irizarry
1.5](https://rafalab.github.io/dsbook/getting-started.html#installing-r-packages)),
then load the library and the `murders` data that is used in chapter 2
of Irizarry.

``` r
library(dslabs)
data(murders)
```

### a.

Use the accessor `$` to extract the state abbreviations and assign them
to the object `a`. What is the class of this object?

### b.

Now use the square brackets to extract the state abbreviations and
assign them to the object `b`. Use the `identical` function to determine
if `a` and `b` are the same.

### c. 

What class of object is `murders[1:2,1:4]`?

### d. 

Explain why all entries in `as.matrix(murders[1:2,1:4])` are character
entries.

------------------------------------------------------------------------

## Problem 5: Lists

Consider the list below.

``` r
mylist <- list(x1="molly", x2=42, x3=FALSE, x4=1:5)
```

Show how to produce the following output in **one command**:

### a.

`"molly"` (atomic character vector of length 1)

### b.

`42` (atomic numeric vector of length 1)

### c. 

the 3rd and 4th entries in `x4` (atomic numeric vector of length 2)

### d. 

the length of `x4`

------------------------------------------------------------------------

## Problem 6: More lists

Use the same list as problem 5. Describe the class of object that is
produced with each of the following commands:

### a.

`mylist[1]`

### b.

`mylist[[1]]`

### c. 

`unlist(mylist)`

------------------------------------------------------------------------
