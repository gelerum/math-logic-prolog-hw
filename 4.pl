replace(_, _, [], []).
replace(X, Y, [X|T], [Y|R]) :-
    replace(X, Y, T, R). 
replace(X, Y, [H|T], [H|R]) :-
    replace(X, Y, T, R). 


:- initialization(main).
main :-
    replace(1, 2, [5, 1, 1, 2, 4, 7], R),
    write(R), nl,
    halt.
