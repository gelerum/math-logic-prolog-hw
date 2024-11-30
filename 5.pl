double([], []).
double([H|T], [H1|R]) :-
    H1 is H * 2,
    double(T, R).


:- initialization(main).
main :-
    double([1, 2, 3, 4, 5], R),
    write(R), nl,
    halt.
