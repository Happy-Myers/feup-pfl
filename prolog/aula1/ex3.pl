%%% a

pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

% team(Pilot, Team).

team(lamb, breitling).
team(besenyei, 'red bull').
team(chambliss, 'red bull').
team(maclean, mdt).
team(mangold, cobra).
team(jones, matador).
team(bonhomme, matador).

% plane(Pilot, Plane).

plane(lamb, mx2).
plane(besenyei, edge540).
plane(chambliss, edge540).
plane(maclean, edge540).
plane(mangold, edge540).
plane(jones, edge540).
plane(bonhomme, edge540).

circuit(istanbul).
circuit(budapest).
circuit(porto).

% win(Pilot, Circuit).

win(jones, porto).
win(mangold, budapest).
win(mangold, istanbul).

gates(istanbul, 9).
gates(budapest, 6).
gates(porto, 5).

teamWin(Circuit, Team) :-
    win(Pilot, Circuit),
    team(Pilot, Team).


