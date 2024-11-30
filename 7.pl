cut_left(_, [], []).
cut_left(Element, [Element|Tail], [Element|Tail]).
cut_left(Element, [_|Tail], Result) :-
    cut_left(Element, Tail, Result).


:- initialization(main).
main :-
    cut_left(5, [1, 2, 3, 4, 5, 6 ,7], R),
    write(R), nl,
    halt.
