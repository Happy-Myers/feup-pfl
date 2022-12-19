%pascal(+N, ?Lines).

nCr(_, 0, 1).
nCr(N, N, 1).
nCr(N, R, Res):-
    N > R, 
    R > 0,
    N1 is N -1,
    R1 is R-1,
    nCr(N1, R, Res1),
    nCr(N1, R1, Res2),
    Res is Res1 + Res2.

pascalLine(N, Pos, []):-
    Pos > N.
pascalLine(N, Pos, [H|T]):-
    Pos =< N,
    nCr(N, Pos, H),
    Pos1 is Pos +1,
    pascalLine(N, Pos1, T).


pascal(N, NLine, []):- NLine > N.
pascal(N, NLine, [Line|T]):-
    NLine =< N,
    pascalLine(NLine, 0, Line),
    NLine1 is NLine +1,
    pascal(N, NLine1, T).

pascal(N, Lines):-
    pascal(N, 0, Lines).