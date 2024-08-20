% Definindo os membros da família e suas relações
homem(homer).
homem(abraham).
homem(herb).
homem(clancy).
homem(bart).

mulher(marge).
mulher(maggie).
mulher(lisa).
mulher(selma).
mulher(patty).
mulher(mona).
mulher(jacqueline).

pai(abraham, homer).
pai(clancy, marge).
pai(homer, bart).
pai(homer, lisa).
pai(homer, maggie).

mae(mona, homer).
mae(jacqueline, marge).
mae(marge, bart).
mae(marge, lisa).
mae(marge, maggie).

irmao(herb, homer).
irma(selma, marge).
irma(patty, marge).

casados(marge, homer).
casados(selma, maridoSelma).

% Regras adicionais para facilitar consultas
tia(Tia, Sobrinho) :- 
    mulher(Tia),
    (irma(Tia, Mae), mae(Mae, Sobrinho));
    (irma(Tia, Pai), pai(Pai, Sobrinho)).

tio(Tio, Sobrinho) :- 
    homem(Tio),
    (irmao(Tio, Mae), mae(Mae, Sobrinho));
    (irmao(Tio, Pai), pai(Pai, Sobrinho)).

primo(Primo, Pessoa) :- 
    (pai(Pai, Primo), irmao(Pai, PaiPessoa), pai(PaiPessoa, Pessoa));
    (mae(Mae, Primo), irma(Mae, MaePessoa), mae(MaePessoa, Pessoa)).

% Consultas solicitadas

% a. Quem são as mulheres da família?
% Consultar: mulher(X).

% b. Quem são os tios e tias do Bart por parte de mãe?
% Consultar: tia(X, bart), pai(_, bart), mae(Y, bart).

% c. Quem são os tios e tias do Bart por parte de pai?
% Consultar: tio(X, bart), pai(_, bart), mae(_, bart).

% d. Quem são os tios e tias do Bart que se casaram com parentes seus (dos dois lados juntos, pai e mãe)?
% Consultar: (tio(X, bart); tia(X, bart)), casados(X, Y).

% e. Quem são os primos do Bart por parte de pai?
% Consultar: primo(X, bart), pai(_, bart).

% f. Quem são os primos do Bart por parte de mãe?
% Consultar: primo(X, bart), mae(_, bart).
