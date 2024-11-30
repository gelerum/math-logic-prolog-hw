bi_length([], 0).
bi_length([_|Tail], L) :-
    bi_length(Tail, L1),
    L is L1 + 1.


min([E], E).
min([E|Es], R) :-
    min(Es, R1),
    (R1 < E ->
        R = R1
    ;
        R = E
    ).


remove([], _, []).
remove([X|Xs], G, Xs) :-
    X =:= G.
remove([X|Xs], G, [X|Xs1]) :-
    X \= G,
    remove(Xs, G, Xs1).
        

selection_sort([], []).
selection_sort(L, [M|L2]) :-
    min(L, M),
    remove(L, M, L1),
    selection_sort(L1, L2).
    


:- initialization(main).
main :-
    selection_sort([64, 24, 12, 22, 11], R),
    write(R), nl,
    halt.
