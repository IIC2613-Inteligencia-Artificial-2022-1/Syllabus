%  cómo se usan bien las constantes y predicados? 

estudiante(a;b;c;d).
nocopia(a;b;d).

% aprueba(X) :- estudiante(X).
aprueba(X) :- estudiante(X), nocopia(X).

% version con not, para prepararse

% como mostramos solo lo que nos importa?
#show aprueba/1.
% qué es la aridad? --> ej 3