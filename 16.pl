f(1, 1).
f(2, 1).
f(N, X) :-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    f(N1, X1),
    f(N2, X2),
    X is X1 + X2.

    
:- initialization(main).
main :-
    f(4, X),
    write(X), nl,
    halt.
