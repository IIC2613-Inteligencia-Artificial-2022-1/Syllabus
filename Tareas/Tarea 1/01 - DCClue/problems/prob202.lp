% Este problema testea que no se produzcan contradicciones en el traslado, es decir que las personas
% no puedan teletransportase
% Culpable es Fernando
tiempo(1..10).

persona(nacho).
persona(felipe).
persona(nico).
persona(fernando).

% Datos que son ciertos
personaEnLugar(nacho, u, 1).
personaEnLugar(felipe, casa, 1).
personaEnLugar(nacho, plaza_de_armas, 3).

% Afirmaciones

% No es posible que nacho este en el tiempo 2 en plaza de armas debido a que necesita 2 tiempos para desplazarse desde u
afirmacionLugar(fernando, nacho, plaza_de_armas, 2).

afirmacionLugar(fernando, felipe, casa, 1).
afirmacionLugar(nico, nacho, plaza_de_armas, 4).
afirmacionLugar(nacho, fernando, plaza_de_armas, 5).
afirmacionLugar(nacho, felipe, irarrazaval, 3).
afirmacionLugar(fernando, felipe, irarrazaval, 3). 
afirmacionLugar(fernando, nacho, irarrazaval, 8).


descubrimiento(plaza_de_armas, 8).

