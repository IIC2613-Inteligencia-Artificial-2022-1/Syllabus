% Mapa: map101.lp
% Culpable: Marge
% Sospechoso: Bart 
% Dificultad: Hard
tiempo(1..10).

persona(bart).
persona(lisa).
persona(marge).
persona(maggie).
persona(homero).

% Bart
afirmacionLugar(bart, marge, bano1, 1).
afirmacionLugar(bart,homero, patio, 5).
afirmacionLugar(bart, lisa, bano1, 2).

% Lisa
afirmacionLugar(lisa, marge, pieza1, 2).
afirmacionLugar(lisa, homero, living, 4).

% Maggie
afirmacionLugar(maggie, marge, living, 3).
afirmacionLugar(maggie, homero, pieza2, 3).
afirmacionLugar(maggie, bart, entrada, 3).
afirmacionLugar(maggie, lisa, pieza1, 3).

% Homero
afirmacionLugar(homero, homero, bano2, 2).
afirmacionLugar(homero, bart, entrada, 2).

% Marge (Culpable)
afirmacionLugar(marge, bart, living, 1).
afirmacionLugar(marge, lisa, bano1, 2).
% Esta afirmación deja culpable a Marge, ya que Lisa no puede ir al baño 2 en el tiempo
% 6 porque estaba en la pieza1 en el timepo 3 y no puede estar en el living en el tiempo 
% 4 porque está Homero y puede llegar minimo en el tiempo 7 al baño2
afirmacionLugar(marge, lisa,bano2, 6).


descubrimiento(entrada, 9).