append([], List, List).
append([Head|Tail], List, [Head|Rest]) :-
    append(Tail, List, Rest).


bi_length([], 0).
bi_length([_|Tail], L) :-
    bi_length(Tail, L1),
    L is L1 + 1.


value_d([], _, _) :-
    !.
value_d([H|T], I, G, R) :-
    ( I =:= G ->
        R is H
    ;   I1 is I + 1,
        value_d(T, I1, G, R)
    ).


value(L, G, R) :-
    value_d(L, 0, G, R).


maplist(_G, _A, [], []).
maplist(G, A, [X|Xs], [Y|Ys]) :-
    call(G, A, X, Y),
    maplist(G, A, Xs, Ys).


matrix_column([], _N, []).
matrix_column([A|As], N, [E|E1]) :-
    value(A, N, E),
    matrix_column(As, N, E1).


matrix_transpose([], []).
matrix_transpose(A, AT) :-
    maplist(matrix_column, A, [0, 1, 2], AT).


:- initialization(main).
main :-
    matrix_transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]], R),
    write(R), nl,
    halt.