% A* search using f(N) = g(N) + h(N).

edge(a, b, 1).
edge(a, c, 3).
edge(b, d, 3).
edge(b, e, 1).
edge(c, f, 2).
edge(d, g, 2).
edge(e, g, 4).
edge(f, g, 1).

heuristic(a, 6).
heuristic(b, 5).
heuristic(c, 4).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 1).
heuristic(g, 0).

a_star(Start, Goal, Path, Cost) :-
    heuristic(Start, H),
    a_star_search([state(Start, [Start], 0, H)], Goal, Path, Cost).

a_star_search([state(Goal, Path, Cost, _)|_], Goal, Path, Cost).
a_star_search([state(Current, Path, Cost, _)|Open], Goal, ResultPath, ResultCost) :-
    findall(state(Next, [Next|Path], NewCost, F),
            (edge(Current, Next, Step),
             \+ member(Next, Path),
             NewCost is Cost + Step,
             heuristic(Next, H),
             F is NewCost + H),
            Children),
    append(Open, Children, Combined),
    sort_states(Combined, Sorted),
    a_star_search(Sorted, Goal, ResultPath, ResultCost).

sort_states(States, Sorted) :-
    predsort(compare_states, States, Sorted).

compare_states(Order, state(_, _, _, F1), state(_, _, _, F2)) :-
    compare(Order, F1, F2).

% Example queries:
% ?- a_star(a, g, Path, Cost).
% ?- heuristic(c, Value).