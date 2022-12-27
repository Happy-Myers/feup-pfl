:-use_module(library(lists)).

%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

%%%a

%get_all_nodes(-ListOfAirports).

direct_flight(Origin, Destination, Code):-
    flight(Origin, Destination, _, Code, _, _).

get_all_nodes(L):-
    findall(Airport, (direct_flight(Airport, _, _); direct_flight(_, Airport, _)), L1),
    sort(L1, L).


%%%b

% most_diversified(-Company).

score(Company, Score) :-
    findall(Destination, flight(_, Destination, Company, _, _, _), L),
    sort(L, L1),
    length(L1, Score).

most_diversified([Company], Company).
most_diversified([Company| T], Company):-
    most_diversified(T, C1),
    score(Company, S1),
    score(C1, S2),
    S1 >= S2.
most_diversified([Competitor|T], Company):-
    score(Competitor, S1),
    score(Company, S2),
    S2 >= S1,
    most_diversified(T, Company).

most_diversified(Company):-
    setof(Company, (Or, Des, Code, H, Dur)^(flight(Or, Des, Company, Code, H, Dur)), L),
    most_diversified(L, Company).


%%%c

%find_flights(+Origin, +Destination, -Flights).

find_flights(Ni, Nf, Fs):-
    dfs([Ni], Nf, Fs).

dfs([Nf|_], Nf, []).
dfs([Na|T], Nf, [F|Fs]):-
    direct_flight(Na, Nb, F),
    \+member(Nb,[Na|T]),
    dfs([Nb, Na|T], Nf, Fs).


%%%d

%find_flights_breadth(+Origin, +Destination, -Flights).

find_flights_breadth(Ni, Nf, Fs):-
    get_all_nodes(Ns),
    member(Ni, Ns),
    bfs([[Ni]-[]], Nf, FsInv),
    reverse(FsInv, Fs).

bfs([[Nf|_]-Fs|_],Nf,Fs).
bfs([[Na|T]-Fs|Ns],Nf,Sol):-
    findall([Nb,Na|T]-[F|Fs], (direct_flight(Na,Nb,F), \+member(Nb,[Na|T])), Ns1),
    append(Ns,Ns1,Ns2),
    bfs(Ns2,Nf,Sol).


%%%e

% find_all_flights(+Origin, +Destination, -ListOfFlights).


