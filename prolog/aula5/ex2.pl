:- use_module(library(lists)).

%%%a

%my_arg(+Index, ?Term, ?Arg)

my_arg(Index, Term, Arg) :-
    Term =.. [_ | Args],
    nth1(Index, Args, Arg).

my_functor(Term, Name, Arity):-
    Term =..[Name|Args],
    length(Args, Arity).

%%%b

univ(Term, [Name|Args]):-
    functor(Term, Name, Arity),
    get_args(Term, Arity, ArgsRev),
    reverse(ArgsRev, Args).

get_args(_, 0, []).
get_args(Term, Count, [Arg|T]):-
    Count > 0,
    arg(Count, Term, Arg),
    Count1 is Count - 1,
    get_args(Term, Count1, T).

%%%c

:- op(1, xfx, univ).