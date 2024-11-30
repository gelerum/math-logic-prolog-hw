is_even(N) :-
    mod(N, 2) =:= 0.


sum_of_odds(0, 0).
sum_of_odds(1, 1).
sum_of_odds(2, 1).
sum_of_odds(N, S) :-
    N > 0,
    ( is_even(N) ->
        N1 is N - 1
    ;   N1 is N
    ),
    N2 is N1 - 2,
    sum_of_odds(N2, S1),
    S is N1 + S1.


sum_of_odds_less_than_n(N, S) :-
    ( is_even(N) ->
        N1 is N,
        sum_of_odds(N1, S)
    ;   N1 is N - 1,
        sum_of_odds(N1, S)
    ).


:- initialization(main).
main :-
    sum_of_odds_less_than_n(10, S),
    write(S), nl,
    halt.
