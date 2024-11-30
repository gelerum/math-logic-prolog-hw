bi_length([], 0).
bi_length([_|Tail], L) :-
    bi_length(Tail, L1),
    L is L1 + 1.


dot_product(A, B, _) :-
    bi_length(A, L1),
    bi_length(B, L2),
    L1 \= L2,
    !.
dot_product([], [], 0).
dot_product([H1|T1], [H2|T2], R) :-
    dot_product(T1, T2, R1),
    R is R1 + H1 * H2.


:- initialization(main).
main :-
    dot_product([1, 2, 3], [5, 6, 7], R),
    write(R), nl,
    halt.
