% Basic list operations.

append_list([], List, List).
append_list([Head|Tail], List, [Head|Result]) :-
    append_list(Tail, List, Result).

reverse_list([], []).
reverse_list([Head|Tail], Reversed) :-
    reverse_list(Tail, ReversedTail),
    append_list(ReversedTail, [Head], Reversed).

member_list(Element, [Element|_]).
member_list(Element, [_|Tail]) :-
    member_list(Element, Tail).

length_list([], 0).
length_list([_|Tail], Length) :-
    length_list(Tail, TailLength),
    Length is TailLength + 1.

% Example queries:
% ?- append_list([1, 2], [3, 4], Result).
% ?- reverse_list([a, b, c], Result).
% ?- member_list(b, [a, b, c]).
% ?- length_list([a, b, c], Length).