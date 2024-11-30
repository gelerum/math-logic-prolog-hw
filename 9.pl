member(Element, [Element|_]).
member(Element, [_|Tail]) :-
    member(Element, Tail).


append([], List, List).
append([Head|Tail], List, [Head|Rest]) :-
    append(Tail, List, Rest).


reverse([], []).
reverse([H|T], R) :-
    reverse(T, R1),
    append(R1, [H], R).


unique_lasts([], []).
unique_lasts([H|T], [H|R]) :-
    \+ member(H, T),
    unique_lasts(T, R).
unique_lasts([H|T], R) :-
    member(H, T),
    unique_lasts(T, R).


unique(L, R) :-
    reverse(L, L1),
    unique_lasts(L1, R1),
    reverse(R1, R).


:- initialization(main).
main :-
    unique([1, 2, 3, 1, 7, 2], R),
    write(R), nl,
    halt.
