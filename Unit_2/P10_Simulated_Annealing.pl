% Simulated annealing with temperature and acceptance probability.

:- use_module(library(random)).

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

acceptance_probability(CurrentValue, NextValue, Temperature, Probability) :-
    (NextValue >= CurrentValue ->
        Probability = 1.0
    ;   Difference is NextValue - CurrentValue,
        Probability is exp(Difference / Temperature)).

simulated_annealing(Current, Temperature, MinimumTemperature, Best) :-
    (Temperature =< MinimumTemperature ->
        Best = Current
    ;   findall(Next, neighbour(Current, Next), Neighbours),
        (Neighbours = [] ->
            Best = Current
        ;   random_member(Next, Neighbours),
            value(Current, CurrentValue),
            value(Next, NextValue),
            acceptance_probability(CurrentValue, NextValue, Temperature, Probability),
            random_float(Random),
            (Random =< Probability -> Chosen = Next ; Chosen = Current),
            NewTemperature is Temperature * 0.90,
            simulated_annealing(Chosen, NewTemperature, MinimumTemperature, Best))).

% Example queries:
% ?- simulated_annealing(1, 10.0, 0.1, Best).
% ?- acceptance_probability(8, 5, 2.0, Probability).