% Mapa: map101.lp
% Culpable: Maggie
% Sospechoso: Marge 
% Dificultad: MEDIUM
tiempo(1..10).

persona(bart).
persona(lisa).
persona(marge).
persona(maggie).
persona(homero).


afirmacionLugar(bart, lisa, cocina, 5).
afirmacionLugar(lisa, bart, entrada, 2).
afirmacionLugar(maggie, homero, callefalsa123, 5).
afirmacionLugar(homero, marge, pieza1, 5).
afirmacionLugar(homero, bart, cocina, 4).
afirmacionLugar(maggie, lisa, bano1, 7).
afirmacionLugar(lisa, marge, entrada, 7).
afirmacionLugar(bart, marge, living, 6).
afirmacionLugar(marge, homero, pieza1, 1).
afirmacionLugar(bart, marge, pieza1, 2).
afirmacionLugar(marge, marge, pieza1, 3).

descubrimiento(pieza1, 7).