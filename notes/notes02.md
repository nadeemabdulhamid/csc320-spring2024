(Instructor's lecture notes)

# Lecture 2 - Analysis Framework; Asymptotic notation; Analysis of non-recursive algorithms


From [Levitin]
> ## Recapitulation of the Analysis Framework
> Before we leave this section, let us summarize the main points of the framework outlined above.
> - Both time and space efficiencies are measured as functions of the algorithm’s input size.
> - Time efficiency is measured by counting the number of times the algorithm’s basic operation is executed. Space efficiency is measured by counting the number of extra memory units consumed by the algorithm.
> - The efficiencies of some algorithms may differ significantly for inputs of the same size. For such algorithms, we need to distinguish between the worst-case, average-case, and best-case efficiencies.  (amortized efficiency: applies not to a single run of an algorithm but rather to a sequence of operations performed on the same data structure.)
> - The framework’s primary interest lies in the order of growth of the algorithm’s running time (extra memory units consumed) as its input size goes to infinity.
> - The notations $O$, $\Omega$, and $\Theta$ are used to indicate and compare the asymptotic orders of growth of functions expressing algorithm efficiencies.
> - The efficiencies of a large number of algorithms fall into the following few classes: constant, logarithmic, linear, linearithmic, quadratic, cubic, and exponential.
> - The main tool for analyzing the time efficiency of a nonrecursive algorithm is to set up a sum expressing the number of executions of its basic operation and ascertain the sum’s order of growth.
> ---

Ex. (2.1) 1, like 2 but mult of n-digit numbers, 3


## Asymptotic Notations and Basic Efficiency Classes

Cheatsheets: [this (pg 1/2)](https://www.tug.org/texshowcase/cheat.pdf) or [this](https://web.mit.edu/broder/Public/asymptotics-cheatsheet.pdf)

- Write out Defns.
- Using limits for comparing orders of growth
- Go over [Table 2.2](./notes02-eff-classes.pdf) [Levitin]

Ex. (2.2) 1, 3



## Analysis of non-recursive algorithms

Ex. (2.3) 5

reading notes 2 - question 12: Analyze the following algorithm. Give both the best-case and worst-case efficiencies. (Hint: It involves a double sum. Also, if you have $i$ or $j$ in your answer then you are doing it wrong.): [Comparison Counting Sort algorithm](../reading/reading02-alg.pdf)


