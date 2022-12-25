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



%%% a

% children(+Person, -Children).

children(Person, Children) :-
    findall(Child, parent(Person, Child), Children).

%%%b

% children_of(+ListOfPeople, -ListOfPairs).

children_of([], []).
children_of([Person|Rest], [Person-Children|List]):-
    children(Person, Children),
    children_of(Rest, List).

%%%c

%family(-F).

related(P1, P2):-
    parent(P1, P2).
related(P1, P2):-
    parent(P2, P1).

family(F):-
    setof(Person, Relative^related(Person, Relative), F).

%%%d

%couple(?C).

couple(P1-P2):-
    parent(P1, X),
    parent(P2, X),
    P1 \= P2.

%%%e

%couples(-List).

couples(L):-
    setof(X, couple(X), L).


%%%f

%spouse_children(+Person, -SC).

spouse_children(Person, Spouse/Children):-
    setof(Child, (couple(Person-Spouse), parent(Person, Child), parent(Spouse, Child)), Children).


%%%g

%immediate_family(+Person, -PC).

immediate_family(Person, Parents-SC):-
    findall(Parent, parent(Parent, Person), Parents),
    findall(SpouseChildren, spouse_children(Person, SpouseChildren), SC).

%%%h

%parents_of_two(-Parents).

parent_of_two(Parent):-
    setof(Child, parent(Parent, Child), Children),
    length(Children, NChildren),
    NChildren >= 2.

parents_of_two(Parents):-
    setof(Parent, parent_of_two(Parent), Parents). 
