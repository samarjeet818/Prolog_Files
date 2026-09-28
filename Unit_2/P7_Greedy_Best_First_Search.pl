% Greedy Best-First Search using heuristic values.

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 3).
heuristic(e, 2).
heuristic(f, 1).
heuristic(g, 0).

greedy_best_first(Start, Goal, Path) :-
    greedy([[Start]], Goal, ReversedPath),
    reverse_path(ReversedPath, Path).

greedy([[Goal|Rest]|_], Goal, [Goal|Rest]).
greedy(Paths, Goal, Result) :-
    select_best(Paths, BestPath, RemainingPaths),
    BestPath = [Current|Visited],
    findall([Next|BestPath],
            (edge(Current, Next), \+ member(Next, Visited)),
            NewPaths),
    append(NewPaths, RemainingPaths, UpdatedPaths),
    greedy(UpdatedPaths, Goal, Result).

select_best([Path|Paths], Best, Remaining) :-
    best_path(Paths, Path, Best),
    remove_path(Best, [Path|Paths], Remaining).

best_path([], Best, Best).
best_path([Path|Paths], CurrentBest, Best) :-
    Path = [Node|_],
    CurrentBest = [BestNode|_],
    heuristic(Node, PathValue),
    heuristic(BestNode, BestValue),
    (PathValue < BestValue ->
        best_path(Paths, Path, Best)
    ;   best_path(Paths, CurrentBest, Best)).

remove_path(Path, [Path|Rest], Rest).
remove_path(Path, [Other|Rest], [Other|Remaining]) :-
    remove_path(Path, Rest, Remaining).

reverse_path([], []).
reverse_path([Head|Tail], Path) :-
    reverse_path(Tail, ReversedTail),
    append(ReversedTail, [Head], Path).

% Example queries:
% ?- greedy_best_first(a, g, Path).
% ?- heuristic(c, Value).