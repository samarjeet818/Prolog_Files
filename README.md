# AI/ML Prolog Practicals

This repository contains simple Prolog programs for AI and machine-learning practicals. The programs are written for learning and practical-exam purposes.

## Unit 1

1. **P1 Knowledge Base** - Stores student, course, and enrollment facts and supports related queries.
2. **P2 Arithmetic, Factorial, Fibonacci** - Demonstrates arithmetic operations and recursive numerical programs.
3. **P3 List Operations** - Implements append, reverse, member, and length operations.
4. **P4 Timetable** - Represents faculty, subjects, classrooms, and timetable information.
5. **P5 Student Performance** - Classifies students using marks, totals, averages, and pass criteria.
6. **P6 BFS** - Finds paths in an unweighted graph using breadth-first search.

## Unit 2

7. **P7 Greedy Best-First Search** - Searches a graph by selecting the node with the best heuristic value.
8. **P8 A* Search** - Searches a weighted graph using `f(n) = g(n) + h(n)`.
9. **P9 Hill Climbing** - Improves a state by repeatedly choosing a better neighboring value.
10. **P10 Simulated Annealing** - Uses temperature and acceptance probability to explore a solution space.
11. **P11 Map Coloring CSP** - Solves map coloring with three colors using constraints and backtracking.
12. **P12 N-Queens** - Solves the N-Queens problem using permutations and constraint checking.

## Running With SWI-Prolog

1. Install [SWI-Prolog](https://www.swi-prolog.org/Download.html).
2. Open a terminal in the folder containing a program.
3. Start SWI-Prolog and load a file:

```text
swipl
?- [P1_Knowledge_Base].
?- student_course(aman, Course).
```

Alternatively, run a file directly from a terminal:

```text
swipl -s Unit_1/P1_Knowledge_Base.pl
```

Each program ends with example queries that can be entered after loading the file.