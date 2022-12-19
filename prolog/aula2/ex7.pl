%%%a

% list_append(?L1, ?L2, ?L3).

list_append([], L1, L1).
list_append([H1|T1], L2, [H1|T3]):-
    list_append(T1, L2, T3).


%%%b

%list_member(?Elem, ?List).

list_member(E, L):-
    append(_ , [E|_], L).


%%%c

% list_last(+List, ?Last).

list_last(List, Last):-
    append(_, [Last|[]], List).


%%%d

%list_nth(?N,?List,?Elem).

list_nth(N, L, E):-
    append(P, [E|_], L),
    length(P, N).



%%%e

%list_append(+ListOfLists,?List).

list_append([H|[]], H).
list_append([H|T], L):-
    list_append(T, L1),
    append(H,L1,L).

%%%f

%list_del(+List,+Elem,?Res).

list_del(L,E,R):-
    append(P1, [E|P2], L),
    append(P1, P2, R).

%%%g

%list_before(?First, ?Second, ?List).

list_before(F,S,L):-
    append(_, [F|P], L),
    append(_, [S|_], P).

%%%h

%list_replace_one(+X,+Y,+List1,?List2).

list_replace_one(X,Y,L1,L2):-
    append(P1, [X|P2], L1),
    append(P1, [Y|P2], L2).

%%%i

%list_repeated(+X,+List).

list_repeated(X,L):-
    append(_, [X|P], L),
    append(_, [X|_], P).


%%%j

%list_slice(+List1, +Index, +Size, ?List2).

list_slice(L1, I, S, L2):-
    append(P1, P2, L1),
    length(P1, I),
    append(L2, _, P2),
    length(L2, S).

%%%k

%list_shift_rotate(+List1, +N, ?List2).

list_shift_rotate(L1, N, L2):-
    append(P1, P2, L1),
    length(P1, N),
    append(P2, P1, L2).