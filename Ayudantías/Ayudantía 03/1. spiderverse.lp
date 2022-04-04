% Cuerpo Vacío 
spiderman(tobeyMaguire), spiderman(andrewGarfield), spiderman(tomHolland) :- .
% Cual será el output?

% Que pasa si Tom Holland implica a Andrew Garfield?
spiderman(andrewGarfield) :- spiderman(tomHolland).
spiderman(tobeyMaguire) :- spiderman(andrewGarfield).
spiderman(andrewGarfield) :- spiderman(tobeyMaguire).
spiderman(tomHolland) :- spiderman(tobeyMaguire).