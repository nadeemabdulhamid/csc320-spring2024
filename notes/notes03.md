(Instructor's lecture notes)

# Lecture 3 - Recurrence relations; Analysis of recursive algorithms

From [Levitin]
> - The main tool for analyzing the time efficiency of a recursive algorithm is to set up a recurrence relation expressing the number of executions of its basic operation and ascertain the solution’s order of growth.
> - Succinctness of a recursive algorithm may mask its inefficiency.
> ---

> ## General Plan for Analyzing the Time Efficiency of Recursive Algorithms
> 1. Decide on a parameter (or parameters) indicating an input’s size.
> 2. Identify the algorithm’s basic operation.
> 3. Check whether the number of times the basic operation is executed can vary on different inputs of the same size; if it can, the worst-case, average-case, and best-case efficiencies must be investigated separately.
> 4. Set up a recurrence relation, with an appropriate initial condition, for the number of times the basic operation is executed.
> 5. Solve the recurrence or, at least, ascertain the order of growth of its solution.
> ---

Solving recurrence relations
 - Intelligent guess [Manber pg 47 = 64]
 - Backward substitution
 - Master Theorem


Ex. (2.4) 1, 3, 9



