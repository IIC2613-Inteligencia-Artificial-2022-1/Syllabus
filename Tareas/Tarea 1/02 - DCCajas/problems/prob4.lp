% >> Definición del problema <<
% Se resuelve con bound = 23.
rangeX(0..9).
rangeY(0..9).

robot(0..2).
box(0..2).

robotOn(0,0,9,0).
robotOn(1,6,8,0).
robotOn(2,5,4,0).

boxOn(0,0,0,0,0).
boxOn(1,4,9,0,0).
boxOn(2,7,0,0,0).

goal(2,9).
goal(2,0).
goal(9,0).

obstacle(1,0..3).
obstacle(1,5..9).

obstacle(1..6,3).

obstacle(1..3,7).

obstacle(3..5,0..1).

obstacle(3..5,5).
obstacle(5,5..7).

obstacle(8, 0..8).

obstacle(5,9).
