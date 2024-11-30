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


swap_d([], _, _, _, _, _, []).
swap_d(_, _, _, P1, P2, _, _) :-
    P1 < 0;
    P2 < 0,
    !.
swap_d([H|T], V1, V2, P1, P2, C, [H1|R]) :-
    ( C =:= P1 ->
        H1 = V2
    ; C =:= P2 ->
        H1 = V1
    ; H1 = H
    ),
    C1 is C + 1,
    swap_d(T, V1, V2, P1, P2, C1, R).


swap([], _, _, []).
swap(L, P1, P2, R) :-
    value(L, P1, V1),
    value(L, P2, V2),
    swap_d(L, V1, V2, P1, P2, 0, R).


:- initialization(main).
main :-
    swap([1, 2, 3, 4], 0, 2, R),
    write(R), nl,
    halt.
