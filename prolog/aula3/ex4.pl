%%%a

%print_n(+S, +N).

print_n(_, 0).
print_n(S, N):-
    N > 0,
    N1 is N-1,
    write(S),
    print_n(S, N1).


%%%b

% print_text(+Text, +Symbol, +Padding).

print_string("").
print_string([Code|T]):-
    char_code(Char, Code),
    write(Char),
    print_string(T).

print_text(T, S, P):-
    P >= 0,
    write(S),
    print_n(' ', P),
    print_string(T),
    print_n(' ', P),
    write(S).

print_text(T, S, P, Len):-
    length(T, Len1),
    Len =:= Len1,
    print_text(T,S,P).

print_text(T, S, P, Len):-
    length(T, Len1),
    Len > Len1,
    Extra is Len - Len1,
    Even is Extra rem 2,
    Even =:= 0, 
    Extra1 is Extra / 2,
    P1 is P + Extra1,
    print_text(T,S,P1).

print_text(T, S, P, Len):-
    length(T, Len1),
    Len > Len1,
    Extra is Len - Len1,
    Odd is Extra rem 2,
    Odd =:= 1, 
    Extra1 is Extra // 2,
    P1 is P + Extra1,
    P2 is P1 + 1,
    write(S),
    print_n(' ', P1),
    print_string(T),
    print_n(' ', P2),
    write(S).


%%%c

% print_banner(+Text, +Symbol, +Padding).

print_banner_edge(S,P, Len):-
    N is Len + 2*P + 2,
    print_n(S, N).

print_banner_empty(S,P, Len):-
    N is Len + 2*P,
    write(S),
    print_n(' ',N),
    write(S).

print_banner(T, S, P):-
    P >= 0,
    length(T, Len),
    print_banner_edge(S,P, Len), nl,
    print_banner_empty(S,P, Len), nl,
    print_text(T, S, P), nl,
    print_banner_empty(S, P, Len), nl, 
    print_banner_edge(S,P, Len).


%%%d

% read_number(-X).

read_number_acc(X, X):- peek_code(10),!.
read_number_acc(Acc, X):-
    \+peek_code(10),
    get_code(C),
    char_code('0', Zero),
    Digit is C - Zero,
    Digit >= 0,
    Digit < 10,
    Acc1 is Acc*10 + Digit,
    read_number_acc(Acc1, X).

read_number(X):-
    read_number_acc(0, X),
    get_code(10).



%%%e

%read_until_between(+Min, +Max, -Value).

read_until_between(Min, Max, Value):-
    repeat,
    read_number(Value),
    Value >= Min,
    Value =< Max,
    !.


%%%f

%read_string(-X).

read_string(""):- peek_code(10), !, get_code(_).
read_string([C|T]):-
    get_code(C),
    read_string(T).

%%%g

%banner.

banner:-
    print_string("input text: "),
    read_string(T), nl,
    print_string("input symbol: "),
    get_char(S), get_char(_), nl,
    print_string("input padding: "),
    read_number(N), nl, nl, 
    print_string("here comes your banner!"), nl, nl,
    print_banner(T, S, N).


%%%h

%print_multi_banner(+ListOfTexts, + Symbol, +Padding).

find_longest([], X, X).
find_longest([H|T], Acc, X):-
    length(H, Acc1),
    Acc1 > Acc,
    find_longest(T, Acc1, X).
find_longest([H|T], Acc, X):-
    length(H, Acc1),
    Acc1 =< Acc,
    find_longest(T, Acc, X).

print_lines([], _, _, _).
print_lines([H|T], S, P, Len):-
    print_text(H, S, P, Len), nl,
    print_lines(T, S, P, Len).


print_multi_banner(L, S, P):-
    P >= 0,
    find_longest(L, 0, Len),
    print_banner_edge(S, P, Len), nl,
    print_banner_empty(S, P, Len), nl,
    print_lines(L, S, P, Len),
    print_banner_empty(S,P,Len), nl,
    print_banner_edge(S, P, Len).


%%% i

% oh_christmas_tree(+N).

oh_christmas_tree_aux(N, N):-
    Nchar is N * 2 -1,
    print_n('*', Nchar), nl.
oh_christmas_tree_aux(Acc, N) :-
    Acc < N,
    Length is N * 2 -1,
    Nchar is Acc * 2 -1,
    Padding is (Length - Nchar)//2,
    print_n(' ', Padding),
    print_n('*', Nchar),
    print_n(' ', Padding),
    nl,
    Acc1 is Acc+1,
    oh_christmas_tree_aux(Acc1, N).

oh_christmas_tree(N):-
    N > 0,
    Padding is N - 1,
    oh_christmas_tree_aux(1, N),
    print_n(' ', Padding),
    write('*'),
    print_n(' ', Padding).