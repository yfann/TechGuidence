# dynamic programing
+ 解决 overlapping subproblems and optimal substructure.

## process steps
+ Identify Subproblems: Divide the main problem into smaller, independent subproblems.
+ Store Solutions: Solve each subproblem and store the solution in a table or array.
+ Build Up Solutions: Use the stored solutions to build up the solution to the main problem.
+ Avoid Redundancy: By storing solutions, DP ensures that each subproblem is solved only once, reducing computation time.


## approach
+ Top-Down Approach(Memoization)
    + 通过递归构造subproblems
+ Bottom-Up Approach(Tabulation)
    + Starts with the smallest subproblems and gradually builds up to the final solution.
    + Fills a table with solutions to subproblems in a bottom-up manner.
    + Suitable when the number of subproblems is small and the optimal solution can be directly computed from the solutions to smaller subproblems.

## ref
+ [Dynamic Programming or DP](https://www.geeksforgeeks.org/introduction-to-dynamic-programming-data-structures-and-algorithm-tutorials/?ref=outind)