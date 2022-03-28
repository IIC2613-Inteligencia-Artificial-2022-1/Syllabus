% calcado de clases: reglas

% u :- t, r.
% t.
% :- r. % RESTRICCIONES
% p; q :- r, s.

% saquemos la r como condicion de la ultima regla

% reglas 2
% u :- t, r.
% t.
% s.
% :- r.
% p; q :-  s.

% % mundos posibles
% a:- q.
% edad(35) :- q.
% muerto(pepito) :- q.

% descartar mundos posibles
% a.
% p;q;r :- a.
% % :- r.