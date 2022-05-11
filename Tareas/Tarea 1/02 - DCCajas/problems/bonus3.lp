% >> Definición del problema <<
% Se resuelve con bound = 14 (AL MENOS).
rangeX(0..5).
rangeY(0..5).

robot(0..1).
box(0..3).

robotOn(0,1,2,0).
robotOn(1,1,4,0).

boxOn(0,3,2,0,0).
boxOn(1,2,2,0,0).
boxOn(2,3,4,0,0).
boxOn(3,2,4,0,0).

goal(5,2).
goal(4,2).
goal(5,4).
goal(4,4)

obstacle(0..5,0..1).
obstacle(0..5,3).
obstacle(0..5,5).
