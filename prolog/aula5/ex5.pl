%%%a
:- op(600, xfx, from).
:- op(550, fx, flight).
:- op(550, xfx, to).
:- op(500, xfx, at).
:- op(450, xfx, :).



flight tp1949 from porto to lisbon at 16:15.

% (flight tp1949) from (porto to (lisbon at (16:15)))

%%%b

:- op(600, xfx, then).
:- op(550, fx, if).
:- op(550, xfx, else).

if x then y else z.

% (if x) then (y else z)

if X then Y else _:-
    call(X), !,
    call(Y).
if _ then _ else Z:-
    call(Z).