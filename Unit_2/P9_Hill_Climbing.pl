% Hill-climbing search over integer values.

value(1, 2).
value(2, 5).
value(3, 8).
value(4, 12).
value(5, 10).
value(6, 7).

neighbour(Current, Next) :-
    Next is Current + 1,
    value(Next, _).
neighbour(Current, Next) :-
    Next is Current - 1,
    value(Next, _).

hill_climb(Current, Best) :-
    value(Current, CurrentValue),
    findall(Next-NextValue,
            (neighbour(Current, Next), value(Next, NextValue)),
            Neighbours),
    best_neighbour(Neighbours, CurrentValue, Next),
    (Next = none -> Best = Current ; hill_climb(Next, Best)).

best_neighbour([], _, none).
best_neighbour([Node-NodeValue|Rest], CurrentValue, Best) :-
    best_neighbour(Rest, CurrentValue, Node, NodeValue, Best).

best_neighbour([], CurrentValue, Node, NodeValue, Best) :-
    (NodeValue > CurrentValue -> Best = Node ; Best = none).
best_neighbour([Next-NextValue|Rest], CurrentValue, Node, NodeValue, Best) :-
    (NextValue > NodeValue ->
        best_neighbour(Rest, CurrentValue, Next, NextValue, Best)
    ;   best_neighbour(Rest, CurrentValue, Node, NodeValue, Best)).

% Example queries:
% ?- hill_climb(1, Best).
% ?- neighbour(3, Next).
% ?- value(4, Score).