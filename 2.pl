p(X, 0, X).
p(X, Y, Z) :-
    Y > 0,
    R is mod(X, Y),
    p(Y, R, Z).


:- initialization(main).
main :-
    p(2, 6, Z1),
    write(Z1), nl,
    p(3, 2, Z2),
    write(Z2), nl,
    halt.


