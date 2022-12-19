%%%a

%rle(+List1, ?List2).

:-use_module(library(lists)).

acc_run(H1, [H2|_], N, N) :- H1 \= H2.
acc_run(_, [], N, N).
acc_run(H, [H|T], N , Acc):-
    Acc1 is Acc+1,
    acc_run(H, T, N, Acc1).

run(H, L, N):-
    acc_run(H, L, N, 1).

rle([], []).
rle([H|T1], [H-N|T2]):-
    run(H, T1, N),
    sublist([H|T1], L, N, _, 0),
    rle(L, T2).


%%%b

%un_rle(+List1, ?List2).

un_rle([], []).
un_rle([H-1|T1], [H|T2]) :- un_rle(T1,T2).
un_rle([H-N|T1], [H|T2]):-
    N > 1,
    N1 is N -1,
    un_rle([H-N1|T1], T2).