% >> Definición del problema <<
% Se resuelve con bound = 14 (AL MENOS).
rangeX(0..5).
rangeY(0..5).

robot(0).
box(0..1).

robotOn(0,1,2,0).

boxOn(0,3,2,0,0).
boxOn(1,2,2,0,0).

goal(5,2).
goal(4,2).

obstacle(0..5,0..1).
obstacle(0..5,3..5).
