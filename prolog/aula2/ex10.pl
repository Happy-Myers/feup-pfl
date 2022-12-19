%%%a

%is_ordered(+List).

is_ordered([]).
is_ordered([_]).
is_ordered([H1, H2|T]):-
    H1 =< H2,
    is_ordered([H2|T]).


%%%b

%insert_ordered(+Value, +List1, ?List2):-

insert_ordered(E, [], [E]).
insert_ordered(E, [H|T], [E, H|T]):-
    E =< H.
insert_ordered(E, [H|T], [H|T1]):-
    E > H,
    insert_ordered(E, T, T1).

%%%c

%insert_sort(+List, ?OrderedList).

insert_sort([], []).
insert_sort([H|T], L):-
    insert_sort(T, L1),
    insert_ordered(H, L1, L).
