% >> Definición del problema <<
% Se resuelve con bound = 10.
rangeX(0..5).
rangeY(0..5).

robot(0).
box(0..1).

robotOn(0,3,3,0).

boxOn(0,2,3,0,0).
boxOn(1,4,3,0,0).

goal(3,5).
goal(3,0).

obstacle(0..1,0..5).

obstacle(2,0..2).
obstacle(2,4..5).

obstacle(4,0..2).
obstacle(4,4..5).

obstacle(5,0..5).
