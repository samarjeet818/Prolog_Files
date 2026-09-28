% N-Queens using permutation and constraint checking.

n_queens(N, Solution) :-
    range(1, N, Columns),
    permutation(Columns, Solution),
    safe_queens(Solution).

range(High, High, [High]).
range(Low, High, [Low|Rest]) :-
    Low < High,
    Next is Low + 1,
    range(Next, High, Rest).

safe_queens([]).
safe_queens([Queen|Rest]) :-
    no_attack(Queen, Rest, 1),
    safe_queens(Rest).

no_attack(_, [], _).
no_attack(Queen, [Other|Rest], Distance) :-
    Queen =\= Other,
    abs(Queen - Other) =\= Distance,
    NextDistance is Distance + 1,
    no_attack(Queen, Rest, NextDistance).

% Example queries:
% ?- n_queens(4, Solution).
% ?- n_queens(8, Solution).
% ?- safe_queens([2, 4, 1, 3]).