:-use_module(library(ordsets)).

leciona(algoritmos, adalberto).
leciona('bases de dados', bernardete).
leciona(compiladores, capitolino).
leciona(estatistica, diogenes).
leciona(redes, ermelinda).

% frequenta(?UC, ?Estudante).

frequenta(algoritmos, alberto).
frequenta(algoritmos, bruna).
frequenta(algoritmos, cristina).
frequenta(algoritmos, diogo).
frequenta(algoritmos, eduarda).

frequenta('bases de dados', antonio).
frequenta('bases de dados', bruno).
frequenta('bases de dados', cristina).
frequenta('bases de dados', duarte).
frequenta('bases de dados', eduardo).

frequenta(compiladores, alberto).
frequenta(compiladores, bernardo).
frequenta(compiladores, clara).
frequenta(compiladores, diana).
frequenta(compiladores, eurico).

frequenta(estatistica, antonio).
frequenta(estatistica, bruna).
frequenta(estatistica, claudio).
frequenta(estatistica, duarte).
frequenta(estatistica, eva).

frequenta(redes, alvaro).
frequenta(redes, beatriz).
frequenta(redes, claudio).
frequenta(redes, diana).
frequenta(redes, eduardo).

aluno(X, Y) :- frequenta(UC, X), leciona(UC, Y).

colega(X, Y, UC) :- frequenta(UC, X), frequenta(UC, Y), (X \= Y).

%%%a

%teachers(-T).

teachers(T):-
    findall(Teacher, leciona(_, Teacher), T).

%%%b

teachers1(T):-
    setof(Teacher, UC^leciona(UC, Teacher), T).


%%%c

%students_of(+T, -S).

students_of(T, S):-
    setof(Student, aluno(Student, T), S).



%%%d

% teachers_of(+S, -T).

teachers_of(S, T):-
    setof(Teacher, aluno(S, Teacher), T).

%%%e

% common_courses(+S1, +S2, -C).

common_courses(S1, S2, C):-
    setof(Course, colega(S1, S2, Course), C).

%%%f

%more_than_one_course(-L).

more_than_one_course_aux(Student):-
    frequenta(UC1, Student),
    frequenta(UC2, Student),
    UC1 \= UC2.

more_than_one_course(L):-
    setof(Student, more_than_one_course_aux(Student), L).

%%%g 

% strangers(-L).

strangers(L):-
    setof(S1-S2, (UC1, UC2)^(frequenta(UC1, S1), frequenta(UC2, S2), S1 \= S2), L1),
    setof(S1-S2, UC^colega(S1, S2, UC), L2),
    ord_subtract(L1, L2, L).

%%%h

% good_groups(-L).

good_group(S1-S2):-
    common_courses(S1, S2, L),
    length(L, N),
    N > 1.

good_groups(L):-
    setof(S1-S2, good_group(S1-S2), L).