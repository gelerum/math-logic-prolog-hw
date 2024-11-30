cut_left(_, [], []).
cut_left(0, Z, Z).
cut_left(C, [_|Tail], Result) :-
    C1 is C - 1,
    cut_left(C1, Tail, Result).


append([], List, List).
append([Head|Tail], List, [Head|Rest]) :-
    append(Tail, List, Rest).


bi_length([], 0).
bi_length([_|Tail], L) :-
    bi_length(Tail, L1),
    L is L1 + 1.


q(L, X, L1) :-
    bi_length(L, Len),
    Len1 is Len - X,
    cut_left(Len1, L, L2),
    append(L1, L2, L).

    
:- initialization(main).
main :-
    q([1, 4, 2, 3, 8], 3, L1),
    write(L1), nl,
    q([1, 4, 2, 3, 8], 2, L2),
    write(L2), nl,
    halt.
