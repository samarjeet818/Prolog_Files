% Map coloring CSP with three colors and backtracking.

color(red).
color(green).
color(blue).

adjacent(a, b).
adjacent(a, c).
adjacent(b, c).
adjacent(b, d).
adjacent(c, d).

map_coloring(Colors) :-
    Colors = [a-A, b-B, c-C, d-D],
    color(A), color(B), color(C), color(D),
    different(A, B),
    different(A, C),
    different(B, C),
    different(B, D),
    different(C, D).

different(X, Y) :- X \= Y.

% Example queries:
% ?- map_coloring(Colors).
% ?- color(Color).
% ?- adjacent(a, b).