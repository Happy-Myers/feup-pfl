%%%a

%invert(+List1, ?List2).

invert(L1, L2) :-
    invert(L1, [], L2).
invert([H|T], Acc, L):-
    invert(T, [H|Acc], L).
invert([], L, L).


%%%b

%del_one(+Elem, +List1, ?List2).

del_one(H, [H|T], T).
del_one(E, [H|T], L) :-
    E \= H,
    del_one(E,T,L1),
    L = [H|L1].

%%%c

%del_all(+Elem, +List1, ?List2).

del_all(_, [], []).
del_all(H, [H|T], L) :-
    del_all(H, T, L).
del_all(E, [H|T], L) :-
    E \= H, 
    del_all(E, T, L1),
    L = [H|L1].

%%%d

%del_all_list(+ListElems, +List1, ?List2).

del_all_list(_, [], []).
del_all_list(LE, [H|T], L):-
    memberchk(H, LE),
    del_all_list(LE, T, L).
del_all_list(LE, [H|T], L) :-
    nonmember(H, LE), 
    del_all_list(LE, T, L1),
    L = [H|L1].


%%%e

% del_dups(+List1, ?List2).

del_dups([],[]).
del_dups([H|T], L):-
    memberchk(H, T),
    del_all(H, T, L1),
    del_dups(L1, L2),
    L = [H|L2].
del_dups([H|T], L) :-
    nonmember(H, T),
    del_dups(T, L1),
    L = [H|L1].

%%%f

%list_perm(+L1, +L2).

list_perm([], []).
list_perm([H|T], L) :-
    del_one(H, L, L1),
    list_perm(T, L1).

%%%g

%replicate(+Amount, +Elem, ?List).

replicate(0, _, []).
replicate(N, E, [E|L]):-
    N > 0,
    N1 is N - 1,
    replicate(N1, E, L).


%%%h

% intersperse(+Elem, +List1, ?List2).

intersperse(_, [], []).
intersperse(_, [H], [H]).
intersperse(E, [H|T], L) :-
    intersperse(E, T, L1),
    L = [H, E | L1].

%%%i

%insert_elem(+Index, +List1, +Elem, ?List2).

insert_elem(0,L, E, [E|L]).
insert_elem(N, [H|T], E, [H|L]):-
    N > 0,
    N1 is N -1,
    insert_elem(N1, T, E, L).


%%%j

%delete_elem(+Index, +List1, ?Elem, ?List2).

delete_elem(0, [H|T], H, T).
delete_elem(N, [H|T], E, [H|L]):-
    N>0,
    N1 is N - 1,
    delete_elem(N1, T, E, L).

%%%k

%replace(+List1, +Index, ?Old, +New, ?List2).

replace([H|T], 0, H, E, [E|T]).
replace([H|T], N, Old, E, [H|L]):-
    N>0,
    N1 is N-1,
    replace(T, N1, Old, E, L).