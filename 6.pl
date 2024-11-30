negative_positions_d([], _, []).
negative_positions_d([H|T], P, [NP|R]) :-
    H < 0,
    NP is P,
    P1 is P + 1,
    negative_positions_d(T, P1, R).
negative_positions_d([H|T], P, R) :-
    H >= 0,
    P1 is P + 1,
    negative_positions_d(T, P1, R).


negative_positions(L, R) :-
    negative_positions_d(L, 0, R).


:- initialization(main).
main :-
    negative_positions([-1, -2, 5, 6, 7, -9, 0, -1], R),
    write(R), nl,
    halt.
