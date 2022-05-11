% Este problema testea la contradiccion entre varias afirmaciones, el culpable deberia ser nico

tiempo(1..20).

persona(nacho).
persona(felipe).
persona(nico).
persona(fernando).
persona(pablo).
persona(juan).
persona(pedro).

% Datos que son ciertos
personaEnLugar(nacho, a, 3).
personaEnLugar(pedro, a, 8).

% Afirmaciones

afirmacionLugar(fernando, felipe, a, 1).
afirmacionLugar(nico,     felipe, b, 4).
afirmacionLugar(pablo,    felipe, b, 8).
afirmacionLugar(pedro,    felipe, g, 5).
afirmacionLugar(nacho, fernando,  c, 5).
afirmacionLugar(nacho, fernando,  e, 3).
afirmacionLugar(pablo, nacho, b, 14).
afirmacionLugar(nico, fernando, a, 19).
afirmacionLugar(fernando, pablo, f, 3). 
afirmacionLugar(nico, nico, g, 1). 
afirmacionLugar(nacho, nico, g, 1). 
afirmacionLugar(nacho, pedro, g, 19). 
afirmacionLugar(juan, fernando, c, 20). 



descubrimiento(g, 18).

