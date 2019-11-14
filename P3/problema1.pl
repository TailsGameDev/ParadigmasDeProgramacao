% Relacao de filmes
%    filme(id, titulo, ano, diretor, nacionalidade).
%
filme(f1, 'Monty Python: O Sentido da Vida', 1983, 'Terry Jones', uk).
filme(f2, 'Edukators', 2004, 'Hans Weingartner', de).
filme(f3, 'Lavoura Arcaica', 2001, 'Luiz Fernando Carvalho', br).
filme(f4, 'Lisbela e o Prisioneira', 2003, 'Guel Arraes', br).
filme(f5, 'Abril despedacado', 2001, 'Walter Salles', br).
filme(f6, 'Diarios de motocicleta', 2004, 'Walter Salles', br).

% Relacao de paises
%     pais(sigla, nome).
%
pais(uk, 'Unided Kingdom').
pais(de, 'Alemanha').
pais(br, 'Brasil').

% Relacao de DVD (a caixa em si)
%     dvd(id do DVD, id do filme, estante).
%
dvd(d1, f1, est1).
dvd(d2, f2, est1).
dvd(d4, f4, est1).
dvd(d3, f3, est2).
dvd(d5, f5, est3).
dvd(d6, f1, est1).
dvd(d7, f2, est4).
dvd(d8, f2, est4).Titulos

% Relacao de clientes
%     cliente(cod, nome, telefone).
%
cliente(c1, 'Bob', '333-3112').
cliente(c2, 'Zeca', '245-1099').
cliente(c3, 'Tom', '323-0685').
cliente(c4, 'Bianca', '333-4391').
cliente(c5, 'Alice', '251-7439').
cliente(c6, 'Maria', '212-3271').

% Relacao de locacoes
%     locacao(cod cliente, nro do DVD, data de entrega)
%
locacao(c1, d1, '2005-11-07').
locacao(c1, d2, '2005-11-07').
locacao(c3, d5, '2005-11-09').
locacao(c2, d3, '2005-11-10').
locacao(c3, d3, '2005-11-11').
locacao(c4, d8, '2005-11-12').
locacao(c5, d7, '2005-11-12').
locacao(c6, d6, '2005-11-12').
locacao(c1, d5, '2005-11-13').
locacao(c1, d6, '2005-11-13').
locacao(c6, d2, '2005-11-14').
locacao(c3, d7, '2005-11-14').
locacao(c3, d8, '2005-11-14').
locacao(c5, d1, '2005-11-15').

% Questao A

% ?- findall(T, (locacao(C1, D, _), locacao(C2, D, _), dvd(D, F, _), filme(F, T, _, _, _), C1 \== C2), Titulos), list_to_set(Titulos, TitulosSemRepeticao).
% Titulos = ['Edukators', 'Abril despedacado', 'Lavoura Arcaica', 'Lavoura Arcaica', 'Edukators', 'Edukators', 'Abril despedacado', 'Edukators', 'Edukators'|...],
% TitulosSemRepeticao = ['Edukators', 'Abril despedacado', 'Lavoura Arcaica'].oes).

% Questao B

% ?- findall(P, (cliente(C, 'Tom', _), locacao(C, DVD, Data), compare(O1, '2005-11-10', Data), compare(O2, '2005-11-15', Data),
% O1 == (<), O2 == (>), dvd(DVD, F, _), filme(F, _, _, _, P)), Paises).
% Paises = [br, de, de].

% Questao C

% ?- findall(F, (cliente(C1, 'Bob', _), cliente(C2, 'Tom', _), locacao(C1, DVD1, _), locacao(C2, DVD2, _), dvd(DVD1, F, _), dvd(DVD2, F, _), filme(F, _, A, _, P), A > 2000, P \== br), Filmes), list_to_set(Filmes, FilmesSemRepeticao), length(FilmesSemRepeticao, N).
% Filmes = [f2, f2],
% FilmesSemRepeticao = [f2],
% N = 1.

% Questao D

% ?- bagof(T, I ^ A ^ D ^ (filme(I, T, A, D, P), A > 2000), Filmes).
% P = br,
% Filmes = ['Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despedacado', 'Diarios de motocicleta'] ;
% P = de,
% Filmes = ['Edukators'].
