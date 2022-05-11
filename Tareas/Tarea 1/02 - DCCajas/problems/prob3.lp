% >> Definición del problema <<
% Se resuelve con bound = 23.
rangeX(0..9).
rangeY(0..9).

robot(0).
box(0).

robotOn(0,0,9,0).

boxOn(0,0,0,0,0).

goal(2,9).

obstacle(1,0..3).
obstacle(1,5..9).

obstacle(1..6,3).

obstacle(1..3,7).

obstacle(3..5,0..1).

obstacle(3..5,5).
obstacle(5,5..7).

obstacle(8, 0..8).

