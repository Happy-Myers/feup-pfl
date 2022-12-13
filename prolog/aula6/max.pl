/*
PFL - Exercise about max and second max.
By: Gonçalo Leão
*/

gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).
gates(doha, 9).
gates(paris, 6).
gates(napoli, 5).

% most_gates(?C,-NGates).
most_gates(C,N):-
    gates(C,N),
    \+((
        gates(_, N1),
        N1 > N
    )).

% second_most_gates(?C,-NGates).

second_most_gates(C, N):-
    most_gates(_, Max), !,
    gates(C, N),
    N < Max,
    \+((
        gates(_, N1),
        N1 < Max,
        N1 > N
    )).

