%%%a

:- op(600, xfx, exists_in).

Element exists_in List:-
    append(_, [Element|_], List).

%%%b

:- op(600, xfx, to).
:- op(550, fx, append).
:- op(550, xfx, results).

append A to B results C:-
    append(A, B, C).


%%%c

:- op(600, xfx, from).
:- op(550, fx, remove).

remove Elem from List results Result:-
    append(L1, [Elem|L2], List),
    append(L1, L2, Result).