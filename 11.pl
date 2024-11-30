append([], List, List).
append([Head|Tail], List, [Head|Rest]) :-
    append(Tail, List, Rest).


reverse([], []).
reverse([H|T], R) :-
    reverse(T, R1),
    append(R1, [H], R).


circular_shift_d([], _, []).
circular_shift_d(L, 0, L).
circular_shift_d([H|T], N, R) :-
    N1 is N - 1,
    append(T, [H], T1),
    circular_shift_d(T1, N1, R).


circular_shift(L, N, R) :-
    N < 0,
    N1 is -N,
    circular_shift_d(L, N1, R).
circular_shift(L, N, R) :-
    reverse(L, L1),
    circular_shift_d(L1, N, L2),
    reverse(L2, R).


:- initialization(main).
main :-
    circular_shift([1, 2, 3, 4, 5], -1, R1),
    write(R1), nl,
    circular_shift([1, 2, 3, 4, 5], -2, R2),
    write(R2), nl,
    circular_shift([1, 2, 3, 4, 5], -3, R3),
    write(R3), nl,
    circular_shift([1, 2, 3, 4, 5], -7, R4),
    write(R4), nl,
    circular_shift([1, 2, 3, 4, 5], 1, R5),
    write(R5), nl,
    circular_shift([1, 2, 3, 4, 5], 2, R6),
    write(R6), nl,
    circular_shift([1, 2, 3, 4, 5], 3, R7),
    write(R7), nl,
    circular_shift([1, 2, 3, 4, 5], 7, R8),
    write(R8), nl,
    halt.
