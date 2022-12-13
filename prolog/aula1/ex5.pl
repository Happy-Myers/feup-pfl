cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).

chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).

% chefe(?Chefe, ?Empregado).
chefe(X, Y) :-
    cargo(C1, X),
    chefiado_por(C2, C1),
    cargo(C2, Y).

mesmo_chefe(X, Y) :-
    cargo(C1, X),
    cargo(C2, Y),
    chefiado_por(C1, B1),
    chefiado_por(C2, B2),
    compare(=, B1, B2).

nao_responsaveis(Cargos) :-
    findall(Cargo, (cargo(Cargo, _) , \+chefiado_por(_, Cargo)), Cargos1),
    sort(Cargos1, Cargos).
