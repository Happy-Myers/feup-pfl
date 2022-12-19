%%%a

%list_to(+N,?List).

list_to(0, []).
list_to(N, L):-
    N > 0,
    N1 is N-1,
    list_to(N1, L1),
    append(L1, [N], L).



%%%b

%list_from_to(+Inf, +Sup, ?List).

list_from_to(Sup, Sup, [Sup]).
list_from_to(Inf, Sup, L):-
    Inf < Sup,
    Inf1 is Inf+1,
    list_from_to(Inf1, Sup, L1),
    append([Inf], L1, L).

%%%c

%list_from_to_step(+Inf, +Step, +Sup, ?List).

list_from_to_step(Inf, _, Sup, []):- Inf > Sup.
list_from_to_step(Sup, _, Sup, [Sup]).
list_from_to_step(Inf, Step, Sup, L):-
    Inf < Sup,
    Inf1 is Inf + Step,
    list_from_to_step(Inf1, Step, Sup, L1),
    append([Inf], L1, L).


%%%d

:- use_module(library(lists)).

list_from_to2(Inf, Sup, L):-
    Inf > Sup,
    list_from_to(Sup, Inf, L1),
    reverse(L1, L).
list_from_to2(Inf, Sup, L):-
    Inf =< Sup,
    list_from_to(Inf, Sup, L).


list_from_to_step2(Inf, Step, Sup, L):-
    Inf > Sup,
    list_from_to_step(Sup, Step, Inf, L1),
    reverse(L1, L).
list_from_to_step2(Inf, Step, Sup, L):-
    Inf =< Sup,
    list_from_to_step(Inf, Step, Sup, L).



%%%e

%primes(+N, ?List).

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

primes(1, []).
primes(N, L):-
    N >=2,
    \+isPrime(N),
    N1 is N-1,
    primes(N1, L).
primes(N, L):-
    N >=2,
    isPrime(N),
    N1 is N-1,
    primes(N1, L1),
    append(L1, [N], L).


%%%f

%fibs(+N, ?List).

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N >= 2,
    N1 is N-1,
    N2 is N-2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

fibs(0, [0]).
fibs(N, L):-
    N > 0,
    N1 is N-1,
    fibs(N1, L1),
    fibonacci(N,F),
    append(L1, [F], L).