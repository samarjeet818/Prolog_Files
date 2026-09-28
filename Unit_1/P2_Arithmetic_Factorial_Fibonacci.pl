% Arithmetic, factorial, and Fibonacci operations.

addition(A, B, Result) :- Result is A + B.
subtraction(A, B, Result) :- Result is A - B.
multiplication(A, B, Result) :- Result is A * B.
division(A, B, Result) :-
    B =\= 0,
    Result is A / B.

factorial(0, 1).
factorial(N, Result) :-
    N > 0,
    Previous is N - 1,
    factorial(Previous, PreviousResult),
    Result is N * PreviousResult.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Result) :-
    N > 1,
    First is N - 1,
    Second is N - 2,
    fibonacci(First, FirstResult),
    fibonacci(Second, SecondResult),
    Result is FirstResult + SecondResult.

% Example queries:
% ?- addition(10, 5, Result).
% ?- factorial(5, Result).
% ?- fibonacci(7, Result).