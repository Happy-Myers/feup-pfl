%%%a 

%factorial(+N, ?F).

factorial(0, 1).

factorial(N, F) :-
    N >= 1,
    N1 is N-1,
    factorial(N1, F1),
    F is N * F1.


factorial2(N, F) :-
    N >= 0,
    factorial2_aux(N, 1, F).

factorial2_aux(0, F, F).
factorial2_aux(N, Acc, F) :-
    N >= 1,
    N1 is N-1,
    Acc1 is Acc * N,
    factorial2_aux(N1, Acc1, F).


%%% b

% somaRec(+N, ?Sum).

somaRec(0, 0).
somaRec(N, Sum) :-
    N >= 1,
    N1 is N-1,
    somaRec(N1, Sum1),
    Sum is N + Sum1.

somaRec2(N, F) :-
    N >= 0,
    somaRec2_aux(N, 0, F).

somaRec2_aux(0, F, F).
somaRec2_aux(N, Acc, F) :-
    N >= 1,
    N1 is N-1,
    Acc1 is Acc + N,
    somaRec2_aux(N1, Acc1, F).


%%%c

% fibonacci(+N, ?F).

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N >= 2,
    N1 is N-1,
    N2 is N-2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

%%%d

% isPrime(+X).

isPrime(1).
isPrime(2).
isPrime(N) :-
    N > 2,
    \+ hasDivisor(N, 2, sqrt(N)).

hasDivisor(N, I, End) :-
    I =< End,
    N mod I =:= 0.
hasDivisor(N, I , End) :-
    I * I < N,
    Next is I + 1,
    hasDivisor(N, Next, End).