%%%a
% leciona(?UC, ?Professor).

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

%%%c

%student_of(?Estudante, ?Erofessor)

student(Student, Professor) :-
    frequenta(X, Student),
    leciona(X, Professor).


%students_of(+Professor, -Students).
students(Professor, Students) :-
    bagof(Student, student(Student, Professor), Students).

%teachers_of(+Student, -Teachers).

teachers(Student, Teachers) :-
    bagof(Teacher, student(Student, Teacher), Teachers).


shared_student(T1, T2, S) :-
    student(S, T1),
    student(S, T2),
    T1 @< T2.

colega(P1, P2) :-
    frequenta(UC, P1),
    frequenta(UC, P2),
    P1 @< P2.


colega(P1, P2) :-
    leciona(_, P1),
    leciona(_,P2),
    P1 @< P2.

multipleUc(Student):-
frequenta(UC1, Student),
frequenta(UC2, Student),
UC1 @< UC2.