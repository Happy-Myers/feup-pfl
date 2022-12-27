:- dynamic male/1, female/1, parent/2.


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


%%%a

%add_person.

save_person(male, Name):- assert(male(Name)).
save_person(female, Name):- assert(female(Name)).

add_person:-
    format('male/female?~n', []),
    read(Gender), nl,
    format('first name?~n', []),
    read(Name),
    save_person(Gender, Name).


%%%b

%add_parents(+Person).

save_parents(P1, P2, Person):-
    assert(parent(P1, Person)),
    assert(parent(P2, Person)).

add_parents(Person):-
    format('~a\'s parents (P1-P2):~n', [Person]),
    read(P1-P2),
    save_parents(P1, P2, Person).
    

%%%c

%remove_person.

delete_person(Person):-
    male(Person),
    retract(male(Person)).
delete_person(Person):-
    female(Person),
    retract(female(Person)).

remove_person:-
    format('person to remove:~n', []),
    read(Person), nl,
    delete_person(Person),
    retractall(parent(_, Person)),
    retractall(parent(Person, _)).