%%%a

double(X, Y) :- Y is X * 2.

%map(+Pred, +List1, ?List2).

map(_, [], []).
map(Pred, [H|T], [H1|T1]):-
    F=.. [Pred, H, H1],
    F,
    map(Pred, T, T1).

%%%b

%fold(+Pred, +StartValue, +List, ?FinalValue).

sum(A, B, S):- S is A + B.

fold(_, Acc, [], Acc).
fold(Pred, Acc, [H|T], Sol):-
    F =.. [Pred, Acc, H, Acc1],
    F,
    fold(Pred, Acc1, T, Sol).

%%%c

%separate(+List, +Pred, -Yes, -No).

even(X):- 0=:= X mod 2.

separate([], _, [], []).
separate([H|T], Pred, [H|Y], N):-
    F =.. [Pred, H],
    F,
    separate(T, Pred, Y, N).
separate([H|T], Pred, Y, [H|N]):-
    F =.. [Pred, H],
    \+F,
    separate(T, Pred, Y, N).

%%%d

ask_execute:-
    write('insira o que deseja executar \n'),
    read(X),
    X.

