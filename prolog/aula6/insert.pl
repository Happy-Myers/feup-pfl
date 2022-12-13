%insert(+NewElem, +Pos, +OldL, -L)

insert(New, 0, L1, [New|L1]).

insert(New, Pos, [H|T], [H|L]) :-
    P > 0,
    Pos1 is Pos-1,
    insert(New, Pos1, T, L).





