place([], P, [P]).
place([X|Xs], P, [P, X|Xs]) :-
    P =< X.
place([X|Xs], P, [X|Xs1]) :-
    P > X,
    place(Xs, P, Xs1).


insertion_sort([], []).
insertion_sort([X|Xs], Y) :-
    insertion_sort(Xs, Y1),
    place(Y1, X, Y).


:- initialization(main).
main :-
    insertion_sort([64, 24, 12, 22, 11], R),
    write(R), nl,
    halt.
