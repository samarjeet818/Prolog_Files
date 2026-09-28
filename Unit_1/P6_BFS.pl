% Breadth-first search on an unweighted graph.

edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(e, f).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(Y, X).

bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, ReversedPath),
    reverse_path(ReversedPath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).
bfs_queue([[Current|Rest]|Queue], Goal, Path) :-
    findall([Next, Current|Rest],
            (connected(Current, Next), \+ member(Next, [Current|Rest])),
            NewPaths),
    append(NewPaths, Queue, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Path).

reverse_path([], []).
reverse_path([Head|Tail], Path) :-
    reverse_path(Tail, ReversedTail),
    append(ReversedTail, [Head], Path).

% Example queries:
% ?- bfs(a, f, Path).
% ?- connected(a, b).
% ?- bfs(a, e, Path).