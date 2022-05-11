% Este problema testea la contradiccion con varias afirmaciones
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

afirmacionLugar(fernando, felipe, casa, 1).
afirmacionLugar(nico, nacho, plaza_de_armas, 4).
afirmacionLugar(nacho, fernando, plaza_de_armas, 5).
afirmacionLugar(nacho, felipe, irarrazaval, 3).
afirmacionLugar(fernando, felipe, irarrazaval, 3). 
afirmacionLugar(fernando, nacho, irarrazaval, 3).

% Aqui se produce una contradiccion de fernando y nico
afirmacionLugar(fernando, nico, casa, 8).
afirmacionLugar(nico, fernando, casa, 8).


descubrimiento(plaza_de_armas, 8).

