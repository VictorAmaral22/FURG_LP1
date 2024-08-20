% Definição dos fatos
passaro(tweety).
peixe(goldie).
minhoca(molie).
gato(silvester).

% Definição das preferências
gosta(passaro, minhoca).
gosta(gato, peixe).
gosta(gato, passaro).
gosta(amigos, uns_dos_outros).

% Relações de amizade
amigo(silvester, eu).

% Comer o que gosta
come(Silvester, Algo) :- gosta(gato, Algo), gato(Silvester).

% Fatos específicos sobre Silvester
gato(silvester).
gosta(silvester, tudo_que_gosta).

% Determinando tudo o que o Silvester come
% Consulta: come(silvester, Algo).