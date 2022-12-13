
%%%a 

male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(cameron). % Example of a homosexual relationship. This affects how we define siblings!
male(joe).
male(manny).
male(bo).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(pameron).
female(haley).
female(alex).
female(lily).
female(poppy).

parent(grace,phil).
parent(frank,phil).

parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).

parent(jay,joe).
parent(gloria,joe).

parent(gloria,manny).
parent(javier,manny).

parent(barb,cameron).
parent(merle,cameron).
parent(barb,pameron).
parent(merle,pameron).

parent(phil,haley).
parent(claire,haley).
parent(phil,alex).
parent(claire,alex).
parent(phil,luke).
parent(claire,luke).

parent(mitchell,lily).
parent(cameron,lily).
parent(mitchell,rexford).
parent(cameron,rexford).

parent(pameron,calhoun).
parent(bo,calhoun).

parent(dylan,george).
parent(haley,george).
parent(dylan,poppy).
parent(haley,poppy).


%%%c 

% father(?Father, ?Child).
father(X, Y) :- 
parent(X, Y), 
male(X).

% mother(?Mother, ?Child).
mother(X, Y) :-
parent(X, Y),
female(X).

% grandparent(?GrandParent, ?GrandChild).
grandparent(X, Y) :-
parent(X, Z),
parent(Z, Y).

% grandmother(?GrandMother, ?GrandChild).
grandmother(X, Y) :-
grandparent(X, Y),
female(X).

% grandfather(?Grandfather, ?GrandChild). 
grandfather(X, Y) :-
grandparent(X, Y),
male(X).

% siblings(?Sibling1, ?Sibling2).
siblings(X, Y) :-
parent(P1, X),
parent(P1, Y),
parent(P2, X),
parent(P2, Y), 
P1 @< P2,
X \= Y.

%halfSiblings(?Sibling1, Sibling2).
halfSiblings(X, Y) :-
parent(P, X),
parent(P, Y),
X @< Y,
\+siblings(X, Y).

%cousins(?Cousin1, ?Cousin2).
cousins(X, Y) :-
parent(P1, X),
parent(P2, Y),
siblings(P1, P2),
X @< Y.

%uncle(?Uncle, ?Nefew).
uncle(X, Y) :-
parent(P, Y),
siblings(X, P),
male(X).

%married(?Husband, ?Wife, ?Year).
married(jay, gloria, 2008).
married(jay, dede, 1968).

% divorced(?Husband, ?Wife, ?Year).

divorced(jay, dede, 2003).


%currently_married(?Husband, ?Wife, +Year)

currently_married(H,W,Y) :-
married(H,W,Y1),
Y1 =< Y,
\+divorced(H,W,_).

currently_married(H,W,Y) :-
married(H,W,Y1),
Y1 =< Y,
divorced(H,W,Y2),
Y2 >= Y.