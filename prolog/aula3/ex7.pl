%class(Course, ClassType, DayOfWeek, Time, Duration)
class(pfl, t, '1 Seg', 11, 1).
class(pfl, t, '4 Qui', 10, 1).
class(pfl, tp, '2 Ter', 10.5, 2).
class(lbaw, t, '1 Seg', 8, 2).
class(lbaw, tp, '3 Qua', 10.5, 2).
class(ltw, t, '1 Seg', 10, 1).
class(ltw, t, '4 Qui', 11, 1).
class(ltw, tp, '5 Sex', 8.5, 2).
class(fsi, t, '1 Seg', 12, 1).
class(fsi, t, '4 Qui', 12, 1).
class(fsi, tp, '3 Qua', 8.5, 2).
class(rc, t, '4 Qui', 8, 2).
class(rc, tp, '5 Sex', 10.5, 2).


%%%a

%same_day(+UC1, +UC2).

same_day(UC1, UC2):-
    class(UC1, _, Day, _, _),
    class(UC2, _, Day, _, _).

%%%b

%daily_courses(+Day, -Courses).

daily_courses(Day, Courses):-
    findall(UC, class(UC, _, Day, _, _), Courses).


%%%c

%short_cLasses(-L).

short_classes(L):- 
    findall(UC-Day/Time, Dur^(class(UC, _, Day, Time, Dur), Dur < 2), L).


%%%d

%course_classes(+Course, -Classes).

course_classes(Course, Classes):-
    findall(D/T-CT, class(Course, CT, D, T, _), Classes).

%%%e

% courses(-L).

courses(-L):-
    setof(UC, (CT, D, T, Dur)^class(UC, CT, D, T, Dur),L).

%%%f

%schedule.

schedule:-
    setof(D-T-UC-CT-Dur, class(UC, CT, D, T, Dur), L),
    print_schedule(L).

print_schedule([]).
print_schedule([D-T-UC-CT-Dur|UCs]):-
    format('~a ~a - ~a ~2f (~2f) ~N', [UC, CT, D, T, Dur]),
    print_schedule(UCs).


%%%g

convert_day('1 Seg', seg).
convert_day('2 Ter', ter).
convert_day('3 Qua', qua).
convert_day('4 Qui', qui).
convert_day('5 Sex', sex).

show(Day-Time-Course-Type-Duration, BetterDay-Time-Course-Type-Duration):- convert_day(Day, BetterDay).

better_print([]).
better_print([D-T-UC-CT-Dur|UCs]):-
    show(D-T-UC-CT-Dur, BD-T-UC-CT-Dur),
    format('~a ~a - ~a ~2f (~2f) ~N', [UC, CT, BD, T, Dur]),
    better_print(UCs).

better_schedule:-
    setof(D-T-UC-CT-Dur, class(UC, CT, D, T, Dur), L),
    better_print(L).
    

%%%h

%find_class.

find_class:-
    write('Day: '),
    read(D),
    write('Time: '),
    read(T),
    class(UC, _, D, T1, Dur),
    T >= T1,
    T =< T1 + Dur,
    format('~a - ~2f (~2f) ~N', [UC, T1, Dur]).
