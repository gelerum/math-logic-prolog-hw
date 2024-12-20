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


generate_list(P, N, []) :-
    P >= N.
generate_list(P, N, [P|Y]) :-
    P < N,
    P1 is P + 1,
    generate_list(P1, N, Y).


matrix_transpose([], []).
matrix_transpose([R|Rs], AT) :-
    bi_length(R, L), 
    generate_list(0, L, S),
    maplist(matrix_column, [R|Rs], S, AT).


:- initialization(main).
main :-
    matrix_transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9], [4, 8, 9], [10, 11, 12]], R),
    write(R), nl,
    halt.
