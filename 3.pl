loop(_P, N, N) :- !.
loop(P, S, N) :-
    S < N,
    S1 is S + 1,
    call(P),
    loop(P, S1, N).


p() :-
    write(1).


:- initialization(main).
main :-
    loop(p, 1, 10),
    halt.


