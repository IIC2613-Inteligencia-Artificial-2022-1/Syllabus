% Personas
persona(tomHolland).
persona(andrewGarfield).
persona(tobeyMaguire).
persona(christianBale).
persona(robertPattinson).
persona(benAffleck).

% Hay a lo más un Batman
{spiderman(A) : persona(A)} 1.

% Hay a lo más un Spiderman
{batman(A) : persona(A)} 1.

% Como queda la lista de modelos?

% No puede haber un Batman y un Spiderman en el Mismo Universo
:- batman(P1), spiderman(P2), persona(P1), persona(P2).

% Cada actor no puede representar a otro personaje
:- spiderman(christianBale).
:- spiderman(benAffleck).
:- spiderman(robertPattinson).
:- batman(tomHolland).
:- batman(andrewGarfield).
:- batman(tobeyMaguire).

% Si hay un Batman estamos en el universo de DC
universo(dc) :- batman(P), persona(P).
% Si hay un Spiderman estamos en el universo de Marvel
universo(marvel) :- spiderman(P), persona(P).
% Si no estamos en el universo de Marvel ni de DC estamos en la dimensión C-137
universo(c137) :- not universo(dc), not universo(marvel).

#show spiderman/1.
#show batman/1.
#show universo/1.