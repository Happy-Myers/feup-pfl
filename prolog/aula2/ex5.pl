%%%a

%list_size(+List, ?Size).

list_size([], 0).
list_size([_|T], S):-
    list_size(T, S1),
    S is S1 + 1.

%%%b

%list_sum(+List, ?Sum).

list_sum([], 0).
list_sum([H|T], S) :-
    list_sum(T, S1),
    S is S1 + H.

%%%c

%list_prod(+List, ?Prod).

list_prod([], 0).
list_prod([H], H).
list_prod([H|T], S) :-
    list_prod(T, S1),
    S is S1 * H.

%%%d

%inner_product(+List1, +List2, ?Result).

inner_product([], [], 0).
inner_product([H1], [H2], S):-
    S is H1 * H2.
inner_product([H1|T1], [H2|T2], S) :-
    inner_product(T1, T2, S1),
    S is H1 * H2 + S1.


%%%e

%count(+Elem, +List, ?N).

count(_, [], 0).
count(E, [H|T], N):-
    E =:= H,
    count(E, T, N1),
    N is N1 + 1.
count(E, [_|T], N) :-
    count(E, T, N).