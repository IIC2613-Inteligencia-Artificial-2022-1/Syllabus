% Mapa: map101.lp
% Culpable: Homero
% Sospechoso: No hay
% Dificultad: Medium
tiempo(1..10).

persona(bart).
persona(lisa).
persona(marge).
persona(maggie).
persona(homero).

% Bart
afirmacionLugar(bart, marge, bano1, 1).

% Lisa
afirmacionLugar(lisa, bart, bano0, 2).

% Marge
afirmacionLugar(marge, bart, cocina, 4).

% Maggie 
% Como Maggie estaba en la pieza1 en el timepo 2, marge no alcanza a llegar en el timepo 5 al baño 2
afirmacionLugar(maggie, maggie, pieza1, 2).

% Homero
afirmacionLugar(homero, marge, bano2, 5).

descubrimiento(living, 9).